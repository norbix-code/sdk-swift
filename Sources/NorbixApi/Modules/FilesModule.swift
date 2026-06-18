import Foundation
import NorbixCore

// MARK: - Models

/// Where a stored file physically lives.
///
/// The gateway may send the provider as a name (`"AwsS3"`) or as its numeric
/// ordinal. Both are decoded; anything unrecognised becomes `.unknown` so a
/// new provider added on the server never breaks decoding.
public enum FileStorageProvider: String, Codable, Sendable, Equatable, CaseIterable {
    case local = "Local"
    case awsS3 = "AwsS3"
    case azureBlobStorage = "AzureBlobStorage"
    case googleCloudStorage = "GoogleCloudStorage"
    case ftp = "Ftp"
    case appleICloud = "AppleICloud"
    case dropBox = "DropBox"
    case googleDrive = "GoogleDrive"
    case unknown = "Unknown"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let name = try? container.decode(String.self) {
            self = FileStorageProvider.allCases.first {
                $0.rawValue.caseInsensitiveCompare(name) == .orderedSame
            } ?? .unknown
        } else if let ordinal = try? container.decode(Int.self) {
            // Ordinals must match the gateway `FileProvider` enum order.
            let byOrdinal: [FileStorageProvider] = [
                .local, .awsS3, .azureBlobStorage, .googleCloudStorage,
                .ftp, .appleICloud, .dropBox, .googleDrive
            ]
            self = (ordinal >= 0 && ordinal < byOrdinal.count) ? byOrdinal[ordinal] : .unknown
        } else {
            self = .unknown
        }
    }
}

/// Metadata of a single stored file.
public struct FileResource: Codable, Sendable, Equatable {
    /// File view-id, e.g. `nbfl_xxx`.
    public let id: String
    /// Original filename supplied at upload time, e.g. `invoice.pdf`.
    public let originalFileName: String?
    /// File extension without the dot, e.g. `pdf`. Maps to the wire field
    /// `extension` (renamed here because `extension` is a Swift keyword).
    public let fileExtension: String?
    /// Name the file is stored under inside the provider.
    public let storedFileName: String?
    /// File size in bytes, when the provider reports it.
    public let sizeBytes: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case originalFileName
        case fileExtension = "extension"
        case storedFileName
        case sizeBytes
    }

    public init(
        id: String,
        originalFileName: String? = nil,
        fileExtension: String? = nil,
        storedFileName: String? = nil,
        sizeBytes: Int? = nil
    ) {
        self.id = id
        self.originalFileName = originalFileName
        self.fileExtension = fileExtension
        self.storedFileName = storedFileName
        self.sizeBytes = sizeBytes
    }
}

/// A file together with where it lives — the files integration, the storage
/// provider, and the path/prefix inside that provider.
public struct FileRef: Codable, Sendable, Equatable {
    /// Metadata of the file itself.
    public let resource: FileResource
    /// Files integration the file belongs to, e.g. `nbin_xxx`.
    public let integrationId: String
    /// Storage provider that physically holds the file.
    public let provider: FileStorageProvider
    /// Provider path / prefix the file sits under.
    public let path: String
    /// Public URL of the file, when the provider exposes one.
    public let publicUrl: String?

    public init(
        resource: FileResource,
        integrationId: String,
        provider: FileStorageProvider,
        path: String,
        publicUrl: String? = nil
    ) {
        self.resource = resource
        self.integrationId = integrationId
        self.provider = provider
        self.path = path
        self.publicUrl = publicUrl
    }
}

/// One page of a path listing.
///
/// Norbix does not model folders as entities — object storage only has shared
/// key prefixes. A listing therefore returns the files directly under the
/// requested path plus the immediate sub-folder names (plain strings).
public struct FileListPage: Sendable {
    /// Files directly under the requested path (not recursive).
    public let files: [FileRef]
    /// Immediate sub-folder names one level down.
    public let folders: [String]
    /// `true` when more files can be fetched with `nextCursor`.
    public let hasMore: Bool
    /// Cursor to pass back as `startingAfter` to fetch the next page.
    public let nextCursor: String?

