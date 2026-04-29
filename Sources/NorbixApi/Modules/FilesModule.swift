import Foundation
import NorbixCore

/// File operations on the API plane.
///
/// **Uploading.** The SDK does not upload bytes itself. The flow is:
///
/// 1. Call `sign(originalFileName:contentType:sizeBytes:)` to get a
///    `SignedUploadResponse` from Norbix.
/// 2. Send the file bytes directly to `response.url` from your app code,
///    using the method and headers Norbix returned. Bytes never round-trip
///    through Norbix, which keeps mobile networks fast and avoids paying for
///    egress twice.
///
/// **Downloading.** Use `download(id:)` to get raw `Data`, or `download(id:to:)`
/// to write straight to a local file URL.
public final class FilesModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    // MARK: - Untyped (dictionary) — fallback for advanced callers

    /// Raw `list` — returns the parsed JSON for callers who want to handle
    /// the response shape themselves.
    public func list(
        _ request: [String: Any] = [:],
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> Any? {
        try await transport.send(
            path: "/{version}/files",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Raw `getInfo` — returns the parsed JSON for callers who want full
    /// access to provider-specific metadata.
    public func getInfo(
        id: String,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> Any? {
        try await transport.send(
            path: "/{version}/files/{id}",
            method: "GET",
            request: ["id": id],
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Raw `sign` — returns the parsed JSON.
    public func sign(
        _ request: [String: Any] = [:],
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> Any? {
        try await transport.send(
            path: "/{version}/files/sign",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }
}

// MARK: - Typed (Codable) overlay

public extension FilesModule {
    /// List files in the project.
    ///
    /// ```swift
    /// let page: Page<FileInfo> = try await client.files.list(take: 50)
    /// for file in page.items { print(file.originalFileName ?? file.id) }
    /// ```
    func list(
        take: Int? = nil,
        skip: Int? = nil,
        query: [String: Any] = [:],
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> Page<FileInfo> {
        var req = query
        if let take { req["take"] = take }
        if let skip { req["skip"] = skip }
        return try await transport.send(
            path: "/{version}/files",
            method: "GET",
            request: req,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            as: Page<FileInfo>.self
        )
    }

    /// Get metadata for a single file.
    ///
    /// ```swift
    /// let file: FileInfo = try await client.files.getInfo(id: "f_123")
    /// ```
    func getInfo(
        id: String,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> FileInfo {
        try await transport.send(
            path: "/{version}/files/{id}",
            method: "GET",
            request: ["id": id],
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            as: FileInfo.self
        )
    }

    /// Ask Norbix for a pre-signed URL the client can upload directly to.
    ///
    /// ```swift
    /// let signed = try await client.files.sign(
    ///     originalFileName: "invoice.pdf",
    ///     contentType: "application/pdf",
    ///     sizeBytes: 12_345
    /// )
    /// // Upload bytes directly to the cloud provider:
    /// var req = URLRequest(url: URL(string: signed.url)!)
    /// req.httpMethod = signed.method ?? "PUT"
    /// for (k, v) in signed.headers ?? [:] { req.setValue(v, forHTTPHeaderField: k) }
    /// _ = try await URLSession.shared.upload(for: req, from: fileData)
    /// ```
    func sign(
        originalFileName: String,
        contentType: String? = nil,
        sizeBytes: Int? = nil,
        extra: [String: Any] = [:],
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> SignedUploadResponse {
        var req = extra
        req["originalFileName"] = originalFileName
        if let contentType { req["contentType"] = contentType }
        if let sizeBytes { req["sizeBytes"] = sizeBytes }
        return try await transport.send(
            path: "/{version}/files/sign",
            method: "POST",
            request: req,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            as: SignedUploadResponse.self
        )
    }

    /// Download the file body as raw `Data`.
    ///
    /// ```swift
    /// let bytes = try await client.files.download(id: "f_123")
    /// ```
    func download(
        id: String,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> Data {
        try await transport.downloadData(
            path: "/{version}/files/{id}/download",
            method: "GET",
            request: ["id": id],
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Download the file straight to a local URL.
    ///
    /// ```swift
    /// let dest = URL.temporaryDirectory.appending(path: "invoice.pdf")
    /// try await client.files.download(id: "f_123", to: dest)
    /// ```
    func download(
        id: String,
        to destination: URL,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws {
        let data = try await download(
            id: id, timeout: timeout, bearerToken: bearerToken
        )
        try data.write(to: destination, options: .atomic)
    }
}
