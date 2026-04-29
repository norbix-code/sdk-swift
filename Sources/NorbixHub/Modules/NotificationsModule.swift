import Foundation
import NorbixCore

public final class NotificationsModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    public func getUserNotificationPreferences(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/user/preferences",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateUserNotificationsPreferences(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/user/preferences",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func disableEmail(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/disable",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func enableEmail(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/enable",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func attachFileToTemplate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/templates/attachments",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func createEmailTemplate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/templates",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteEmailTemplate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/templates/{Id}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getEmailTemplate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/templates/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getEmailTemplates(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/templates",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getMjml(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/templates/mjml",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getSystemEmailTemplate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/system-templates/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getSystemEmailTemplates(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/system-templates",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getEmailTemplateAvailableTokens(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/templates/{id}/tokens",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateEmailTemplate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/templates",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteEmailSignature(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/signatures/{id}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getEmailSignature(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/signatures/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getEmailSignatures(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/signatures",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveEmailSignature(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/signatures",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getEmailSettings(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/settings",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func confirmEmailIntegrationHumanDelivery(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/integrations/confirm-human-delivery",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteEmailIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/integrations/{Id}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func disableEmailIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/integrations/{Id}/disable",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func enableEmailIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/integrations/{Id}/enable",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getEmailIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/integrations/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getEmailIntegrations(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/integrations",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveEmailIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/integrations",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func setEmailsIntegrationAsDefault(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/integrations/{Id}/default",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func testEmailIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/integrations/test",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func archiveEmailTemplate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/templates/{Id}/archive",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func cloneEmailTemplate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/templates/{Id}/clone",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func unArchiveEmailTemplate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/templates/{Id}/unarchive",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteEmailFooter(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/footers/{id}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getEmailFooter(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/footers/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getEmailFooters(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/footers",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveEmailFooter(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/footers",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func createEmailCampaign(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/campaigns",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteEmailCampaign(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/campaigns/{Id}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getEmailCampaign(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/campaigns/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getEmailCampaigns(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/campaigns",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getEmailCampaignBatches(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/campaigns/{id}/batches",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getEmailCampaignBatchNotification(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/campaigns/{id}/batches/{batchId}/{notificationId}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getEmailCampaignBatchNotifications(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/campaigns/{id}/batches/{batchId}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getEmailCampaignStatistics(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/campaigns/{id}/stats",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func previewEmailNotification(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/email/preview",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getEmailCampaignMessage(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/emails/campaigns/{campaignId}/messages/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getEmailCampaignMessages(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/emails/campaigns/{campaignId}/messages",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func disablePush(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/disable",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func enablePush(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/enable",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func archivePushTemplate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/templates/{Id}/archive",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func clonePushTemplate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/templates/{Id}/clone",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func createPushTemplate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/templates",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deletePushTemplate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/templates/{Id}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getPushTemplate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/templates/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getPushTemplates(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/templates",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getPushMessageContentTokens(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/templates/{id}/tokens",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func unArchivePushTemplate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/templates/{Id}/unarchive",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updatePushTemplate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/templates",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func confirmPushIntegrationHumanDelivery(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/integrations/confirm-human-delivery",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deletePushIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/integrations/{Id}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func disablePushIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/integrations/{Id}/disable",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func enablePushIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/integrations/{Id}/enable",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getPushIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/integrations/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getPushIntegrations(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/integrations",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func savePushIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/integrations",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func setPushIntegrationAsDefault(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/integrations/{Id}/default",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func testPushIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/integrations/test",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func registerCodeMashAppPushIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/integrations/app/request",
            method: "POST",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func registerDevice(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/notifications/push/devices",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

}
