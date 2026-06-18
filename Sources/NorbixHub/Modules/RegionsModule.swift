import Foundation
import NorbixCore

/// Norbix regions — list the regions available to the account and update
/// which regions a project uses.
///
/// These endpoints manage the *set* of regions. To make requests *against* a
/// given region, set `region` on the client
/// (`NorbixHubClient(region: "nb-eu-germany")` or
/// `client.setRegion("nb-eu-germany")`) or per call (the `region` argument),
/// which sends the `nb-region` header. Unlike environments there is no
/// default region: when unset, no header is sent.
public final class RegionsModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    /// `GET /{version}/account/regions`
    ///
    /// Lists the regions available to the account. Each item carries `id`
    /// (the region code, e.g. "nb-eu-germany"), `continent`, and `name`.
    public func getAccountRegions(
        _ request: [String: Any] = [:],
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil,
        region: String? = nil
    ) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/regions",
            method: "GET",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken,
            region: region
        )
    }

    /// `PATCH /{version}/account/projects/{projectId}/settings/regions`
    ///
    /// Updates the project's regions. `primaryRegion` and `additionalRegions`
    /// are region code strings (e.g. "nb-eu-germany"); pass `nil` to leave
    /// one unchanged. Empty response on success.
    public func updateProjectRegions(
        projectId: String,
        primaryRegion: String? = nil,
        additionalRegions: [String]? = nil,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil,
        region: String? = nil
    ) async throws -> Any? {
        var request: [String: Any] = ["projectId": projectId]
        if let primaryRegion { request["primaryRegion"] = primaryRegion }
        if let additionalRegions { request["additionalRegions"] = additionalRegions }
        return try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/regions",
            method: "PATCH",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken,
            region: region
        )
    }
}