    public init(
        files: [FileRef] = [],
        folders: [String] = [],
        hasMore: Bool = false,
        nextCursor: String? = nil
    ) {
        self.files = files
        self.folders = folders
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

extension FileListPage: Decodable {
    private enum CodingKeys: String, CodingKey {
        case list
        case folders
    }

    /// Mirrors the gateway `PaginatedResponse<FileResourceRefDto>` block.
    private struct ListBlock: Decodable {
        let items: [FileRef]?
        let hasMore: Bool?
        let startingAfter: String?
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let block = try container.decodeIfPresent(ListBlock.self, forKey: .list)
        self.files = block?.items ?? []
        self.hasMore = block?.hasMore ?? false
        self.nextCursor = block?.startingAfter
        self.folders = try container.decodeIfPresent([String].self, forKey: .folders) ?? []
    }
}

/// Metadata for a single file plus its public-access info.
public struct FileDetails: Decodable, Sendable {
    /// The file, or `nil` when the gateway reported an error.
    public let file: FileRef?
    /// Read-only public-access flag from the provider ACL. `nil` means
    /// "unknown" — Norbix only reports public access, it does not manage it.
    public let isPublic: Bool?
    /// Public URL of the file, when known.
    public let publicUrl: String?

    public init(file: FileRef?, isPublic: Bool? = nil, publicUrl: String? = nil) {
        self.file = file
        self.isPublic = isPublic
        self.publicUrl = publicUrl
    }
}

/// Decodes the `{ "url": ... }` envelope shared by the upload-url and
/// signed-url endpoints. The sibling `responseStatus` field is ignored.
private struct FileUrlEnvelope: Decodable {
    let url: String?
}

// MARK: - Module

/// File operations on the API plane.
///
/// Every file lives inside a **files integration** (`integrationId`, e.g.
/// `nbin_xxx`) and is addressed by a **path** inside that integration's
/// storage. There is no global file id — `integrationId` + `path` identify
/// a file.
///
/// **Uploading** is a two-step, direct-to-provider flow so the bytes never
/// pass through Norbix:
///
/// 1. `requestUploadUrl(...)` — get a pre-signed `PUT` URL.
/// 2. PUT the file bytes to that URL yourself (e.g. with `URLSession`).
/// 3. `commitUpload(...)` — tell Norbix the upload finished.
///
/// **Downloading**: `getSignedUrl(...)` returns a URL the client downloads
/// straight from the provider, or `download(...)` streams the bytes through
/// the API.
public final class FilesModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    // MARK: - Upload

    /// Step 1 of an upload: ask the gateway for a pre-signed `PUT` URL the
    /// client uploads the file bytes to directly.
    ///
    /// ```swift
    /// let url = try await client.files.requestUploadUrl(
    ///     integrationId: "nbin_123",
    ///     path: "docs/invoice.pdf",
    ///     contentType: "application/pdf"
    /// )
    /// var req = URLRequest(url: URL(string: url)!)
    /// req.httpMethod = "PUT"
    /// _ = try await URLSession.shared.upload(for: req, from: fileData)
    /// ```
    ///
    /// - Returns: the pre-signed `PUT` URL.
    @discardableResult
    public func requestUploadUrl(
        integrationId: String,
        path: String,
        contentType: String,
        expirationSeconds: Int? = nil,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> String {
        var body: [String: Any] = [
            "filesIntegrationId": integrationId,
            "path": path,
            "contentType": contentType
        ]
        if let expirationSeconds { body["expirationSeconds"] = expirationSeconds }

        let envelope = try await transport.send(
            path: "/{version}/files/{filesIntegrationId}/upload-url",
            method: "POST",
            request: body,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            as: FileUrlEnvelope.self
        )
        return try Self.requireUrl(envelope.url)
    }

    /// Step 3 of an upload: confirm the bytes were uploaded so the gateway
    /// records the file. Call this after the `PUT` to `requestUploadUrl`'s
    /// URL succeeds.
    public func commitUpload(
        integrationId: String,
        path: String,
        contentType: String? = nil,
        sizeBytes: Int? = nil,
        fileName: String? = nil,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws {
        var body: [String: Any] = [
            "filesIntegrationId": integrationId,
            "path": path
        ]
        if let contentType { body["contentType"] = contentType }
        if let sizeBytes { body["sizeBytes"] = sizeBytes }
        if let fileName { body["fileName"] = fileName }

        _ = try await transport.send(
            path: "/{version}/files/{filesIntegrationId}/commit",
            method: "POST",
            request: body,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    // MARK: - Browse

    /// List the files and sub-folders directly under a path.
    ///
    /// ```swift
    /// let page = try await client.files.list(integrationId: "nbin_123", path: "docs")
    /// for file in page.files { print(file.resource.originalFileName ?? file.resource.id) }
    /// if page.hasMore {
    ///     let next = try await client.files.list(
    ///         integrationId: "nbin_123", path: "docs", startingAfter: page.nextCursor
    ///     )
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - path: Path prefix to list. `nil` or empty lists the root.
    ///   - pageSize: Number of files per page. Server default is 50.
    ///   - startingAfter: Cursor from a previous page's `nextCursor`.
    ///   - query: Extra raw query parameters for advanced callers.
    public func list(
        integrationId: String,
        path: String? = nil,
        pageSize: Int? = nil,
        startingAfter: String? = nil,
        query: [String: Any] = [:],
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> FileListPage {
        var req = query
        req["filesIntegrationId"] = integrationId
        if let path { req["path"] = path }
        if let paging = Self.pagingJsv(pageSize: pageSize, startingAfter: startingAfter) {
            req["paging"] = paging
        }
        return try await transport.send(
            path: "/{version}/files/{filesIntegrationId}",
            method: "GET",
            request: req,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            as: FileListPage.self
        )
    }

    /// Get metadata for a single file, including public-access info.
    ///
    /// ```swift
    /// let details = try await client.files.getInfo(
    ///     integrationId: "nbin_123", path: "docs/invoice.pdf"
    /// )
    /// print(details.file?.resource.sizeBytes ?? 0)
    /// ```
    public func getInfo(
        integrationId: String,
        path: String,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> FileDetails {
        try await transport.send(
            path: "/{version}/files/{filesIntegrationId}/info",
            method: "GET",
            request: ["filesIntegrationId": integrationId, "path": path],
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            as: FileDetails.self
        )
    }

    // MARK: - Download

    /// Get a pre-signed `GET` URL the client downloads straight from the
    /// storage provider. Prefer this over `download(...)` in UI code — the
    /// bytes do not pass through Norbix.
    ///
    /// - Returns: the pre-signed `GET` URL.
    @discardableResult
    public func getSignedUrl(
        integrationId: String,
        path: String,
        expirationSeconds: Int? = nil,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> String {
        var req: [String: Any] = ["filesIntegrationId": integrationId, "path": path]
        if let expirationSeconds { req["expirationSeconds"] = expirationSeconds }

        let envelope = try await transport.send(
            path: "/{version}/files/{filesIntegrationId}/sign",
            method: "GET",
            request: req,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            as: FileUrlEnvelope.self
        )
        return try Self.requireUrl(envelope.url)
    }

    /// Download the file body as raw `Data` (streamed through the API).
    public func download(
        integrationId: String,
        path: String,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> Data {
        try await transport.downloadData(
            path: "/{version}/files/{filesIntegrationId}/download",
            method: "GET",
            request: ["filesIntegrationId": integrationId, "path": path],
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Download the file straight to a local file URL.
    ///
    /// ```swift
    /// let dest = URL.temporaryDirectory.appending(path: "invoice.pdf")
    /// try await client.files.download(
    ///     integrationId: "nbin_123", path: "docs/invoice.pdf", to: dest
    /// )
    /// ```
    public func download(
        integrationId: String,
        path: String,
        to destination: URL,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws {
        let data = try await download(
            integrationId: integrationId,
            path: path,
            timeout: timeout,
            bearerToken: bearerToken
        )
        try data.write(to: destination, options: .atomic)
    }

    // MARK: - Delete

    /// Delete a single file from the storage provider.
    public func delete(
        integrationId: String,
        path: String,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws {
        _ = try await transport.send(
            path: "/{version}/files/{filesIntegrationId}",
            method: "DELETE",
            request: ["filesIntegrationId": integrationId, "path": path],
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Bulk-delete files from the storage provider (max 100 per call).
    public func deleteMany(
        integrationId: String,
        paths: [String],
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws {
        _ = try await transport.send(
            path: "/{version}/files/{filesIntegrationId}/bulk",
            method: "DELETE",
            request: ["filesIntegrationId": integrationId, "paths[]": paths],
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    // MARK: - Helpers

    private static func requireUrl(_ url: String?) throws -> String {
        guard let url, !url.isEmpty else {
            throw NorbixError(
                message: "The gateway response did not contain a URL.",
                code: "NORBIX_EMPTY_RESPONSE"
            )
        }
        return url
    }

    /// Builds the JSV value the gateway expects for the `paging` query
    /// parameter, e.g. `{pageSize:50,startingAfter:"cursor"}`.
    private static func pagingJsv(pageSize: Int?, startingAfter: String?) -> String? {
        var parts: [String] = []
        if let pageSize { parts.append("pageSize:\(pageSize)") }
        if let startingAfter {
            let escaped = startingAfter.replacingOccurrences(of: "\"", with: "\"\"")
            parts.append("startingAfter:\"\(escaped)\"")
        }
        guard !parts.isEmpty else { return nil }
        return "{\(parts.joined(separator: ","))}"
    }
}
