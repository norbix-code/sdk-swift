/* Options:
Date: 2026-10-22 07:38:17
SwiftVersion: 6.0
Version: 10.20
Tip: To override a DTO option, remove "//" prefix before updating
BaseUrl: http://localhost:5002

//BaseClass: 
//AddModelExtensions: True
//AddServiceStackTypes: True
//MakePropertiesOptional: True
//IncludeTypes: 
//ExcludeTypes: 
//ExcludeGenericBaseTypes: False
//AddResponseStatus: False
//AddImplicitVersion: 
//AddDescriptionAsComments: True
//InitializeCollections: False
//TreatTypesAsStrings: 
//DefaultImports: Foundation,ServiceStack
*/

import Foundation
import ServiceStack

public class SharedTypeGen : Codable
{
    public var typegen_StringFieldDto:StringFieldDto?
    public var typegen_DecimalFieldDto:DecimalFieldDto?
    public var typegen_CurrencyFieldDto:CurrencyFieldDto?
    public var typegen_BooleanFieldDto:BooleanFieldDto?
    public var typegen_DateFieldDto:DateFieldDto?
    public var typegen_IntegerFieldDto:IntegerFieldDto?
    public var typegen_GeolocationFieldDto:GeolocationFieldDto?
    public var typegen_TagsFieldDto:TagsFieldDto?
    public var typegen_FileFieldDto:FileFieldDto?
    public var typegen_TaxonomySelectionFieldDto:TaxonomySelectionFieldDto?
    public var typegen_CollectionSelectionFieldDto:CollectionSelectionFieldDto?
    public var typegen_UserSelectionFieldDto:UserSelectionFieldDto?
    public var typegen_RoleSelectionFieldDto:RoleSelectionFieldDto?
    public var typegen_EnumSelectionFieldDto:EnumSelectionFieldDto?
    public var typegen_ObjectFieldDto:ObjectFieldDto?
    public var typegen_ArrayFieldDto:ArrayFieldDto?
    public var typegen_JsonFieldDto:JsonFieldDto?

    required public init(){}
}

// @Route("/{version}/echo", "GET")
public class Echo : RequestBase, IReturn
{
    public typealias Return = EchoResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/public/projects/{ProjectId}/brand/{Kind}", "GET")
public class GetPublicProjectBrandAsset : RequestBase, IReturn
{
    public typealias Return = [UInt8]

    public var projectId:String?
    public var kind:String?
    public var v:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case projectId
        case kind
        case v
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        projectId = try container.decodeIfPresent(String.self, forKey: .projectId)
        kind = try container.decodeIfPresent(String.self, forKey: .kind)
        v = try container.decodeIfPresent(String.self, forKey: .v)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if projectId != nil { try container.encode(projectId, forKey: .projectId) }
        if kind != nil { try container.encode(kind, forKey: .kind) }
        if v != nil { try container.encode(v, forKey: .v) }
    }
}

// @Route("/{version}/public/projects/{ProjectId}/config", "GET")
public class GetPublicProjectConfig : RequestBase, IReturn
{
    public typealias Return = PublicProjectConfigDto

    public var projectId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case projectId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        projectId = try container.decodeIfPresent(String.self, forKey: .projectId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if projectId != nil { try container.encode(projectId, forKey: .projectId) }
    }
}

// @Route("/{version}/public/projects/{ProjectId}/legal/{Kind}", "GET")
public class GetPublicProjectLegal : RequestBase, IReturn
{
    public typealias Return = PublicLegalDocumentDto

    public var projectId:String?
    public var kind:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case projectId
        case kind
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        projectId = try container.decodeIfPresent(String.self, forKey: .projectId)
        kind = try container.decodeIfPresent(String.self, forKey: .kind)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if projectId != nil { try container.encode(projectId, forKey: .projectId) }
        if kind != nil { try container.encode(kind, forKey: .kind) }
    }
}

/**
* Adds a file to one of the caller's own AI chats.
*/
// @Route("/{version}/ai/chat/sessions/{SessionId}/attachments", "POST")
// @Api(Description="Adds a file to one of the caller's own AI chats.")
public class UploadEndUserChatAttachmentRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    public var sessionId:String?
    public var fileName:String?
    public var contentType:String?
    public var base64Content:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case sessionId
        case fileName
        case contentType
        case base64Content
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sessionId = try container.decodeIfPresent(String.self, forKey: .sessionId)
        fileName = try container.decodeIfPresent(String.self, forKey: .fileName)
        contentType = try container.decodeIfPresent(String.self, forKey: .contentType)
        base64Content = try container.decodeIfPresent(String.self, forKey: .base64Content)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if sessionId != nil { try container.encode(sessionId, forKey: .sessionId) }
        if fileName != nil { try container.encode(fileName, forKey: .fileName) }
        if contentType != nil { try container.encode(contentType, forKey: .contentType) }
        if base64Content != nil { try container.encode(base64Content, forKey: .base64Content) }
    }
}

/**
* Lists the files in one of the caller's own AI chats.
*/
// @Route("/{version}/ai/chat/sessions/{SessionId}/attachments", "GET")
// @Api(Description="Lists the files in one of the caller's own AI chats.")
public class ListEndUserChatAttachmentsRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = ListEndUserChatAttachmentsResponse

    public var sessionId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case sessionId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sessionId = try container.decodeIfPresent(String.self, forKey: .sessionId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if sessionId != nil { try container.encode(sessionId, forKey: .sessionId) }
    }
}

/**
* Removes a file from one of the caller's own AI chats.
*/
// @Route("/{version}/ai/chat/attachments/{AttachmentId}", "DELETE")
// @Api(Description="Removes a file from one of the caller's own AI chats.")
public class DeleteEndUserChatAttachmentRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var attachmentId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case attachmentId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        attachmentId = try container.decodeIfPresent(String.self, forKey: .attachmentId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if attachmentId != nil { try container.encode(attachmentId, forKey: .attachmentId) }
    }
}

/**
* Likes, dislikes or clears one message of the caller's own AI chat.
*/
// @Route("/{version}/ai/chat/sessions/{SessionId}/entries/{EntryId}/feedback", "PUT")
// @Api(Description="Likes, dislikes or clears one message of the caller's own AI chat.")
public class SetEndUserChatEntryFeedbackRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var sessionId:String?
    public var entryId:String?
    public var feedback:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case sessionId
        case entryId
        case feedback
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sessionId = try container.decodeIfPresent(String.self, forKey: .sessionId)
        entryId = try container.decodeIfPresent(String.self, forKey: .entryId)
        feedback = try container.decodeIfPresent(String.self, forKey: .feedback)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if sessionId != nil { try container.encode(sessionId, forKey: .sessionId) }
        if entryId != nil { try container.encode(entryId, forKey: .entryId) }
        if feedback != nil { try container.encode(feedback, forKey: .feedback) }
    }
}

/**
* Lists what the AI chat remembers about the caller.
*/
// @Route("/{version}/ai/chat/memory", "GET")
// @Api(Description="Lists what the AI chat remembers about the caller.")
public class ListEndUserChatMemoryRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = ListEndUserChatMemoryResponse

    public var take:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case take
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        take = try container.decodeIfPresent(Int.self, forKey: .take)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if take != nil { try container.encode(take, forKey: .take) }
    }
}

/**
* Forgets one thing the AI chat remembers about the caller.
*/
// @Route("/{version}/ai/chat/memory/{NoteId}", "DELETE")
// @Api(Description="Forgets one thing the AI chat remembers about the caller.")
public class ForgetEndUserChatMemoryRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var noteId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case noteId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        noteId = try container.decodeIfPresent(String.self, forKey: .noteId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if noteId != nil { try container.encode(noteId, forKey: .noteId) }
    }
}

/**
* Whether the AI chat can run for the caller, and which assistants it offers.
*/
// @Route("/{version}/ai/chat/availability", "GET")
// @Api(Description="Whether the AI chat can run for the caller, and which assistants it offers.")
public class GetEndUserChatAvailabilityRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = GetEndUserChatAvailabilityResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

/**
* Lists the caller's own AI chats.
*/
// @Route("/{version}/ai/chat/sessions", "GET")
// @Api(Description="Lists the caller's own AI chats.")
public class ListEndUserChatSessionsRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = ListEndUserChatSessionsResponse

    public var take:Int?
    public var includeArchived:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case take
        case includeArchived
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        take = try container.decodeIfPresent(Int.self, forKey: .take)
        includeArchived = try container.decodeIfPresent(Bool.self, forKey: .includeArchived)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if take != nil { try container.encode(take, forKey: .take) }
        if includeArchived != nil { try container.encode(includeArchived, forKey: .includeArchived) }
    }
}

/**
* Opens a new AI chat for the caller.
*/
// @Route("/{version}/ai/chat/sessions", "POST")
// @Api(Description="Opens a new AI chat for the caller.")
public class CreateEndUserChatSessionRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    public var assistantId:String?
    public var title:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case assistantId
        case title
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        title = try container.decodeIfPresent(String.self, forKey: .title)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if assistantId != nil { try container.encode(assistantId, forKey: .assistantId) }
        if title != nil { try container.encode(title, forKey: .title) }
    }
}

/**
* Returns one of the caller's own AI chats.
*/
// @Route("/{version}/ai/chat/sessions/{SessionId}", "GET")
// @Api(Description="Returns one of the caller's own AI chats.")
public class GetEndUserChatSessionRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = GetEndUserChatSessionResponse

    public var sessionId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case sessionId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sessionId = try container.decodeIfPresent(String.self, forKey: .sessionId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if sessionId != nil { try container.encode(sessionId, forKey: .sessionId) }
    }
}

/**
* Renames one of the caller's own AI chats.
*/
// @Route("/{version}/ai/chat/sessions/{SessionId}", "PATCH")
// @Api(Description="Renames one of the caller's own AI chats.")
public class RenameEndUserChatSessionRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var sessionId:String?
    public var title:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case sessionId
        case title
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sessionId = try container.decodeIfPresent(String.self, forKey: .sessionId)
        title = try container.decodeIfPresent(String.self, forKey: .title)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if sessionId != nil { try container.encode(sessionId, forKey: .sessionId) }
        if title != nil { try container.encode(title, forKey: .title) }
    }
}

/**
* Pins or unpins one of the caller's own AI chats.
*/
// @Route("/{version}/ai/chat/sessions/{SessionId}/pin", "PUT")
// @Api(Description="Pins or unpins one of the caller's own AI chats.")
public class PinEndUserChatSessionRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var sessionId:String?
    public var pinned:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case sessionId
        case pinned
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sessionId = try container.decodeIfPresent(String.self, forKey: .sessionId)
        pinned = try container.decodeIfPresent(Bool.self, forKey: .pinned)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if sessionId != nil { try container.encode(sessionId, forKey: .sessionId) }
        if pinned != nil { try container.encode(pinned, forKey: .pinned) }
    }
}

/**
* Archives or unarchives one of the caller's own AI chats.
*/
// @Route("/{version}/ai/chat/sessions/{SessionId}/archive", "PUT")
// @Api(Description="Archives or unarchives one of the caller's own AI chats.")
public class ArchiveEndUserChatSessionRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var sessionId:String?
    public var archived:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case sessionId
        case archived
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sessionId = try container.decodeIfPresent(String.self, forKey: .sessionId)
        archived = try container.decodeIfPresent(Bool.self, forKey: .archived)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if sessionId != nil { try container.encode(sessionId, forKey: .sessionId) }
        if archived != nil { try container.encode(archived, forKey: .archived) }
    }
}

/**
* Deletes one of the caller's own AI chats.
*/
// @Route("/{version}/ai/chat/sessions/{SessionId}", "DELETE")
// @Api(Description="Deletes one of the caller's own AI chats.")
public class DeleteEndUserChatSessionRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var sessionId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case sessionId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sessionId = try container.decodeIfPresent(String.self, forKey: .sessionId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if sessionId != nil { try container.encode(sessionId, forKey: .sessionId) }
    }
}

/**
* Returns a page of one of the caller's own AI chat transcripts.
*/
// @Route("/{version}/ai/chat/sessions/{SessionId}/entries", "GET")
// @Api(Description="Returns a page of one of the caller's own AI chat transcripts.")
public class GetEndUserChatEntriesRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = GetEndUserChatEntriesResponse

    public var sessionId:String?
    public var afterSeq:Int?
    public var take:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case sessionId
        case afterSeq
        case take
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sessionId = try container.decodeIfPresent(String.self, forKey: .sessionId)
        afterSeq = try container.decodeIfPresent(Int.self, forKey: .afterSeq)
        take = try container.decodeIfPresent(Int.self, forKey: .take)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if sessionId != nil { try container.encode(sessionId, forKey: .sessionId) }
        if afterSeq != nil { try container.encode(afterSeq, forKey: .afterSeq) }
        if take != nil { try container.encode(take, forKey: .take) }
    }
}

/**
* Sends a message to the AI chat; the answer streams on the caller's channel.
*/
// @Route("/{version}/ai/chat/turn", "POST")
// @Api(Description="Sends a message to the AI chat; the answer streams on the caller's channel.")
public class StartEndUserChatTurnRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = StartEndUserChatTurnResponse

    public var sessionId:String?
    public var assistantId:String?
    public var message:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case sessionId
        case assistantId
        case message
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sessionId = try container.decodeIfPresent(String.self, forKey: .sessionId)
        assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        message = try container.decodeIfPresent(String.self, forKey: .message)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if sessionId != nil { try container.encode(sessionId, forKey: .sessionId) }
        if assistantId != nil { try container.encode(assistantId, forKey: .assistantId) }
        if message != nil { try container.encode(message, forKey: .message) }
    }
}

/**
* Lists the AI tools a project user may use: only their own data (own:* toolsets).
*/
// @Route("/{version}/ai/tools", "GET")
// @Api(Description="Lists the AI tools a project user may use: only their own data (own:* toolsets).")
public class GetEndUserAiToolsRequest : RequestBase, IReturn
{
    public typealias Return = GetEndUserAiToolsResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

/**
* Invokes one own-scope AI tool as the calling project user.
*/
// @Route("/{version}/ai/tools/{ToolName}", "POST")
// @Api(Description="Invokes one own-scope AI tool as the calling project user.")
public class InvokeEndUserAiToolRequest : RequestBase, IReturn
{
    public typealias Return = InvokeEndUserAiToolResponse

    public var toolName:String?
    public var argumentsJson:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case toolName
        case argumentsJson
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        toolName = try container.decodeIfPresent(String.self, forKey: .toolName)
        argumentsJson = try container.decodeIfPresent(String.self, forKey: .argumentsJson)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if toolName != nil { try container.encode(toolName, forKey: .toolName) }
        if argumentsJson != nil { try container.encode(argumentsJson, forKey: .argumentsJson) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/block", "PATCH")
// @Api(Description="Membership")
// @DataContract
public class BlockUserRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    /**
    * Id of the user to block, from get_users.
    */
    // @DataMember
    // @ApiMember(Description="Id of the user to block, from get_users.", IsRequired=true)
    public var id:String?

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/register/service", "POST")
// @Api(Description="Membership")
// @DataContract
public class SaveSystemUserWithPermissions : SaveUserWithRolesBase, IReturn
{
    public typealias Return = IdResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/register/guest", "POST")
// @Api(Description="Membership")
// @DataContract
public class SaveGuestUser : SaveUser, IReturn
{
    public typealias Return = IdResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/register/phone", "POST")
// @Api(Description="Membership")
// @DataContract
public class SavePhoneUser : SaveUser, IReturn
{
    public typealias Return = IdResponse

    /**
    * Phone number for the new user, in E.164 format.
    */
    // @DataMember
    // @ApiMember(Description="Phone number for the new user, in E.164 format.", IsRequired=true)
    public var phone:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case phone
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        phone = try container.decodeIfPresent(String.self, forKey: .phone)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if phone != nil { try container.encode(phone, forKey: .phone) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/register/user-name", "POST")
// @Api(Description="Membership")
// @DataContract
public class SaveUserNameUser : SaveUser, IReturn, IPublicRegistrationRequest
{
    public typealias Return = IdResponse

    // @DataMember
    public var password:String?

    // @DataMember
    public var userName:String?

    /**
    * Optional roles from the project's "Permitted user registration roles". Empty = the default registration role.
    */
    // @DataMember
    // @ApiMember(Description="Optional roles from the project's \"Permitted user registration roles\". Empty = the default registration role.")
    public var roles:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case password
        case userName
        case roles
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        password = try container.decodeIfPresent(String.self, forKey: .password)
        userName = try container.decodeIfPresent(String.self, forKey: .userName)
        roles = try container.decodeIfPresent([String].self, forKey: .roles) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if password != nil { try container.encode(password, forKey: .password) }
        if userName != nil { try container.encode(userName, forKey: .userName) }
        if roles != nil { try container.encode(roles, forKey: .roles) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/register/email", "POST")
// @Api(Description="Membership")
// @DataContract
public class SaveEmailUser : SaveUser, IReturn, IPublicRegistrationRequest
{
    public typealias Return = IdResponse

    // @DataMember
    public var password:String?

    // @DataMember
    public var email:String?

    /**
    * Optional roles from the project's "Permitted user registration roles". Empty = the default registration role.
    */
    // @DataMember
    // @ApiMember(Description="Optional roles from the project's \"Permitted user registration roles\". Empty = the default registration role.")
    public var roles:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case password
        case email
        case roles
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        password = try container.decodeIfPresent(String.self, forKey: .password)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        roles = try container.decodeIfPresent([String].self, forKey: .roles) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if password != nil { try container.encode(password, forKey: .password) }
        if email != nil { try container.encode(email, forKey: .email) }
        if roles != nil { try container.encode(roles, forKey: .roles) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/register/phone-with-permissions", "POST")
// @Api(Description="Membership")
// @DataContract
public class SavePhoneUserNameWithPermissions : SaveUserWithRolesBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var phone:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case phone
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        phone = try container.decodeIfPresent(String.self, forKey: .phone)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if phone != nil { try container.encode(phone, forKey: .phone) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/register/email-with-permissions", "POST")
// @Api(Description="Membership")
// @DataContract
public class SaveEmailUserNameWithPermissions : SaveUserWithRolesBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var password:String?

    // @DataMember
    public var email:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case password
        case email
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        password = try container.decodeIfPresent(String.self, forKey: .password)
        email = try container.decodeIfPresent(String.self, forKey: .email)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if password != nil { try container.encode(password, forKey: .password) }
        if email != nil { try container.encode(email, forKey: .email) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/register/user-name-with-permissions", "POST")
// @Api(Description="Membership")
// @DataContract
public class SaveUserNameWithPermissions : SaveUserWithRolesBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var password:String?

    // @DataMember
    public var userName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case password
        case userName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        password = try container.decodeIfPresent(String.self, forKey: .password)
        userName = try container.decodeIfPresent(String.self, forKey: .userName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if password != nil { try container.encode(password, forKey: .password) }
        if userName != nil { try container.encode(userName, forKey: .userName) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth", "DELETE")
// @Api(Description="Membership")
// @DataContract
public class DeleteUserRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    /**
    * Id of the user to delete, from get_users.
    */
    // @DataMember
    // @ApiMember(Description="Id of the user to delete, from get_users.", IsRequired=true)
    public var id:String?

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/{id}", "GET")
// @Api(Description="Membership")
// @DataContract
public class GetUserRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = GetUserResponse

    /**
    * Id of the user to fetch, from get_users.
    */
    // @DataMember
    // @ApiMember(Description="Id of the user to fetch, from get_users.", IsRequired=true)
    public var id:String?

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth", "GET")
// @Api(Description="Membership")
// @DataContract
public class GetUsersRequest : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetUsersResponse

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    public var databaseIntegrationId:String?

    /**
    * Include each user's effective permissions in the result.
    */
    // @DataMember
    // @ApiMember(Description="Include each user's effective permissions in the result.")
    public var includePermissions:Bool?

    /**
    * Only return users that have a registered push device.
    */
    // @DataMember
    // @ApiMember(Description="Only return users that have a registered push device.")
    public var userShouldHavePushDevice:Bool?

    /**
    * Only return users that have an email address.
    */
    // @DataMember
    // @ApiMember(Description="Only return users that have an email address.")
    public var userShouldHaveEmail:Bool?

    /**
    * Include each user's metadata in the result.
    */
    // @DataMember
    // @ApiMember(Description="Include each user's metadata in the result.")
    public var includeMeta:Bool?

    /**
    * Filter to users that have any of these role names.
    */
    // @DataMember
    // @ApiMember(Description="Filter to users that have any of these role names.")
    public var roleNames:[String]?

    /**
    * Filter to these specific user ids.
    */
    // @DataMember
    // @ApiMember(Description="Filter to these specific user ids.")
    public var userIds:[String]?

    /**
    * Free text, case-insensitive: matches email, user name, display / first / last name or phone.
    */
    // @DataMember
    // @ApiMember(Description="Free text, case-insensitive: matches email, user name, display / first / last name or phone.")
    public var search:String?

    /**
    * Case-insensitive part of the email.
    */
    // @DataMember
    // @ApiMember(Description="Case-insensitive part of the email.")
    public var email:String?

    /**
    * Case-insensitive part of the user name.
    */
    // @DataMember
    // @ApiMember(Description="Case-insensitive part of the user name.")
    public var userName:String?

    /**
    * Status names, any of: Registered, PendingValidation, Active, Unregistered, Suspended, InActive, Blocked.
    */
    // @DataMember
    // @ApiMember(Description="Status names, any of: Registered, PendingValidation, Active, Unregistered, Suspended, InActive, Blocked.")
    public var statuses:[String]?

    /**
    * Login type names, any of: Service, Email, UserName, Phone, Guest, Social.
    */
    // @DataMember
    // @ApiMember(Description="Login type names, any of: Service, Email, UserName, Phone, Guest, Social.")
    public var types:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case databaseIntegrationId
        case includePermissions
        case userShouldHavePushDevice
        case userShouldHaveEmail
        case includeMeta
        case roleNames
        case userIds
        case search
        case email
        case userName
        case statuses
        case types
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        includePermissions = try container.decodeIfPresent(Bool.self, forKey: .includePermissions)
        userShouldHavePushDevice = try container.decodeIfPresent(Bool.self, forKey: .userShouldHavePushDevice)
        userShouldHaveEmail = try container.decodeIfPresent(Bool.self, forKey: .userShouldHaveEmail)
        includeMeta = try container.decodeIfPresent(Bool.self, forKey: .includeMeta)
        roleNames = try container.decodeIfPresent([String].self, forKey: .roleNames) ?? []
        userIds = try container.decodeIfPresent([String].self, forKey: .userIds) ?? []
        search = try container.decodeIfPresent(String.self, forKey: .search)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        userName = try container.decodeIfPresent(String.self, forKey: .userName)
        statuses = try container.decodeIfPresent([String].self, forKey: .statuses) ?? []
        types = try container.decodeIfPresent([String].self, forKey: .types) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if includePermissions != nil { try container.encode(includePermissions, forKey: .includePermissions) }
        if userShouldHavePushDevice != nil { try container.encode(userShouldHavePushDevice, forKey: .userShouldHavePushDevice) }
        if userShouldHaveEmail != nil { try container.encode(userShouldHaveEmail, forKey: .userShouldHaveEmail) }
        if includeMeta != nil { try container.encode(includeMeta, forKey: .includeMeta) }
        if roleNames != nil { try container.encode(roleNames, forKey: .roleNames) }
        if userIds != nil { try container.encode(userIds, forKey: .userIds) }
        if search != nil { try container.encode(search, forKey: .search) }
        if email != nil { try container.encode(email, forKey: .email) }
        if userName != nil { try container.encode(userName, forKey: .userName) }
        if statuses != nil { try container.encode(statuses, forKey: .statuses) }
        if types != nil { try container.encode(types, forKey: .types) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/{id}/preferences", "GET")
// @Api(Description="Membership")
// @DataContract
public class GetUserPreferencesRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = GetUserPreferencesResponse

    /**
    * Id of the user whose preferences to fetch, from get_users.
    */
    // @DataMember
    // @ApiMember(Description="Id of the user whose preferences to fetch, from get_users.", IsRequired=true)
    public var id:String?

    /**
    * Database integration id. Optional — defaults to the project's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the project's default integration.")
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

// @Route("/{version}/membership/users/{contactId}/marketing-state/{channel}/consent", "POST")
public class GrantContactConsentRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    /**
    * Id of the user (contact) to grant consent for.
    */
    // @ApiMember(Description="Id of the user (contact) to grant consent for.", IsRequired=true)
    public var contactId:String?

    /**
    * Delivery channel to grant consent on: Email, Sms, or Push.
    */
    // @ApiMember(Description="Delivery channel to grant consent on: Email, Sms, or Push.", IsRequired=true)
    public var channel:String?

    /**
    * Lawful basis for the consent, e.g. Consent. Defaults to Consent.
    */
    // @ApiMember(Description="Lawful basis for the consent, e.g. Consent. Defaults to Consent.")
    public var lawfulBasis:String?

    /**
    * Source of the consent, e.g. UserOptIn. Defaults to UserOptIn.
    */
    // @ApiMember(Description="Source of the consent, e.g. UserOptIn. Defaults to UserOptIn.")
    public var source:String?

    /**
    * Optional free-text reference to evidence of consent (e.g. a form submission id).
    */
    // @ApiMember(Description="Optional free-text reference to evidence of consent (e.g. a form submission id).")
    public var evidenceRef:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case contactId
        case channel
        case lawfulBasis
        case source
        case evidenceRef
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        contactId = try container.decodeIfPresent(String.self, forKey: .contactId)
        channel = try container.decodeIfPresent(String.self, forKey: .channel)
        lawfulBasis = try container.decodeIfPresent(String.self, forKey: .lawfulBasis)
        source = try container.decodeIfPresent(String.self, forKey: .source)
        evidenceRef = try container.decodeIfPresent(String.self, forKey: .evidenceRef)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if contactId != nil { try container.encode(contactId, forKey: .contactId) }
        if channel != nil { try container.encode(channel, forKey: .channel) }
        if lawfulBasis != nil { try container.encode(lawfulBasis, forKey: .lawfulBasis) }
        if source != nil { try container.encode(source, forKey: .source) }
        if evidenceRef != nil { try container.encode(evidenceRef, forKey: .evidenceRef) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/invite", "POST")
// @Api(Description="Membership")
// @DataContract
public class InviteUserRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    /**
    * Email address the invitation is sent to. It cannot be changed later.
    */
    // @DataMember
    // @ApiMember(Description="Email address the invitation is sent to. It cannot be changed later.", IsRequired=true)
    public var email:String?

    /**
    * The invited person's full name, e.g. "Rūta Petraitė". Stored as the full name, first name (first word) and last name (the rest). The user may change it when finishing.
    */
    // @DataMember
    // @ApiMember(Description="The invited person's full name, e.g. \"Rūta Petraitė\". Stored as the full name, first name (first word) and last name (the rest). The user may change it when finishing.")
    public var fullName:String?

    /**
    * Optional. How e-mails greet the person ("Hi {salutation},"), e.g. "Rūta". Stored as the display name. When empty the full name is used. The user may change it when finishing.
    */
    // @DataMember
    // @ApiMember(Description="Optional. How e-mails greet the person (\"Hi {salutation},\"), e.g. \"Rūta\". Stored as the display name. When empty the full name is used. The user may change it when finishing.")
    public var salutation:String?

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case email
        case fullName
        case salutation
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        fullName = try container.decodeIfPresent(String.self, forKey: .fullName)
        salutation = try container.decodeIfPresent(String.self, forKey: .salutation)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if email != nil { try container.encode(email, forKey: .email) }
        if fullName != nil { try container.encode(fullName, forKey: .fullName) }
        if salutation != nil { try container.encode(salutation, forKey: .salutation) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/invitation/finish", "POST")
// @Api(Description="Membership")
// @DataContract
public class FinishInvitationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    /**
    * One-time invitation token from the e-mail link (the #token= fragment).
    */
    // @DataMember
    // @ApiMember(Description="One-time invitation token from the e-mail link (the #token= fragment).", IsRequired=true)
    public var token:String?

    /**
    * The user's password. Validated against the project's complexity policy.
    */
    // @DataMember
    // @ApiMember(Description="The user's password. Validated against the project's complexity policy.", IsRequired=true)
    public var password:String?

    /**
    * Optional. The user's full name; replaces the one the admin entered (full name, first name = first word, last name = the rest). Empty = keep the admin's.
    */
    // @DataMember
    // @ApiMember(Description="Optional. The user's full name; replaces the one the admin entered (full name, first name = first word, last name = the rest). Empty = keep the admin's.")
    public var fullName:String?

    /**
    * Optional. How e-mails greet the user (stored as the display name). Empty = keep the admin's, or the full name when the admin gave none.
    */
    // @DataMember
    // @ApiMember(Description="Optional. How e-mails greet the user (stored as the display name). Empty = keep the admin's, or the full name when the admin gave none.")
    public var salutation:String?

    /**
    * Optional. Older form of Salutation (the display name); Salutation wins when both are sent.
    */
    // @DataMember
    // @ApiMember(Description="Optional. Older form of Salutation (the display name); Salutation wins when both are sent.")
    public var displayName:String?

    /**
    * Optional first name; wins over the one taken from FullName.
    */
    // @DataMember
    // @ApiMember(Description="Optional first name; wins over the one taken from FullName.")
    public var firstName:String?

    /**
    * Optional last name; wins over the one taken from FullName.
    */
    // @DataMember
    // @ApiMember(Description="Optional last name; wins over the one taken from FullName.")
    public var lastName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case token
        case password
        case fullName
        case salutation
        case displayName
        case firstName
        case lastName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        token = try container.decodeIfPresent(String.self, forKey: .token)
        password = try container.decodeIfPresent(String.self, forKey: .password)
        fullName = try container.decodeIfPresent(String.self, forKey: .fullName)
        salutation = try container.decodeIfPresent(String.self, forKey: .salutation)
        displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
        firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if token != nil { try container.encode(token, forKey: .token) }
        if password != nil { try container.encode(password, forKey: .password) }
        if fullName != nil { try container.encode(fullName, forKey: .fullName) }
        if salutation != nil { try container.encode(salutation, forKey: .salutation) }
        if displayName != nil { try container.encode(displayName, forKey: .displayName) }
        if firstName != nil { try container.encode(firstName, forKey: .firstName) }
        if lastName != nil { try container.encode(lastName, forKey: .lastName) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/{userId}/link-identity", "POST")
// @Api(Description="Membership")
// @DataContract
public class LinkIdentityRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var userId:String?

    // @DataMember
    public var provider:String?

    // @DataMember
    public var providerToken:String?

    // @DataMember
    public var emailToVerify:String?

    // @DataMember
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case userId
        case provider
        case providerToken
        case emailToVerify
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userId = try container.decodeIfPresent(String.self, forKey: .userId)
        provider = try container.decodeIfPresent(String.self, forKey: .provider)
        providerToken = try container.decodeIfPresent(String.self, forKey: .providerToken)
        emailToVerify = try container.decodeIfPresent(String.self, forKey: .emailToVerify)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if userId != nil { try container.encode(userId, forKey: .userId) }
        if provider != nil { try container.encode(provider, forKey: .provider) }
        if providerToken != nil { try container.encode(providerToken, forKey: .providerToken) }
        if emailToVerify != nil { try container.encode(emailToVerify, forKey: .emailToVerify) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/users/{userId}/map-auth", "POST")
// @Api(Description="Membership")
public class MapAuthToUserRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var userId:String?
    public var authId:String?
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case userId
        case authId
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userId = try container.decodeIfPresent(String.self, forKey: .userId)
        authId = try container.decodeIfPresent(String.self, forKey: .authId)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if userId != nil { try container.encode(userId, forKey: .userId) }
        if authId != nil { try container.encode(authId, forKey: .authId) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/assign-roles", "PUT")
// @Api(Description="Membership")
// @DataContract
public class AssignRolePermissionsRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    /**
    * Id of the user login to assign roles to, from get_users.
    */
    // @DataMember
    // @ApiMember(Description="Id of the user login to assign roles to, from get_users.", IsRequired=true)
    public var id:String?

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    public var databaseIntegrationId:String?

    /**
    * The complete new list of role names (full replacement), from get_roles.
    */
    // @DataMember
    // @ApiMember(Description="The complete new list of role names (full replacement), from get_roles.")
    public var roles:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case databaseIntegrationId
        case roles
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        roles = try container.decodeIfPresent([String].self, forKey: .roles) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if roles != nil { try container.encode(roles, forKey: .roles) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/users/{userId}/roles", "PUT")
// @Api(Description="Membership")
// @DataContract
public class SetContactRolesRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    /**
    * Id of the human user to assign roles to.
    */
    // @DataMember
    // @ApiMember(Description="Id of the human user to assign roles to.", IsRequired=true)
    public var userId:String?

    /**
    * The complete new list of role ids (full replacement), from get_roles. Empty/omitted clears all roles.
    */
    // @DataMember
    // @ApiMember(Description="The complete new list of role ids (full replacement), from get_roles. Empty/omitted clears all roles.")
    public var roles:[String]?

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case userId
        case roles
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userId = try container.decodeIfPresent(String.self, forKey: .userId)
        roles = try container.decodeIfPresent([String].self, forKey: .roles) ?? []
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if userId != nil { try container.encode(userId, forKey: .userId) }
        if roles != nil { try container.encode(roles, forKey: .roles) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

// @Route("/{version}/membership/users/{contactId}/marketing-state/{commChannel}/{channel}/tags/{tag}", "PUT")
public class SetContactTagSubscriptionRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    /**
    * Id of the user (contact) to update.
    */
    // @ApiMember(Description="Id of the user (contact) to update.", IsRequired=true)
    public var contactId:String?

    /**
    * Communication channel type: Marketing or Transactional.
    */
    // @ApiMember(Description="Communication channel type: Marketing or Transactional.", IsRequired=true)
    public var commChannel:String?

    /**
    * Delivery channel: Email, Sms, or Push.
    */
    // @ApiMember(Description="Delivery channel: Email, Sms, or Push.", IsRequired=true)
    public var channel:String?

    /**
    * The tag name; must already exist for the communication channel.
    */
    // @ApiMember(Description="The tag name; must already exist for the communication channel.", IsRequired=true)
    public var tag:String?

    /**
    * True to subscribe (unblock) the tag, false to block it.
    */
    // @ApiMember(Description="True to subscribe (unblock) the tag, false to block it.")
    public var subscribed:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case contactId
        case commChannel
        case channel
        case tag
        case subscribed
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        contactId = try container.decodeIfPresent(String.self, forKey: .contactId)
        commChannel = try container.decodeIfPresent(String.self, forKey: .commChannel)
        channel = try container.decodeIfPresent(String.self, forKey: .channel)
        tag = try container.decodeIfPresent(String.self, forKey: .tag)
        subscribed = try container.decodeIfPresent(Bool.self, forKey: .subscribed)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if contactId != nil { try container.encode(contactId, forKey: .contactId) }
        if commChannel != nil { try container.encode(commChannel, forKey: .commChannel) }
        if channel != nil { try container.encode(channel, forKey: .channel) }
        if tag != nil { try container.encode(tag, forKey: .tag) }
        if subscribed != nil { try container.encode(subscribed, forKey: .subscribed) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/unblock", "PATCH")
// @Api(Description="Membership")
// @DataContract
public class UnblockUserRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    /**
    * Id of the user to unblock, from get_users.
    */
    // @DataMember
    // @ApiMember(Description="Id of the user to unblock, from get_users.", IsRequired=true)
    public var id:String?

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

// @Route("/{version}/membership/users/{contactId}/marketing-state/{channel}/unsubscribe", "POST")
public class UnsubscribeContactRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    /**
    * Id of the user (contact) to unsubscribe.
    */
    // @ApiMember(Description="Id of the user (contact) to unsubscribe.", IsRequired=true)
    public var contactId:String?

    /**
    * Delivery channel to unsubscribe from: Email, Sms, or Push.
    */
    // @ApiMember(Description="Delivery channel to unsubscribe from: Email, Sms, or Push.", IsRequired=true)
    public var channel:String?

    /**
    * Optional suppression reason name explaining why consent was revoked.
    */
    // @ApiMember(Description="Optional suppression reason name explaining why consent was revoked.")
    public var reason:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case contactId
        case channel
        case reason
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        contactId = try container.decodeIfPresent(String.self, forKey: .contactId)
        channel = try container.decodeIfPresent(String.self, forKey: .channel)
        reason = try container.decodeIfPresent(String.self, forKey: .reason)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if contactId != nil { try container.encode(contactId, forKey: .contactId) }
        if channel != nil { try container.encode(channel, forKey: .channel) }
        if reason != nil { try container.encode(reason, forKey: .reason) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth", "PUT")
// @Api(Description="Membership")
// @DataContract
public class UpdateUserRequest : SaveUser, IReturn
{
    public typealias Return = IdResponse

    /**
    * Id of the user to update, from get_users.
    */
    // @DataMember
    // @ApiMember(Description="Id of the user to update, from get_users.", IsRequired=true)
    public var id:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/{id}/preferences", "PUT")
// @Api(Description="Membership")
// @DataContract
public class UpdateUserPreferencesRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    /**
    * Id of the user to update, from get_users.
    */
    // @DataMember
    // @ApiMember(Description="Id of the user to update, from get_users.", IsRequired=true)
    public var id:String?

    /**
    * When true, blocks all marketing messages to this user.
    */
    // @DataMember
    // @ApiMember(Description="When true, blocks all marketing messages to this user.")
    public var blockAllMarketingMessages:Bool?

    /**
    * Per communication channel, the set of tags blocked for this user. Full replacement.
    */
    // @DataMember
    // @ApiMember(Description="Per communication channel, the set of tags blocked for this user. Full replacement.")
    public var blockedTags:[String:HashSet<String>]?

    /**
    * Database integration id. Optional — defaults to the project's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the project's default integration.")
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case blockAllMarketingMessages
        case blockedTags
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        blockAllMarketingMessages = try container.decodeIfPresent(Bool.self, forKey: .blockAllMarketingMessages)
        blockedTags = try container.decodeIfPresent([String:HashSet<String>].self, forKey: .blockedTags) ?? [:]
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if blockAllMarketingMessages != nil { try container.encode(blockAllMarketingMessages, forKey: .blockAllMarketingMessages) }
        if blockedTags != nil { try container.encode(blockedTags, forKey: .blockedTags) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

/**
* Membership · Password
*/
// @Route("/{version}/membership/userauth/password/change", "POST")
// @Api(Description="Membership · Password")
// @DataContract
public class ChangePasswordRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = PasskeyOkResponse

    /**
    * The member's current password.
    */
    // @DataMember
    // @ApiMember(Description="The member's current password.", IsRequired=true)
    public var currentPassword:String?

    /**
    * The new password. Validated against the project's complexity policy.
    */
    // @DataMember
    // @ApiMember(Description="The new password. Validated against the project's complexity policy.", IsRequired=true)
    public var newPassword:String?

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case currentPassword
        case newPassword
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        currentPassword = try container.decodeIfPresent(String.self, forKey: .currentPassword)
        newPassword = try container.decodeIfPresent(String.self, forKey: .newPassword)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if currentPassword != nil { try container.encode(currentPassword, forKey: .currentPassword) }
        if newPassword != nil { try container.encode(newPassword, forKey: .newPassword) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

/**
* Membership · Password
*/
// @Route("/{version}/membership/userauth/password/reset/request", "POST")
// @Api(Description="Membership · Password")
// @DataContract
public class RequestPasswordResetRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = PasskeyOkResponse

    /**
    * Email address to send the reset link to.
    */
    // @DataMember
    // @ApiMember(Description="Email address to send the reset link to.", IsRequired=true)
    public var email:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case email
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decodeIfPresent(String.self, forKey: .email)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if email != nil { try container.encode(email, forKey: .email) }
    }
}

/**
* Membership · Password
*/
// @Route("/{version}/membership/userauth/password/reset/confirm", "POST")
// @Api(Description="Membership · Password")
// @DataContract
public class ConfirmPasswordResetRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = PasskeyOkResponse

    /**
    * One-time reset token from the email link.
    */
    // @DataMember
    // @ApiMember(Description="One-time reset token from the email link.", IsRequired=true)
    public var token:String?

    /**
    * The new password. Validated against the project's complexity policy.
    */
    // @DataMember
    // @ApiMember(Description="The new password. Validated against the project's complexity policy.", IsRequired=true)
    public var newPassword:String?

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case token
        case newPassword
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        token = try container.decodeIfPresent(String.self, forKey: .token)
        newPassword = try container.decodeIfPresent(String.self, forKey: .newPassword)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if token != nil { try container.encode(token, forKey: .token) }
        if newPassword != nil { try container.encode(newPassword, forKey: .newPassword) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/passkey/authentication-options", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
public class PasskeyAuthenticationOptionsRequest : CodeMashRequestBase, IReturn, IPasskeyCeremonyRequest
{
    public typealias Return = PasskeyCeremonyOptionsResponse

    // @DataMember
    public var email:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case email
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decodeIfPresent(String.self, forKey: .email)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if email != nil { try container.encode(email, forKey: .email) }
    }
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/passkey/verify-authentication", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
public class VerifyPasskeyAuthenticationRequest : CodeMashRequestBase, IReturn, IPasskeyCeremonyRequest
{
    public typealias Return = PasskeyAuthTokensResponse

    // @DataMember
    public var ceremonyId:String?

    // @DataMember
    public var assertionResponse:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case ceremonyId
        case assertionResponse
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        ceremonyId = try container.decodeIfPresent(String.self, forKey: .ceremonyId)
        assertionResponse = try container.decodeIfPresent(String.self, forKey: .assertionResponse)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if ceremonyId != nil { try container.encode(ceremonyId, forKey: .ceremonyId) }
        if assertionResponse != nil { try container.encode(assertionResponse, forKey: .assertionResponse) }
    }
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/passkeys", "GET")
// @Api(Description="Membership · Passkey")
// @DataContract
public class ListPasskeysRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = PasskeyListResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/passkeys/{CredentialId}/rename", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
public class RenamePasskeyRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = PasskeyOkResponse

    /**
    * Base64 credential id of the passkey to rename, from list_passkeys.
    */
    // @DataMember
    // @ApiMember(Description="Base64 credential id of the passkey to rename, from list_passkeys.", IsRequired=true)
    public var credentialId:String?

    /**
    * The new friendly name for the passkey.
    */
    // @DataMember
    // @ApiMember(Description="The new friendly name for the passkey.", IsRequired=true)
    public var friendlyName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case credentialId
        case friendlyName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        credentialId = try container.decodeIfPresent(String.self, forKey: .credentialId)
        friendlyName = try container.decodeIfPresent(String.self, forKey: .friendlyName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if credentialId != nil { try container.encode(credentialId, forKey: .credentialId) }
        if friendlyName != nil { try container.encode(friendlyName, forKey: .friendlyName) }
    }
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/passkeys/{CredentialId}/revoke", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
public class RevokePasskeyRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = PasskeyOkResponse

    /**
    * Base64 credential id of the passkey to revoke, from list_passkeys.
    */
    // @DataMember
    // @ApiMember(Description="Base64 credential id of the passkey to revoke, from list_passkeys.", IsRequired=true)
    public var credentialId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case credentialId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        credentialId = try container.decodeIfPresent(String.self, forKey: .credentialId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if credentialId != nil { try container.encode(credentialId, forKey: .credentialId) }
    }
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/recovery/use-code", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
public class UseRecoveryCodeRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = PasskeyRecoveryResponse

    // @DataMember
    public var email:String?

    // @DataMember
    public var recoveryCode:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case email
        case recoveryCode
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        recoveryCode = try container.decodeIfPresent(String.self, forKey: .recoveryCode)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if email != nil { try container.encode(email, forKey: .email) }
        if recoveryCode != nil { try container.encode(recoveryCode, forKey: .recoveryCode) }
    }
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/recovery/magic-link/request", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
public class RequestMagicLinkRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = PasskeyOkResponse

    // @DataMember
    public var email:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case email
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decodeIfPresent(String.self, forKey: .email)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if email != nil { try container.encode(email, forKey: .email) }
    }
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/recovery/magic-link/consume", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
public class ConsumeMagicLinkRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = PasskeyRecoveryResponse

    // @DataMember
    public var token:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case token
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        token = try container.decodeIfPresent(String.self, forKey: .token)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if token != nil { try container.encode(token, forKey: .token) }
    }
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/has-passkey", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
public class HasPasskeyRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = PasskeyOkResponse

    // @DataMember
    public var email:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case email
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decodeIfPresent(String.self, forKey: .email)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if email != nil { try container.encode(email, forKey: .email) }
    }
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/email/start-verification", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
public class StartEmailVerificationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = PasskeyOkResponse

    // @DataMember
    public var email:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case email
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decodeIfPresent(String.self, forKey: .email)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if email != nil { try container.encode(email, forKey: .email) }
    }
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/email/confirm-verification", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
public class ConfirmEmailVerificationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = PasskeyVerificationTokenResponse

    // @DataMember
    public var email:String?

    // @DataMember
    public var code:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case email
        case code
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        code = try container.decodeIfPresent(String.self, forKey: .code)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if email != nil { try container.encode(email, forKey: .email) }
        if code != nil { try container.encode(code, forKey: .code) }
    }
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/passkey/registration-options", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
public class PasskeyRegistrationOptionsRequest : CodeMashRequestBase, IReturn, IPasskeyCeremonyRequest
{
    public typealias Return = PasskeyCeremonyOptionsResponse

    // @DataMember
    public var verificationToken:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case verificationToken
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        verificationToken = try container.decodeIfPresent(String.self, forKey: .verificationToken)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if verificationToken != nil { try container.encode(verificationToken, forKey: .verificationToken) }
    }
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/passkey/verify-registration", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
public class VerifyPasskeyRegistrationRequest : CodeMashRequestBase, IReturn, IPasskeyCeremonyRequest
{
    public typealias Return = PasskeyAuthTokensResponse

    // @DataMember
    public var verificationToken:String?

    // @DataMember
    public var ceremonyId:String?

    // @DataMember
    public var attestationResponse:String?

    // @DataMember
    public var friendlyName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case verificationToken
        case ceremonyId
        case attestationResponse
        case friendlyName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        verificationToken = try container.decodeIfPresent(String.self, forKey: .verificationToken)
        ceremonyId = try container.decodeIfPresent(String.self, forKey: .ceremonyId)
        attestationResponse = try container.decodeIfPresent(String.self, forKey: .attestationResponse)
        friendlyName = try container.decodeIfPresent(String.self, forKey: .friendlyName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if verificationToken != nil { try container.encode(verificationToken, forKey: .verificationToken) }
        if ceremonyId != nil { try container.encode(ceremonyId, forKey: .ceremonyId) }
        if attestationResponse != nil { try container.encode(attestationResponse, forKey: .attestationResponse) }
        if friendlyName != nil { try container.encode(friendlyName, forKey: .friendlyName) }
    }
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/token/refresh", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
public class RefreshPasskeyTokenRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = PasskeyAuthTokensResponse

    // @DataMember
    public var refreshToken:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case refreshToken
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        refreshToken = try container.decodeIfPresent(String.self, forKey: .refreshToken)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if refreshToken != nil { try container.encode(refreshToken, forKey: .refreshToken) }
    }
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/logout", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
public class PasskeyLogoutRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = PasskeyOkResponse

    // @DataMember
    public var refreshToken:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case refreshToken
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        refreshToken = try container.decodeIfPresent(String.self, forKey: .refreshToken)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if refreshToken != nil { try container.encode(refreshToken, forKey: .refreshToken) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/taxonomies/{taxonomyName}/merged-tree", "GET")
// @Api(Description="Database")
// @DataContract
public class FindMergedTermTreeRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = FindMergedTermTreeResponse

    /**
    * Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.
    */
    // @DataMember
    // @ApiMember(Description="Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.")
    public var allLanguages:Bool?

    /**
    * The taxonomy: its name (slug or title; URL-encode spaces) or its id (txn_…).
    */
    // @DataMember
    // @ApiMember(Description="The taxonomy: its name (slug or title; URL-encode spaces) or its id (txn_…).", IsRequired=true)
    public var taxonomyName:String?

    // @DataMember
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case allLanguages
        case taxonomyName
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        allLanguages = try container.decodeIfPresent(Bool.self, forKey: .allLanguages)
        taxonomyName = try container.decodeIfPresent(String.self, forKey: .taxonomyName)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if allLanguages != nil { try container.encode(allLanguages, forKey: .allLanguages) }
        if taxonomyName != nil { try container.encode(taxonomyName, forKey: .taxonomyName) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/taxonomies/tree", "GET")
// @Api(Description="Database")
// @DataContract
public class FindTaxonomyTreeRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = FindTaxonomyTreeResponse

    /**
    * Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.
    */
    // @DataMember
    // @ApiMember(Description="Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.")
    public var allLanguages:Bool?

    // @DataMember
    public var includeTerms:Bool?

    // @DataMember
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case allLanguages
        case includeTerms
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        allLanguages = try container.decodeIfPresent(Bool.self, forKey: .allLanguages)
        includeTerms = try container.decodeIfPresent(Bool.self, forKey: .includeTerms)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if allLanguages != nil { try container.encode(allLanguages, forKey: .allLanguages) }
        if includeTerms != nil { try container.encode(includeTerms, forKey: .includeTerms) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/taxonomies/{taxonomyName}/terms", "GET")
// @Api(Description="Database")
// @DataContract
public class FindTermsRequest : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = FindTermsResponse

    /**
    * Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.
    */
    // @DataMember
    // @ApiMember(Description="Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.")
    public var allLanguages:Bool?

    /**
    * The taxonomy: its name (slug or title; URL-encode spaces) or its id (txn_…).
    */
    // @DataMember
    // @ApiMember(Description="The taxonomy: its name (slug or title; URL-encode spaces) or its id (txn_…).", IsRequired=true)
    public var taxonomyName:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var filter:String?

    // @DataMember
    public var sortDescending:Bool?

    // @DataMember
    public var pagingArgs:PagingArgs?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case allLanguages
        case taxonomyName
        case databaseIntegrationId
        case filter
        case sortDescending
        case pagingArgs
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        allLanguages = try container.decodeIfPresent(Bool.self, forKey: .allLanguages)
        taxonomyName = try container.decodeIfPresent(String.self, forKey: .taxonomyName)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        filter = try container.decodeIfPresent(String.self, forKey: .filter)
        sortDescending = try container.decodeIfPresent(Bool.self, forKey: .sortDescending)
        pagingArgs = try container.decodeIfPresent(PagingArgs.self, forKey: .pagingArgs)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if allLanguages != nil { try container.encode(allLanguages, forKey: .allLanguages) }
        if taxonomyName != nil { try container.encode(taxonomyName, forKey: .taxonomyName) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if filter != nil { try container.encode(filter, forKey: .filter) }
        if sortDescending != nil { try container.encode(sortDescending, forKey: .sortDescending) }
        if pagingArgs != nil { try container.encode(pagingArgs, forKey: .pagingArgs) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/taxonomies/{taxonomyName}/terms/{parentId}/children", "GET")
// @Api(Description="Database")
// @DataContract
public class FindTermsChildrenRequest : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = FindTermsChildrenResponse

    /**
    * Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.
    */
    // @DataMember
    // @ApiMember(Description="Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.")
    public var allLanguages:Bool?

    /**
    * The taxonomy: its name (slug or title; URL-encode spaces) or its id (txn_…).
    */
    // @DataMember
    // @ApiMember(Description="The taxonomy: its name (slug or title; URL-encode spaces) or its id (txn_…).", IsRequired=true)
    public var taxonomyName:String?

    // @DataMember
    public var parentId:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var filter:String?

    // @DataMember
    public var pagingArgs:PagingArgs?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case allLanguages
        case taxonomyName
        case parentId
        case databaseIntegrationId
        case filter
        case pagingArgs
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        allLanguages = try container.decodeIfPresent(Bool.self, forKey: .allLanguages)
        taxonomyName = try container.decodeIfPresent(String.self, forKey: .taxonomyName)
        parentId = try container.decodeIfPresent(String.self, forKey: .parentId)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        filter = try container.decodeIfPresent(String.self, forKey: .filter)
        pagingArgs = try container.decodeIfPresent(PagingArgs.self, forKey: .pagingArgs)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if allLanguages != nil { try container.encode(allLanguages, forKey: .allLanguages) }
        if taxonomyName != nil { try container.encode(taxonomyName, forKey: .taxonomyName) }
        if parentId != nil { try container.encode(parentId, forKey: .parentId) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if filter != nil { try container.encode(filter, forKey: .filter) }
        if pagingArgs != nil { try container.encode(pagingArgs, forKey: .pagingArgs) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/taxonomies/{taxonomyName}/terms/tree", "GET")
// @Api(Description="Database")
// @DataContract
public class FindTermTreeRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = FindTermTreeResponse

    /**
    * Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.
    */
    // @DataMember
    // @ApiMember(Description="Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.")
    public var allLanguages:Bool?

    /**
    * The taxonomy: its name (slug or title; URL-encode spaces) or its id (txn_…).
    */
    // @DataMember
    // @ApiMember(Description="The taxonomy: its name (slug or title; URL-encode spaces) or its id (txn_…).", IsRequired=true)
    public var taxonomyName:String?

    // @DataMember
    public var rootTermId:String?

    // @DataMember
    public var depth:Int?

    // @DataMember
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case allLanguages
        case taxonomyName
        case rootTermId
        case depth
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        allLanguages = try container.decodeIfPresent(Bool.self, forKey: .allLanguages)
        taxonomyName = try container.decodeIfPresent(String.self, forKey: .taxonomyName)
        rootTermId = try container.decodeIfPresent(String.self, forKey: .rootTermId)
        depth = try container.decodeIfPresent(Int.self, forKey: .depth)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if allLanguages != nil { try container.encode(allLanguages, forKey: .allLanguages) }
        if taxonomyName != nil { try container.encode(taxonomyName, forKey: .taxonomyName) }
        if rootTermId != nil { try container.encode(rootTermId, forKey: .rootTermId) }
        if depth != nil { try container.encode(depth, forKey: .depth) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/schemas/{id}", "GET")
// @Api(Description="Database")
// @DataContract
public class GetDatabaseSchemaRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = GetDatabaseSchemaResponse

    // @DataMember
    public var id:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/schemas", "GET")
// @Api(Description="Database")
// @DataContract
public class GetDatabaseSchemasRequest : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetDatabaseSchemasResponse

    // @DataMember
    public var pagingArgs:PagingArgs?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case pagingArgs
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        pagingArgs = try container.decodeIfPresent(PagingArgs.self, forKey: .pagingArgs)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if pagingArgs != nil { try container.encode(pagingArgs, forKey: .pagingArgs) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/aggregate", "POST")
// @Api(Description="Database")
// @DataContract
public class AggregateRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = AggregateResponse

    // @DataMember
    public var collectionName:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var pipeline:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case databaseIntegrationId
        case pipeline
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        pipeline = try container.decodeIfPresent(String.self, forKey: .pipeline)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if pipeline != nil { try container.encode(pipeline, forKey: .pipeline) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/{id}/responsibility", "PUT")
// @Api(Description="Database")
// @DataContract
public class ChangeResponsibilityRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var collectionName:String?

    // @DataMember
    public var id:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var newResponsibleUserId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case id
        case databaseIntegrationId
        case newResponsibleUserId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        newResponsibleUserId = try container.decodeIfPresent(String.self, forKey: .newResponsibleUserId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if id != nil { try container.encode(id, forKey: .id) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if newResponsibleUserId != nil { try container.encode(newResponsibleUserId, forKey: .newResponsibleUserId) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/count", "GET")
// @Api(Description="Database")
// @DataContract
public class CountRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = CountResponse

    // @DataMember
    public var collectionName:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var filter:String?

    // @DataMember
    public var schemaVersion:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case databaseIntegrationId
        case filter
        case schemaVersion
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        filter = try container.decodeIfPresent(String.self, forKey: .filter)
        schemaVersion = try container.decodeIfPresent(Int.self, forKey: .schemaVersion)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if filter != nil { try container.encode(filter, forKey: .filter) }
        if schemaVersion != nil { try container.encode(schemaVersion, forKey: .schemaVersion) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/many", "DELETE")
// @Api(Description="Database")
// @DataContract
public class DeleteManyRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var collectionName:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var filter:String?

    // @DataMember
    public var allRecords:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case databaseIntegrationId
        case filter
        case allRecords
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        filter = try container.decodeIfPresent(String.self, forKey: .filter)
        allRecords = try container.decodeIfPresent(Bool.self, forKey: .allRecords)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if filter != nil { try container.encode(filter, forKey: .filter) }
        if allRecords != nil { try container.encode(allRecords, forKey: .allRecords) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/{id}", "DELETE")
// @Api(Description="Database")
// @DataContract
public class DeleteOneRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var collectionName:String?

    // @DataMember
    public var id:String?

    // @DataMember
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case id
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if id != nil { try container.encode(id, forKey: .id) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/distinct", "GET")
// @Api(Description="Database")
// @DataContract
public class DistinctRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = DistinctResponse

    // @DataMember
    public var collectionName:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var field:String?

    // @DataMember
    public var filter:String?

    // @DataMember
    public var schemaVersion:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case databaseIntegrationId
        case field
        case filter
        case schemaVersion
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        field = try container.decodeIfPresent(String.self, forKey: .field)
        filter = try container.decodeIfPresent(String.self, forKey: .filter)
        schemaVersion = try container.decodeIfPresent(Int.self, forKey: .schemaVersion)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if field != nil { try container.encode(field, forKey: .field) }
        if filter != nil { try container.encode(filter, forKey: .filter) }
        if schemaVersion != nil { try container.encode(schemaVersion, forKey: .schemaVersion) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/aggregates/{aggregateId}/execute", "POST")
// @Api(Description="Database")
// @DataContract
public class ExecuteAggregateRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = ExecuteAggregateResponse

    // @DataMember
    public var collectionName:String?

    // @DataMember
    public var aggregateId:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var tokens:[String:String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case aggregateId
        case databaseIntegrationId
        case tokens
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        aggregateId = try container.decodeIfPresent(String.self, forKey: .aggregateId)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        tokens = try container.decodeIfPresent([String:String].self, forKey: .tokens) ?? [:]
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if aggregateId != nil { try container.encode(aggregateId, forKey: .aggregateId) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if tokens != nil { try container.encode(tokens, forKey: .tokens) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}", "GET")
// @Api(Description="Database")
// @DataContract
public class FindRequest : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = FindResponse

    // @DataMember
    public var collectionName:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var filter:String?

    // @DataMember
    public var schemaVersion:Int?

    // @DataMember
    public var pagingArgs:PagingArgs?

    // @DataMember
    public var sortBy:String?

    // @DataMember
    public var sortOrder:Int?

    // @DataMember
    public var expandReferences:Bool?

    // @DataMember
    public var allLanguages:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case databaseIntegrationId
        case filter
        case schemaVersion
        case pagingArgs
        case sortBy
        case sortOrder
        case expandReferences
        case allLanguages
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        filter = try container.decodeIfPresent(String.self, forKey: .filter)
        schemaVersion = try container.decodeIfPresent(Int.self, forKey: .schemaVersion)
        pagingArgs = try container.decodeIfPresent(PagingArgs.self, forKey: .pagingArgs)
        sortBy = try container.decodeIfPresent(String.self, forKey: .sortBy)
        sortOrder = try container.decodeIfPresent(Int.self, forKey: .sortOrder)
        expandReferences = try container.decodeIfPresent(Bool.self, forKey: .expandReferences)
        allLanguages = try container.decodeIfPresent(Bool.self, forKey: .allLanguages)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if filter != nil { try container.encode(filter, forKey: .filter) }
        if schemaVersion != nil { try container.encode(schemaVersion, forKey: .schemaVersion) }
        if pagingArgs != nil { try container.encode(pagingArgs, forKey: .pagingArgs) }
        if sortBy != nil { try container.encode(sortBy, forKey: .sortBy) }
        if sortOrder != nil { try container.encode(sortOrder, forKey: .sortOrder) }
        if expandReferences != nil { try container.encode(expandReferences, forKey: .expandReferences) }
        if allLanguages != nil { try container.encode(allLanguages, forKey: .allLanguages) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/{id}", "GET")
// @Api(Description="Database")
// @DataContract
public class FindOneRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = FindOneResponse

    // @DataMember
    public var collectionName:String?

    // @DataMember
    public var id:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var expandReferences:Bool?

    // @DataMember
    public var allLanguages:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case id
        case databaseIntegrationId
        case expandReferences
        case allLanguages
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        expandReferences = try container.decodeIfPresent(Bool.self, forKey: .expandReferences)
        allLanguages = try container.decodeIfPresent(Bool.self, forKey: .allLanguages)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if id != nil { try container.encode(id, forKey: .id) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if expandReferences != nil { try container.encode(expandReferences, forKey: .expandReferences) }
        if allLanguages != nil { try container.encode(allLanguages, forKey: .allLanguages) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/own", "GET")
// @Api(Description="Database")
// @DataContract
public class FindOwnRequest : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = FindResponse

    // @DataMember
    public var collectionName:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var filter:String?

    // @DataMember
    public var schemaVersion:Int?

    // @DataMember
    public var pagingArgs:PagingArgs?

    /**
    * Set true to get every reference value as { id, display } (display = the target's displayField per the schema; null when the target is gone). Needs read permission on every source the schema links to (users, roles, taxonomy, collection, files) — otherwise the read is refused with CM-ERRORS-DATABASE-056 naming the source. Default false returns the stored ids.
    */
    // @DataMember
    // @ApiMember(Description="Set true to get every reference value as { id, display } (display = the target's displayField per the schema; null when the target is gone). Needs read permission on every source the schema links to (users, roles, taxonomy, collection, files) — otherwise the read is refused with CM-ERRORS-DATABASE-056 naming the source. Default false returns the stored ids.")
    public var expandReferences:Bool?

    // @DataMember
    public var allLanguages:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case databaseIntegrationId
        case filter
        case schemaVersion
        case pagingArgs
        case expandReferences
        case allLanguages
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        filter = try container.decodeIfPresent(String.self, forKey: .filter)
        schemaVersion = try container.decodeIfPresent(Int.self, forKey: .schemaVersion)
        pagingArgs = try container.decodeIfPresent(PagingArgs.self, forKey: .pagingArgs)
        expandReferences = try container.decodeIfPresent(Bool.self, forKey: .expandReferences)
        allLanguages = try container.decodeIfPresent(Bool.self, forKey: .allLanguages)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if filter != nil { try container.encode(filter, forKey: .filter) }
        if schemaVersion != nil { try container.encode(schemaVersion, forKey: .schemaVersion) }
        if pagingArgs != nil { try container.encode(pagingArgs, forKey: .pagingArgs) }
        if expandReferences != nil { try container.encode(expandReferences, forKey: .expandReferences) }
        if allLanguages != nil { try container.encode(allLanguages, forKey: .allLanguages) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/many", "POST")
// @Api(Description="Database")
// @DataContract
public class InsertManyRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var collectionName:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var documents:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case databaseIntegrationId
        case documents
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        documents = try container.decodeIfPresent(String.self, forKey: .documents)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if documents != nil { try container.encode(documents, forKey: .documents) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}", "POST")
// @Api(Description="Database")
// @DataContract
public class InsertOneRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var collectionName:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var document:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case databaseIntegrationId
        case document
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        document = try container.decodeIfPresent(String.self, forKey: .document)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if document != nil { try container.encode(document, forKey: .document) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/{id}/replace", "PUT")
// @Api(Description="Database")
// @DataContract
public class ReplaceOneRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var collectionName:String?

    // @DataMember
    public var id:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var replacement:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case id
        case databaseIntegrationId
        case replacement
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        replacement = try container.decodeIfPresent(String.self, forKey: .replacement)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if id != nil { try container.encode(id, forKey: .id) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if replacement != nil { try container.encode(replacement, forKey: .replacement) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/many", "PUT")
// @Api(Description="Database")
// @DataContract
public class UpdateManyRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var collectionName:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var filter:String?

    // @DataMember
    public var allRecords:Bool?

    // @DataMember
    public var update:String?

    // @DataMember
    public var arrayFilters:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case databaseIntegrationId
        case filter
        case allRecords
        case update
        case arrayFilters
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        filter = try container.decodeIfPresent(String.self, forKey: .filter)
        allRecords = try container.decodeIfPresent(Bool.self, forKey: .allRecords)
        update = try container.decodeIfPresent(String.self, forKey: .update)
        arrayFilters = try container.decodeIfPresent(String.self, forKey: .arrayFilters)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if filter != nil { try container.encode(filter, forKey: .filter) }
        if allRecords != nil { try container.encode(allRecords, forKey: .allRecords) }
        if update != nil { try container.encode(update, forKey: .update) }
        if arrayFilters != nil { try container.encode(arrayFilters, forKey: .arrayFilters) }
    }
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/{id}", "PUT")
// @Api(Description="Database")
// @DataContract
public class UpdateOneRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var collectionName:String?

    // @DataMember
    public var id:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var update:String?

    // @DataMember
    public var arrayFilters:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case id
        case databaseIntegrationId
        case update
        case arrayFilters
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        update = try container.decodeIfPresent(String.self, forKey: .update)
        arrayFilters = try container.decodeIfPresent(String.self, forKey: .arrayFilters)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if id != nil { try container.encode(id, forKey: .id) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if update != nil { try container.encode(update, forKey: .update) }
        if arrayFilters != nil { try container.encode(arrayFilters, forKey: .arrayFilters) }
    }
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/commit", "POST")
// @Api(Description="Files")
// @DataContract
public class CommitUploadRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var filesIntegrationId:String?

    // @DataMember
    public var path:String?

    // @DataMember
    public var contentType:String?

    // @DataMember
    public var sizeBytes:Int?

    // @DataMember
    public var fileName:String?

    // @DataMember
    public var ownerUserId:String?

    // @DataMember
    public var reassignOwner:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case filesIntegrationId
        case path
        case contentType
        case sizeBytes
        case fileName
        case ownerUserId
        case reassignOwner
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        filesIntegrationId = try container.decodeIfPresent(String.self, forKey: .filesIntegrationId)
        path = try container.decodeIfPresent(String.self, forKey: .path)
        contentType = try container.decodeIfPresent(String.self, forKey: .contentType)
        sizeBytes = try container.decodeIfPresent(Int.self, forKey: .sizeBytes)
        fileName = try container.decodeIfPresent(String.self, forKey: .fileName)
        ownerUserId = try container.decodeIfPresent(String.self, forKey: .ownerUserId)
        reassignOwner = try container.decodeIfPresent(Bool.self, forKey: .reassignOwner)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if filesIntegrationId != nil { try container.encode(filesIntegrationId, forKey: .filesIntegrationId) }
        if path != nil { try container.encode(path, forKey: .path) }
        if contentType != nil { try container.encode(contentType, forKey: .contentType) }
        if sizeBytes != nil { try container.encode(sizeBytes, forKey: .sizeBytes) }
        if fileName != nil { try container.encode(fileName, forKey: .fileName) }
        if ownerUserId != nil { try container.encode(ownerUserId, forKey: .ownerUserId) }
        if reassignOwner != nil { try container.encode(reassignOwner, forKey: .reassignOwner) }
    }
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/content", "GET")
// @Api(Description="Files")
// @DataContract
public class GetFileContentRequest : RequestBase, IReturn
{
    public typealias Return = [UInt8]

    // @DataMember
    public var filesIntegrationId:String?

    // @DataMember
    public var path:String?

    // @DataMember
    public var token:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case filesIntegrationId
        case path
        case token
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        filesIntegrationId = try container.decodeIfPresent(String.self, forKey: .filesIntegrationId)
        path = try container.decodeIfPresent(String.self, forKey: .path)
        token = try container.decodeIfPresent(String.self, forKey: .token)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if filesIntegrationId != nil { try container.encode(filesIntegrationId, forKey: .filesIntegrationId) }
        if path != nil { try container.encode(path, forKey: .path) }
        if token != nil { try container.encode(token, forKey: .token) }
    }
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/content", "PUT")
// @Api(Description="Files")
// @DataContract
public class PutFileContentRequest : RequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var filesIntegrationId:String?

    // @DataMember
    public var path:String?

    // @DataMember
    public var token:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case filesIntegrationId
        case path
        case token
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        filesIntegrationId = try container.decodeIfPresent(String.self, forKey: .filesIntegrationId)
        path = try container.decodeIfPresent(String.self, forKey: .path)
        token = try container.decodeIfPresent(String.self, forKey: .token)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if filesIntegrationId != nil { try container.encode(filesIntegrationId, forKey: .filesIntegrationId) }
        if path != nil { try container.encode(path, forKey: .path) }
        if token != nil { try container.encode(token, forKey: .token) }
    }
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}", "DELETE")
// @Api(Description="Files")
// @DataContract
public class DeleteFileApiRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var filesIntegrationId:String?

    // @DataMember
    public var path:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case filesIntegrationId
        case path
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        filesIntegrationId = try container.decodeIfPresent(String.self, forKey: .filesIntegrationId)
        path = try container.decodeIfPresent(String.self, forKey: .path)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if filesIntegrationId != nil { try container.encode(filesIntegrationId, forKey: .filesIntegrationId) }
        if path != nil { try container.encode(path, forKey: .path) }
    }
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/bulk", "DELETE")
// @Api(Description="Files")
// @DataContract
public class DeleteManyFilesApiRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var filesIntegrationId:String?

    // @DataMember(Name="paths[]")
    public var paths__:[String] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case filesIntegrationId
        case paths__
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        filesIntegrationId = try container.decodeIfPresent(String.self, forKey: .filesIntegrationId)
        paths__ = try container.decodeIfPresent([String].self, forKey: .paths__) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if filesIntegrationId != nil { try container.encode(filesIntegrationId, forKey: .filesIntegrationId) }
        if paths__.count > 0 { try container.encode(paths__, forKey: .paths__) }
    }
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/download", "GET")
// @Api(Description="Files")
// @DataContract
public class DownloadFileApiRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = [UInt8]

    // @DataMember
    public var filesIntegrationId:String?

    // @DataMember
    public var path:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case filesIntegrationId
        case path
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        filesIntegrationId = try container.decodeIfPresent(String.self, forKey: .filesIntegrationId)
        path = try container.decodeIfPresent(String.self, forKey: .path)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if filesIntegrationId != nil { try container.encode(filesIntegrationId, forKey: .filesIntegrationId) }
        if path != nil { try container.encode(path, forKey: .path) }
    }
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/by-id/{id}", "GET")
// @Api(Description="Files")
// @DataContract
public class GetFileByIdRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = GetFileByIdResponse

    // @DataMember
    public var filesIntegrationId:String?

    // @DataMember
    public var id:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case filesIntegrationId
        case id
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        filesIntegrationId = try container.decodeIfPresent(String.self, forKey: .filesIntegrationId)
        id = try container.decodeIfPresent(String.self, forKey: .id)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if filesIntegrationId != nil { try container.encode(filesIntegrationId, forKey: .filesIntegrationId) }
        if id != nil { try container.encode(id, forKey: .id) }
    }
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/info", "GET")
// @Api(Description="Files")
// @DataContract
public class GetFileInfoRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = GetFileInfoResponse

    // @DataMember
    public var filesIntegrationId:String?

    // @DataMember
    public var path:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case filesIntegrationId
        case path
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        filesIntegrationId = try container.decodeIfPresent(String.self, forKey: .filesIntegrationId)
        path = try container.decodeIfPresent(String.self, forKey: .path)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if filesIntegrationId != nil { try container.encode(filesIntegrationId, forKey: .filesIntegrationId) }
        if path != nil { try container.encode(path, forKey: .path) }
    }
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/sign", "GET")
// @Api(Description="Files")
// @DataContract
public class GetSignedUrlRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = GetSignedUrlResponse

    // @DataMember
    public var filesIntegrationId:String?

    // @DataMember
    public var path:String?

    // @DataMember
    public var expirationSeconds:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case filesIntegrationId
        case path
        case expirationSeconds
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        filesIntegrationId = try container.decodeIfPresent(String.self, forKey: .filesIntegrationId)
        path = try container.decodeIfPresent(String.self, forKey: .path)
        expirationSeconds = try container.decodeIfPresent(Int.self, forKey: .expirationSeconds)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if filesIntegrationId != nil { try container.encode(filesIntegrationId, forKey: .filesIntegrationId) }
        if path != nil { try container.encode(path, forKey: .path) }
        if expirationSeconds != nil { try container.encode(expirationSeconds, forKey: .expirationSeconds) }
    }
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}", "GET")
// @Api(Description="Files")
// @DataContract
public class ListFilesRequest : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = ListFilesResponse

    // @DataMember
    public var filesIntegrationId:String?

    // @DataMember
    public var path:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case filesIntegrationId
        case path
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        filesIntegrationId = try container.decodeIfPresent(String.self, forKey: .filesIntegrationId)
        path = try container.decodeIfPresent(String.self, forKey: .path)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if filesIntegrationId != nil { try container.encode(filesIntegrationId, forKey: .filesIntegrationId) }
        if path != nil { try container.encode(path, forKey: .path) }
    }
}

/**
* Files
*/
// @Route("/{version}/files/public/{PublicId}/{Name*}", "GET")
// @Api(Description="Files")
// @DataContract
public class GetPublicFileRequest : RequestBase, IReturn
{
    public typealias Return = [UInt8]

    // @DataMember
    public var publicId:String?

    // @DataMember
    public var name:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case publicId
        case name
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        publicId = try container.decodeIfPresent(String.self, forKey: .publicId)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if publicId != nil { try container.encode(publicId, forKey: .publicId) }
        if name != nil { try container.encode(name, forKey: .name) }
    }
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/register", "POST")
// @Api(Description="Files")
// @DataContract
public class RegisterFilesRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = RegisterFilesResponse

    // @DataMember
    public var filesIntegrationId:String?

    // @DataMember
    public var items:[RegisterFileItem]?

    // @DataMember
    public var reassignOwner:Bool?

    // @DataMember
    public var dryRun:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case filesIntegrationId
        case items
        case reassignOwner
        case dryRun
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        filesIntegrationId = try container.decodeIfPresent(String.self, forKey: .filesIntegrationId)
        items = try container.decodeIfPresent([RegisterFileItem].self, forKey: .items) ?? []
        reassignOwner = try container.decodeIfPresent(Bool.self, forKey: .reassignOwner)
        dryRun = try container.decodeIfPresent(Bool.self, forKey: .dryRun)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if filesIntegrationId != nil { try container.encode(filesIntegrationId, forKey: .filesIntegrationId) }
        if items != nil { try container.encode(items, forKey: .items) }
        if reassignOwner != nil { try container.encode(reassignOwner, forKey: .reassignOwner) }
        if dryRun != nil { try container.encode(dryRun, forKey: .dryRun) }
    }
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/upload-url", "POST")
// @Api(Description="Files")
// @DataContract
public class RequestUploadUrlRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = RequestUploadUrlResponse

    // @DataMember
    public var filesIntegrationId:String?

    // @DataMember
    public var path:String?

    // @DataMember
    public var contentType:String?

    // @DataMember
    public var expirationSeconds:Int?

    // @DataMember
    public var ownerUserId:String?

    // @DataMember
    public var reassignOwner:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case filesIntegrationId
        case path
        case contentType
        case expirationSeconds
        case ownerUserId
        case reassignOwner
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        filesIntegrationId = try container.decodeIfPresent(String.self, forKey: .filesIntegrationId)
        path = try container.decodeIfPresent(String.self, forKey: .path)
        contentType = try container.decodeIfPresent(String.self, forKey: .contentType)
        expirationSeconds = try container.decodeIfPresent(Int.self, forKey: .expirationSeconds)
        ownerUserId = try container.decodeIfPresent(String.self, forKey: .ownerUserId)
        reassignOwner = try container.decodeIfPresent(Bool.self, forKey: .reassignOwner)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if filesIntegrationId != nil { try container.encode(filesIntegrationId, forKey: .filesIntegrationId) }
        if path != nil { try container.encode(path, forKey: .path) }
        if contentType != nil { try container.encode(contentType, forKey: .contentType) }
        if expirationSeconds != nil { try container.encode(expirationSeconds, forKey: .expirationSeconds) }
        if ownerUserId != nil { try container.encode(ownerUserId, forKey: .ownerUserId) }
        if reassignOwner != nil { try container.encode(reassignOwner, forKey: .reassignOwner) }
    }
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/test", "POST")
// @Api(Description="Files")
// @DataContract
public class TestFilesIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = TestFilesIntegrationResponse

    // @DataMember
    public var filesIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case filesIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        filesIntegrationId = try container.decodeIfPresent(String.self, forKey: .filesIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if filesIntegrationId != nil { try container.encode(filesIntegrationId, forKey: .filesIntegrationId) }
    }
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/use", "POST")
// @Api(Description="Files")
// @DataContract
public class UseFileRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var filesIntegrationId:String?

    // @DataMember
    public var path:String?

    // @DataMember
    public var ownerUserId:String?

    // @DataMember
    public var reassignOwner:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case filesIntegrationId
        case path
        case ownerUserId
        case reassignOwner
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        filesIntegrationId = try container.decodeIfPresent(String.self, forKey: .filesIntegrationId)
        path = try container.decodeIfPresent(String.self, forKey: .path)
        ownerUserId = try container.decodeIfPresent(String.self, forKey: .ownerUserId)
        reassignOwner = try container.decodeIfPresent(Bool.self, forKey: .reassignOwner)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if filesIntegrationId != nil { try container.encode(filesIntegrationId, forKey: .filesIntegrationId) }
        if path != nil { try container.encode(path, forKey: .path) }
        if ownerUserId != nil { try container.encode(ownerUserId, forKey: .ownerUserId) }
        if reassignOwner != nil { try container.encode(reassignOwner, forKey: .reassignOwner) }
    }
}

/**
* Registers or refreshes a push device for the signed-in user.
*/
// @Route("/{version}/notifications/push/devices", "POST")
// @Api(Description="Registers or refreshes a push device for the signed-in user.")
public class RegisterOwnPushDeviceRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    /**
    * Who issued the token: fcm (Android / Firebase) or apns (iOS). The NATIVE device token — in an Expo app use getDevicePushTokenAsync(). Expo push tokens (provider 'expo') are refused.
    */
    // @ApiMember(Description="Who issued the token: fcm (Android / Firebase) or apns (iOS). The NATIVE device token — in an Expo app use getDevicePushTokenAsync(). Expo push tokens (provider 'expo') are refused.", IsRequired=true)
    public var provider:String?

    /**
    * The push token, exactly as the provider gave it.
    */
    // @ApiMember(Description="The push token, exactly as the provider gave it.", IsRequired=true)
    public var token:String?

    /**
    * The app's platform: ios, android or web.
    */
    // @ApiMember(Description="The app's platform: ios, android or web.")
    public var platform:String?

    /**
    * Operating system name, e.g. iOS.
    */
    // @ApiMember(Description="Operating system name, e.g. iOS.")
    public var osName:String?

    /**
    * Operating system version, e.g. 18.1.
    */
    // @ApiMember(Description="Operating system version, e.g. 18.1.")
    public var osVersion:String?

    /**
    * The app version, e.g. 2.4.1.
    */
    // @ApiMember(Description="The app version, e.g. 2.4.1.")
    public var appVersion:String?

    /**
    * The device name the user sees, e.g. Anna's iPhone.
    */
    // @ApiMember(Description="The device name the user sees, e.g. Anna's iPhone.")
    public var deviceName:String?

    /**
    * The device model, e.g. iPhone 15.
    */
    // @ApiMember(Description="The device model, e.g. iPhone 15.")
    public var modelName:String?

    public var brand:String?
    public var manufacturer:String?
    /**
    * A stable id the app keeps for this installation (not the token).
    */
    // @ApiMember(Description="A stable id the app keeps for this installation (not the token).")
    public var installationId:String?

    /**
    * The device locale, e.g. lt-LT.
    */
    // @ApiMember(Description="The device locale, e.g. lt-LT.")
    public var locale:String?

    /**
    * The device time zone (IANA), e.g. Europe/Vilnius.
    */
    // @ApiMember(Description="The device time zone (IANA), e.g. Europe/Vilnius.")
    public var timeZone:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
        case token
        case platform
        case osName
        case osVersion
        case appVersion
        case deviceName
        case modelName
        case brand
        case manufacturer
        case installationId
        case locale
        case timeZone
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(String.self, forKey: .provider)
        token = try container.decodeIfPresent(String.self, forKey: .token)
        platform = try container.decodeIfPresent(String.self, forKey: .platform)
        osName = try container.decodeIfPresent(String.self, forKey: .osName)
        osVersion = try container.decodeIfPresent(String.self, forKey: .osVersion)
        appVersion = try container.decodeIfPresent(String.self, forKey: .appVersion)
        deviceName = try container.decodeIfPresent(String.self, forKey: .deviceName)
        modelName = try container.decodeIfPresent(String.self, forKey: .modelName)
        brand = try container.decodeIfPresent(String.self, forKey: .brand)
        manufacturer = try container.decodeIfPresent(String.self, forKey: .manufacturer)
        installationId = try container.decodeIfPresent(String.self, forKey: .installationId)
        locale = try container.decodeIfPresent(String.self, forKey: .locale)
        timeZone = try container.decodeIfPresent(String.self, forKey: .timeZone)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
        if token != nil { try container.encode(token, forKey: .token) }
        if platform != nil { try container.encode(platform, forKey: .platform) }
        if osName != nil { try container.encode(osName, forKey: .osName) }
        if osVersion != nil { try container.encode(osVersion, forKey: .osVersion) }
        if appVersion != nil { try container.encode(appVersion, forKey: .appVersion) }
        if deviceName != nil { try container.encode(deviceName, forKey: .deviceName) }
        if modelName != nil { try container.encode(modelName, forKey: .modelName) }
        if brand != nil { try container.encode(brand, forKey: .brand) }
        if manufacturer != nil { try container.encode(manufacturer, forKey: .manufacturer) }
        if installationId != nil { try container.encode(installationId, forKey: .installationId) }
        if locale != nil { try container.encode(locale, forKey: .locale) }
        if timeZone != nil { try container.encode(timeZone, forKey: .timeZone) }
    }
}

/**
* Lists the signed-in user's own push devices.
*/
// @Route("/{version}/notifications/push/devices", "GET")
// @Api(Description="Lists the signed-in user's own push devices.")
public class GetOwnPushDevicesRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = GetOwnPushDevicesResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

/**
* Removes one of the signed-in user's own push devices by id.
*/
// @Route("/{version}/notifications/push/devices/{Id}", "DELETE")
// @Api(Description="Removes one of the signed-in user's own push devices by id.")
public class DeleteOwnPushDeviceRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    /**
    * The device id (pnd_…) from the devices list or the register answer.
    */
    // @ApiMember(Description="The device id (pnd_…) from the devices list or the register answer.", IsRequired=true)
    public var id:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
    }
}

/**
* Removes the signed-in user's push device registered with a token (sign-out).
*/
// @Route("/{version}/notifications/push/devices", "DELETE")
// @Api(Description="Removes the signed-in user's push device registered with a token (sign-out).")
public class DeleteOwnPushDeviceByTokenRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    /**
    * The push token the device was registered with.
    */
    // @ApiMember(Description="The push token the device was registered with.", IsRequired=true)
    public var token:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case token
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        token = try container.decodeIfPresent(String.self, forKey: .token)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if token != nil { try container.encode(token, forKey: .token) }
    }
}

/**
* Lists the push messages sent to the signed-in user.
*/
// @Route("/{version}/notifications/push/messages", "GET")
// @Api(Description="Lists the push messages sent to the signed-in user.")
public class GetOwnPushMessagesRequest : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetOwnPushMessagesResponse

    /**
    * Only messages the caller has not marked read.
    */
    // @ApiMember(Description="Only messages the caller has not marked read.")
    public var unreadOnly:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case unreadOnly
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        unreadOnly = try container.decodeIfPresent(Bool.self, forKey: .unreadOnly)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if unreadOnly != nil { try container.encode(unreadOnly, forKey: .unreadOnly) }
    }
}

/**
* Marks one push message sent to the signed-in user read.
*/
// @Route("/{version}/notifications/push/messages/{Id}/read", "POST")
// @Api(Description="Marks one push message sent to the signed-in user read.")
public class MarkOwnPushMessageReadRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    /**
    * The message id (ntf_…) from the messages list.
    */
    // @ApiMember(Description="The message id (ntf_…) from the messages list.", IsRequired=true)
    public var id:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
    }
}

/**
* Marks every push message sent to the signed-in user read.
*/
// @Route("/{version}/notifications/push/messages/read", "POST")
// @Api(Description="Marks every push message sent to the signed-in user read.")
public class MarkAllOwnPushMessagesReadRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

/**
* Send your app's own log entries to the project's logs.
*/
// @Route("/{version}/logs", "POST")
// @Api(Description="Send your app's own log entries to the project's logs.")
public class WriteLogs : CodeMashRequestBase, IReturn
{
    public typealias Return = WriteLogsResponse

    /**
    * 1–100 entries.
    */
    // @ApiMember(Description="1–100 entries.", IsRequired=true)
    public var entries:[WriteLogEntry] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case entries
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        entries = try container.decodeIfPresent([WriteLogEntry].self, forKey: .entries) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if entries.count > 0 { try container.encode(entries, forKey: .entries) }
    }
}

/**
* Stores a payment order with a fixed price for one of the project's users. Server only (service user API key).
*/
// @Route("/{version}/payments/orders", "POST")
// @Api(Description="Stores a payment order with a fixed price for one of the project's users. Server only (service user API key).")
public class CreatePaymentOrderRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    /**
    * The user the order is for (usr_…).
    */
    // @ApiMember(Description="The user the order is for (usr_…).", IsRequired=true)
    public var buyerUserId:String?

    /**
    * The project's own order reference, unique per project and environment (1–64 of A–Z a–z 0–9 . _ : -).
    */
    // @ApiMember(Description="The project's own order reference, unique per project and environment (1–64 of A–Z a–z 0–9 . _ : -).", IsRequired=true)
    public var merchantReference:String?

    /**
    * 8–128 characters. Same key + same body = the stored order; same key + other body = 409. May be sent as the Idempotency-Key header instead.
    */
    // @ApiMember(Description="8–128 characters. Same key + same body = the stored order; same key + other body = 409. May be sent as the Idempotency-Key header instead.")
    public var idempotencyKey:String?

    /**
    * EUR.
    */
    // @ApiMember(Description="EUR.", IsRequired=true)
    public var currency:String?

    /**
    * The version of the price list the server priced the lines with.
    */
    // @ApiMember(Description="The version of the price list the server priced the lines with.", IsRequired=true)
    public var priceVersion:String?

    /**
    * 1–50 lines: sku, title, quantity, unitAmountMinor (cents). Norbix computes the amounts and the total.
    */
    // @ApiMember(Description="1–50 lines: sku, title, quantity, unitAmountMinor (cents). Norbix computes the amounts and the total.", IsRequired=true)
    public var lines:[PaymentOrderLineInput] = []

    /**
    * Up to 20 project values (e.g. adId). No personal or billing data.
    */
    // @ApiMember(Description="Up to 20 project values (e.g. adId). No personal or billing data.")
    public var metadata:[String:String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case buyerUserId
        case merchantReference
        case idempotencyKey
        case currency
        case priceVersion
        case lines
        case metadata
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        buyerUserId = try container.decodeIfPresent(String.self, forKey: .buyerUserId)
        merchantReference = try container.decodeIfPresent(String.self, forKey: .merchantReference)
        idempotencyKey = try container.decodeIfPresent(String.self, forKey: .idempotencyKey)
        currency = try container.decodeIfPresent(String.self, forKey: .currency)
        priceVersion = try container.decodeIfPresent(String.self, forKey: .priceVersion)
        lines = try container.decodeIfPresent([PaymentOrderLineInput].self, forKey: .lines) ?? []
        metadata = try container.decodeIfPresent([String:String].self, forKey: .metadata) ?? [:]
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if buyerUserId != nil { try container.encode(buyerUserId, forKey: .buyerUserId) }
        if merchantReference != nil { try container.encode(merchantReference, forKey: .merchantReference) }
        if idempotencyKey != nil { try container.encode(idempotencyKey, forKey: .idempotencyKey) }
        if currency != nil { try container.encode(currency, forKey: .currency) }
        if priceVersion != nil { try container.encode(priceVersion, forKey: .priceVersion) }
        if lines.count > 0 { try container.encode(lines, forKey: .lines) }
        if metadata != nil { try container.encode(metadata, forKey: .metadata) }
    }
}

/**
* Reads one payment order. A buyer reads only their own orders.
*/
// @Route("/{version}/payments/orders/{Id}", "GET")
// @Api(Description="Reads one payment order. A buyer reads only their own orders.")
public class GetPaymentOrderRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = GetPaymentOrderResponse

    /**
    * The order id (ord_…).
    */
    // @ApiMember(Description="The order id (ord_…).", IsRequired=true)
    public var id:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
    }
}

/**
* Lists payment orders, newest first. A buyer gets only their own orders.
*/
// @Route("/{version}/payments/orders", "GET")
// @Api(Description="Lists payment orders, newest first. A buyer gets only their own orders.")
public class GetPaymentOrdersRequest : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetPaymentOrdersResponse

    /**
    * Server only: one buyer's orders (usr_…). A buyer always gets their own.
    */
    // @ApiMember(Description="Server only: one buyer's orders (usr_…). A buyer always gets their own.")
    public var buyerUserId:String?

    /**
    * Only the order with this merchant reference.
    */
    // @ApiMember(Description="Only the order with this merchant reference.")
    public var merchantReference:String?

    /**
    * Only orders in this status (Created, CheckoutStarted, Paid, …).
    */
    // @ApiMember(Description="Only orders in this status (Created, CheckoutStarted, Paid, …).")
    public var status:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case buyerUserId
        case merchantReference
        case status
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        buyerUserId = try container.decodeIfPresent(String.self, forKey: .buyerUserId)
        merchantReference = try container.decodeIfPresent(String.self, forKey: .merchantReference)
        status = try container.decodeIfPresent(String.self, forKey: .status)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if buyerUserId != nil { try container.encode(buyerUserId, forKey: .buyerUserId) }
        if merchantReference != nil { try container.encode(merchantReference, forKey: .merchantReference) }
        if status != nil { try container.encode(status, forKey: .status) }
    }
}

/**
* Opens a Montonio checkout for a stored order and answers where the buyer pays. The buyer (own order) or the server.
*/
// @Route("/{version}/payments/orders/{Id}/checkout", "POST")
// @Api(Description="Opens a Montonio checkout for a stored order and answers where the buyer pays. The buyer (own order) or the server.")
public class StartPaymentCheckoutRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = StartPaymentCheckoutResponse

    /**
    * The order id (ord_…).
    */
    // @ApiMember(Description="The order id (ord_…).", IsRequired=true)
    public var id:String?

    /**
    * The Montonio integration (int_…) of the project in the request's environment.
    */
    // @ApiMember(Description="The Montonio integration (int_…) of the project in the request's environment.", IsRequired=true)
    public var integrationId:String?

    /**
    * bankLink (default), card, applePay or googlePay.
    */
    // @ApiMember(Description="bankLink (default), card, applePay or googlePay.")
    public var method:String?

    /**
    * Where the buyer comes back after paying; its origin must be one of the project's allowed origins.
    */
    // @ApiMember(Description="Where the buyer comes back after paying; its origin must be one of the project's allowed origins.", IsRequired=true)
    public var returnUrl:String?

    /**
    * Bank links only: the country whose banks are shown first (default LT).
    */
    // @ApiMember(Description="Bank links only: the country whose banks are shown first (default LT).")
    public var preferredCountry:String?

    /**
    * Bank links only: one bank to open directly (the provider's bank code).
    */
    // @ApiMember(Description="Bank links only: one bank to open directly (the provider's bank code).")
    public var preferredProvider:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case integrationId
        case method
        case returnUrl
        case preferredCountry
        case preferredProvider
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        integrationId = try container.decodeIfPresent(String.self, forKey: .integrationId)
        method = try container.decodeIfPresent(String.self, forKey: .method)
        returnUrl = try container.decodeIfPresent(String.self, forKey: .returnUrl)
        preferredCountry = try container.decodeIfPresent(String.self, forKey: .preferredCountry)
        preferredProvider = try container.decodeIfPresent(String.self, forKey: .preferredProvider)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if integrationId != nil { try container.encode(integrationId, forKey: .integrationId) }
        if method != nil { try container.encode(method, forKey: .method) }
        if returnUrl != nil { try container.encode(returnUrl, forKey: .returnUrl) }
        if preferredCountry != nil { try container.encode(preferredCountry, forKey: .preferredCountry) }
        if preferredProvider != nil { try container.encode(preferredProvider, forKey: .preferredProvider) }
    }
}

// @Route("/{version}/notifications/inbox", "GET")
public class GetNotificationInboxRequest : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetNotificationInboxResponse

    public var unreadOnly:Bool?
    public var channel:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case unreadOnly
        case channel
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        unreadOnly = try container.decodeIfPresent(Bool.self, forKey: .unreadOnly)
        channel = try container.decodeIfPresent(String.self, forKey: .channel)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if unreadOnly != nil { try container.encode(unreadOnly, forKey: .unreadOnly) }
        if channel != nil { try container.encode(channel, forKey: .channel) }
    }
}

// @Route("/{version}/notifications/inbox/unread-count", "GET")
public class GetUnreadCountRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = GetUnreadCountResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/notifications/inbox/{notificationId}/read", "POST")
public class MarkNotificationReadRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = MarkNotificationReadResponse

    public var notificationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case notificationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        notificationId = try container.decodeIfPresent(String.self, forKey: .notificationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if notificationId != nil { try container.encode(notificationId, forKey: .notificationId) }
    }
}

// @Route("/{version}/notifications/inbox/read-all", "POST")
public class MarkAllNotificationsReadRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = MarkAllNotificationsReadResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

/**
* Sign In
*/
// @Route("/auth", "GET,POST")
// @Route("/auth/{provider}", "GET,POST")
// @Route("/v3/auth", "POST,GET,OPTIONS")
// @Route("/v3/auth/{provider}", "POST,GET,OPTIONS")
// @Api(Description="Sign In")
// @DataContract
public class Authenticate : IReturn, IPost, Codable
{
    public typealias Return = AuthenticateResponse

    /**
    * AuthProvider, e.g. credentials
    */
    // @DataMember(Order=1)
    public var provider:String?

    // @DataMember(Order=2)
    public var userName:String?

    // @DataMember(Order=3)
    public var password:String?

    // @DataMember(Order=4)
    public var rememberMe:Bool?

    // @DataMember(Order=5)
    public var accessToken:String?

    // @DataMember(Order=6)
    public var accessTokenSecret:String?

    // @DataMember(Order=7)
    public var returnUrl:String?

    // @DataMember(Order=8)
    public var errorView:String?

    // @DataMember(Order=9)
    public var meta:[String:String]?

    required public init(){}
}

// @Route("/access-token")
// @DataContract
public class GetAccessToken : IReturn, IPost, Codable
{
    public typealias Return = GetAccessTokenResponse

    // @DataMember(Order=1)
    public var refreshToken:String?

    // @DataMember(Order=2)
    public var meta:[String:String]?

    required public init(){}
}

public class EchoResponse : Codable
{
    public var release:CodeMashRelease?
    public var runtime:CodeMashRuntime?
    public var managedServiceHubUrl:String?
    public var managedServiceApiUrl:String?
    public var hubUrl:String?
    public var apiUrl:String?
    public var apiVersion:String?
    public var hubVersion:String?
    public var adminUrlTemplate:String?
    public var emailServiceConfigured:Bool?
    public var rootBootstrapPasswordSource:String?
    public var regions:[EchoRegionDto]?
    public var agent:EchoAgentDto?
    public var hostingPlatform:EchoHostingPlatformDto?

    required public init(){}
}

public class PublicProjectConfigDto : Codable
{
    public var displayName:String?
    public var adminPortalEnabled:Bool?
    public var branding:PublicBrandDto?
    public var auth:PublicAuthDto?
    public var aiChat:PublicAiChatDto?

    required public init(){}
}

public class PublicLegalDocumentDto : Codable
{
    public var kind:String?
    public var title:String?
    public var body:String?
    public var available:Bool?

    required public init(){}
}

// @DataContract
public class IdResponse : ResponseBase
{
    // @DataMember
    public var id:String?

    // @DataMember
    public var status:String?

    // @DataMember
    public var warnings:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case status
        case warnings
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        status = try container.decodeIfPresent(String.self, forKey: .status)
        warnings = try container.decodeIfPresent([String].self, forKey: .warnings) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if status != nil { try container.encode(status, forKey: .status) }
        if warnings != nil { try container.encode(warnings, forKey: .warnings) }
    }
}

public class ListEndUserChatAttachmentsResponse : ResponseBase
{
    public var attachments:[EndUserChatAttachment] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case attachments
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        attachments = try container.decodeIfPresent([EndUserChatAttachment].self, forKey: .attachments) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if attachments.count > 0 { try container.encode(attachments, forKey: .attachments) }
    }
}

public class ListEndUserChatMemoryResponse : ResponseBase
{
    public var notes:[EndUserChatMemoryNote] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case notes
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        notes = try container.decodeIfPresent([EndUserChatMemoryNote].self, forKey: .notes) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if notes.count > 0 { try container.encode(notes, forKey: .notes) }
    }
}

public class GetEndUserChatAvailabilityResponse : ResponseBase
{
    public var enabled:Bool?
    public var available:Bool?
    public var reason:String?
    public var defaultAssistantId:String?
    public var assistants:[EndUserChatAssistant] = []
    public var plan:EndUserChatPlan?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case enabled
        case available
        case reason
        case defaultAssistantId
        case assistants
        case plan
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
        available = try container.decodeIfPresent(Bool.self, forKey: .available)
        reason = try container.decodeIfPresent(String.self, forKey: .reason)
        defaultAssistantId = try container.decodeIfPresent(String.self, forKey: .defaultAssistantId)
        assistants = try container.decodeIfPresent([EndUserChatAssistant].self, forKey: .assistants) ?? []
        plan = try container.decodeIfPresent(EndUserChatPlan.self, forKey: .plan)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if enabled != nil { try container.encode(enabled, forKey: .enabled) }
        if available != nil { try container.encode(available, forKey: .available) }
        if reason != nil { try container.encode(reason, forKey: .reason) }
        if defaultAssistantId != nil { try container.encode(defaultAssistantId, forKey: .defaultAssistantId) }
        if assistants.count > 0 { try container.encode(assistants, forKey: .assistants) }
        if plan != nil { try container.encode(plan, forKey: .plan) }
    }
}

public class ListEndUserChatSessionsResponse : ResponseBase
{
    public var sessions:[EndUserChatSession] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case sessions
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sessions = try container.decodeIfPresent([EndUserChatSession].self, forKey: .sessions) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if sessions.count > 0 { try container.encode(sessions, forKey: .sessions) }
    }
}

public class GetEndUserChatSessionResponse : ResponseBase
{
    public var session:EndUserChatSession?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case session
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        session = try container.decodeIfPresent(EndUserChatSession.self, forKey: .session)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if session != nil { try container.encode(session, forKey: .session) }
    }
}

public class GetEndUserChatEntriesResponse : ResponseBase
{
    public var sessionId:String?
    public var entries:[AiChatEntryWireDto] = []
    public var lastSeq:Int?
    public var hasMore:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case sessionId
        case entries
        case lastSeq
        case hasMore
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sessionId = try container.decodeIfPresent(String.self, forKey: .sessionId)
        entries = try container.decodeIfPresent([AiChatEntryWireDto].self, forKey: .entries) ?? []
        lastSeq = try container.decodeIfPresent(Int.self, forKey: .lastSeq)
        hasMore = try container.decodeIfPresent(Bool.self, forKey: .hasMore)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if sessionId != nil { try container.encode(sessionId, forKey: .sessionId) }
        if entries.count > 0 { try container.encode(entries, forKey: .entries) }
        if lastSeq != nil { try container.encode(lastSeq, forKey: .lastSeq) }
        if hasMore != nil { try container.encode(hasMore, forKey: .hasMore) }
    }
}

public class StartEndUserChatTurnResponse : ResponseBase
{
    public var turnId:String?
    public var sessionId:String?
    public var channel:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case turnId
        case sessionId
        case channel
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        turnId = try container.decodeIfPresent(String.self, forKey: .turnId)
        sessionId = try container.decodeIfPresent(String.self, forKey: .sessionId)
        channel = try container.decodeIfPresent(String.self, forKey: .channel)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if turnId != nil { try container.encode(turnId, forKey: .turnId) }
        if sessionId != nil { try container.encode(sessionId, forKey: .sessionId) }
        if channel != nil { try container.encode(channel, forKey: .channel) }
    }
}

public class GetEndUserAiToolsResponse : ResponseBase
{
    public var tools:[EndUserAiTool]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case tools
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tools = try container.decodeIfPresent([EndUserAiTool].self, forKey: .tools) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if tools != nil { try container.encode(tools, forKey: .tools) }
    }
}

public class InvokeEndUserAiToolResponse : ResponseBase
{
    public var result:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case result
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        result = try container.decodeIfPresent(String.self, forKey: .result)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if result != nil { try container.encode(result, forKey: .result) }
    }
}

public class GetUserResponse : ResponseBase
{
    public var user:AuthDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case user
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        user = try container.decodeIfPresent(AuthDto.self, forKey: .user)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if user != nil { try container.encode(user, forKey: .user) }
    }
}

public class GetUsersResponse : ResponseBase
{
    public var list:PaginatedResponse<AuthDto>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<AuthDto>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetUserPreferencesResponse : ResponseBase
{
    public var preferences:UserMarketingPreferencesDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case preferences
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        preferences = try container.decodeIfPresent(UserMarketingPreferencesDto.self, forKey: .preferences)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if preferences != nil { try container.encode(preferences, forKey: .preferences) }
    }
}

public class PasskeyOkResponse : ResponseBase
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class PasskeyCeremonyOptionsResponse : ResponseBase
{
    public var ceremonyId:String?
    public var optionsJson:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case ceremonyId
        case optionsJson
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        ceremonyId = try container.decodeIfPresent(String.self, forKey: .ceremonyId)
        optionsJson = try container.decodeIfPresent(String.self, forKey: .optionsJson)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if ceremonyId != nil { try container.encode(ceremonyId, forKey: .ceremonyId) }
        if optionsJson != nil { try container.encode(optionsJson, forKey: .optionsJson) }
    }
}

public class PasskeyAuthTokensResponse : ResponseBase
{
    public var accessToken:String?
    public var refreshToken:String?
    public var expiresInSeconds:Int?
    public var recoveryCodes:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case accessToken
        case refreshToken
        case expiresInSeconds
        case recoveryCodes
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        accessToken = try container.decodeIfPresent(String.self, forKey: .accessToken)
        refreshToken = try container.decodeIfPresent(String.self, forKey: .refreshToken)
        expiresInSeconds = try container.decodeIfPresent(Int.self, forKey: .expiresInSeconds)
        recoveryCodes = try container.decodeIfPresent([String].self, forKey: .recoveryCodes) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if accessToken != nil { try container.encode(accessToken, forKey: .accessToken) }
        if refreshToken != nil { try container.encode(refreshToken, forKey: .refreshToken) }
        if expiresInSeconds != nil { try container.encode(expiresInSeconds, forKey: .expiresInSeconds) }
        if recoveryCodes != nil { try container.encode(recoveryCodes, forKey: .recoveryCodes) }
    }
}

public class PasskeyListResponse : ResponseBase
{
    public var passkeys:[PasskeyListItemDto] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case passkeys
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        passkeys = try container.decodeIfPresent([PasskeyListItemDto].self, forKey: .passkeys) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if passkeys.count > 0 { try container.encode(passkeys, forKey: .passkeys) }
    }
}

public class PasskeyRecoveryResponse : ResponseBase
{
    public var accessToken:String?
    public var refreshToken:String?
    public var expiresInSeconds:Int?
    public var remainingCodes:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case accessToken
        case refreshToken
        case expiresInSeconds
        case remainingCodes
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        accessToken = try container.decodeIfPresent(String.self, forKey: .accessToken)
        refreshToken = try container.decodeIfPresent(String.self, forKey: .refreshToken)
        expiresInSeconds = try container.decodeIfPresent(Int.self, forKey: .expiresInSeconds)
        remainingCodes = try container.decodeIfPresent(Int.self, forKey: .remainingCodes)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if accessToken != nil { try container.encode(accessToken, forKey: .accessToken) }
        if refreshToken != nil { try container.encode(refreshToken, forKey: .refreshToken) }
        if expiresInSeconds != nil { try container.encode(expiresInSeconds, forKey: .expiresInSeconds) }
        if remainingCodes != nil { try container.encode(remainingCodes, forKey: .remainingCodes) }
    }
}

public class PasskeyVerificationTokenResponse : ResponseBase
{
    public var verificationToken:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case verificationToken
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        verificationToken = try container.decodeIfPresent(String.self, forKey: .verificationToken)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if verificationToken != nil { try container.encode(verificationToken, forKey: .verificationToken) }
    }
}

public class FindMergedTermTreeResponse : ResponseBase
{
    public var tree:[TermTreeDto]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case tree
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tree = try container.decodeIfPresent([TermTreeDto].self, forKey: .tree) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if tree != nil { try container.encode(tree, forKey: .tree) }
    }
}

public class FindTaxonomyTreeResponse : ResponseBase
{
    public var tree:[TaxonomyTreeDto]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case tree
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tree = try container.decodeIfPresent([TaxonomyTreeDto].self, forKey: .tree) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if tree != nil { try container.encode(tree, forKey: .tree) }
    }
}

public class FindTermsResponse : ResponseBase
{
    public var list:PaginatedResponse<TermDto>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<TermDto>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class FindTermsChildrenResponse : ResponseBase
{
    public var list:PaginatedResponse<TermDto>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<TermDto>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class FindTermTreeResponse : ResponseBase
{
    public var tree:[TermTreeDto]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case tree
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tree = try container.decodeIfPresent([TermTreeDto].self, forKey: .tree) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if tree != nil { try container.encode(tree, forKey: .tree) }
    }
}

public class GetDatabaseSchemaResponse : ResponseBase
{
    public var item:SchemaDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(SchemaDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetDatabaseSchemasResponse : ResponseBase
{
    public var list:PaginatedResponse<SchemaListProjection>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<SchemaListProjection>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class AggregateResponse : ResponseBase
{
    public var result:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case result
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        result = try container.decodeIfPresent([String].self, forKey: .result) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if result != nil { try container.encode(result, forKey: .result) }
    }
}

public class CountResponse : ResponseBase
{
    public var count:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case count
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        count = try container.decodeIfPresent(Int.self, forKey: .count)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if count != nil { try container.encode(count, forKey: .count) }
    }
}

public class DistinctResponse : ResponseBase
{
    public var values:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case values
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        values = try container.decodeIfPresent([String].self, forKey: .values) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if values != nil { try container.encode(values, forKey: .values) }
    }
}

public class ExecuteAggregateResponse : ResponseBase
{
    public var result:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case result
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        result = try container.decodeIfPresent([String].self, forKey: .result) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if result != nil { try container.encode(result, forKey: .result) }
    }
}

public class FindResponse : ResponseBase
{
    public var list:PaginatedResponse<String>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<String>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class FindOneResponse : ResponseBase
{
    public var result:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case result
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        result = try container.decodeIfPresent(String.self, forKey: .result)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if result != nil { try container.encode(result, forKey: .result) }
    }
}

public class GetFileByIdResponse : ResponseBase
{
    public var file:FileResourceRefDto?
    public var isPublic:Bool?
    public var publicUrl:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case file
        case isPublic
        case publicUrl
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        file = try container.decodeIfPresent(FileResourceRefDto.self, forKey: .file)
        isPublic = try container.decodeIfPresent(Bool.self, forKey: .isPublic)
        publicUrl = try container.decodeIfPresent(String.self, forKey: .publicUrl)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if file != nil { try container.encode(file, forKey: .file) }
        if isPublic != nil { try container.encode(isPublic, forKey: .isPublic) }
        if publicUrl != nil { try container.encode(publicUrl, forKey: .publicUrl) }
    }
}

public class GetFileInfoResponse : ResponseBase
{
    public var file:FileResourceRefDto?
    public var isPublic:Bool?
    public var publicUrl:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case file
        case isPublic
        case publicUrl
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        file = try container.decodeIfPresent(FileResourceRefDto.self, forKey: .file)
        isPublic = try container.decodeIfPresent(Bool.self, forKey: .isPublic)
        publicUrl = try container.decodeIfPresent(String.self, forKey: .publicUrl)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if file != nil { try container.encode(file, forKey: .file) }
        if isPublic != nil { try container.encode(isPublic, forKey: .isPublic) }
        if publicUrl != nil { try container.encode(publicUrl, forKey: .publicUrl) }
    }
}

public class GetSignedUrlResponse : ResponseBase
{
    public var url:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case url
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if url != nil { try container.encode(url, forKey: .url) }
    }
}

public class ListFilesResponse : ResponseBase
{
    public var list:PaginatedResponse<FileResourceRefDto>?
    public var folders:IList<String>?
    public var publicFolders:IList<PublicFolderDto>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
        case folders
        case publicFolders
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<FileResourceRefDto>.self, forKey: .list)
        folders = try container.decodeIfPresent(IList<String>.self, forKey: .folders)
        publicFolders = try container.decodeIfPresent(IList<PublicFolderDto>.self, forKey: .publicFolders)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
        if folders != nil { try container.encode(folders, forKey: .folders) }
        if publicFolders != nil { try container.encode(publicFolders, forKey: .publicFolders) }
    }
}

public class RegisterFilesResponse : ResponseBase
{
    public var dryRun:Bool?
    public var registered:Int?
    public var unchanged:Int?
    public var failed:Int?
    public var items:[RegisterFileResult]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case dryRun
        case registered
        case unchanged
        case failed
        case items
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        dryRun = try container.decodeIfPresent(Bool.self, forKey: .dryRun)
        registered = try container.decodeIfPresent(Int.self, forKey: .registered)
        unchanged = try container.decodeIfPresent(Int.self, forKey: .unchanged)
        failed = try container.decodeIfPresent(Int.self, forKey: .failed)
        items = try container.decodeIfPresent([RegisterFileResult].self, forKey: .items) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if dryRun != nil { try container.encode(dryRun, forKey: .dryRun) }
        if registered != nil { try container.encode(registered, forKey: .registered) }
        if unchanged != nil { try container.encode(unchanged, forKey: .unchanged) }
        if failed != nil { try container.encode(failed, forKey: .failed) }
        if items != nil { try container.encode(items, forKey: .items) }
    }
}

public class RequestUploadUrlResponse : ResponseBase
{
    public var url:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case url
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if url != nil { try container.encode(url, forKey: .url) }
    }
}

// @DataContract
public class TestFilesIntegrationResponse : ResponseBase
{
    // @DataMember
    public var items:IReadOnlyList<IntegrationTestResultItemDto>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case items
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decodeIfPresent(IReadOnlyList<IntegrationTestResultItemDto>.self, forKey: .items)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if items != nil { try container.encode(items, forKey: .items) }
    }
}

public class GetOwnPushDevicesResponse : ResponseBase
{
    public var items:[OwnPushDeviceDto] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case items
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decodeIfPresent([OwnPushDeviceDto].self, forKey: .items) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if items.count > 0 { try container.encode(items, forKey: .items) }
    }
}

public class GetOwnPushMessagesResponse : ResponseBase
{
    public var list:PaginatedResponse<OwnPushMessageDto>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<OwnPushMessageDto>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class WriteLogsResponse : ResponseBase
{
    public var accepted:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case accepted
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        accepted = try container.decodeIfPresent(Int.self, forKey: .accepted)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if accepted != nil { try container.encode(accepted, forKey: .accepted) }
    }
}

public class GetPaymentOrderResponse : ResponseBase
{
    public var item:PaymentOrderDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(PaymentOrderDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetPaymentOrdersResponse : ResponseBase
{
    public var list:PaginatedResponse<PaymentOrderDto>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<PaymentOrderDto>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class StartPaymentCheckoutResponse : ResponseBase
{
    public var checkout:PaymentOrderCheckoutDto?
    public var reused:Bool?
    public var order:PaymentOrderDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case checkout
        case reused
        case order
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        checkout = try container.decodeIfPresent(PaymentOrderCheckoutDto.self, forKey: .checkout)
        reused = try container.decodeIfPresent(Bool.self, forKey: .reused)
        order = try container.decodeIfPresent(PaymentOrderDto.self, forKey: .order)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if checkout != nil { try container.encode(checkout, forKey: .checkout) }
        if reused != nil { try container.encode(reused, forKey: .reused) }
        if order != nil { try container.encode(order, forKey: .order) }
    }
}

public class GetNotificationInboxResponse : ResponseBase
{
    public var list:PaginatedResponse<InAppNotificationDto>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<InAppNotificationDto>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetUnreadCountResponse : ResponseBase
{
    public var count:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case count
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        count = try container.decodeIfPresent(Int.self, forKey: .count)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if count != nil { try container.encode(count, forKey: .count) }
    }
}

public class MarkNotificationReadResponse : ResponseBase
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class MarkAllNotificationsReadResponse : ResponseBase
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @DataContract
public class AuthenticateResponse : IHasSessionId, IHasBearerToken, Codable
{
    // @DataMember(Order=1)
    public var userId:String?

    // @DataMember(Order=2)
    public var sessionId:String?

    // @DataMember(Order=3)
    public var userName:String?

    // @DataMember(Order=4)
    public var displayName:String?

    // @DataMember(Order=5)
    public var referrerUrl:String?

    // @DataMember(Order=6)
    public var bearerToken:String?

    // @DataMember(Order=7)
    public var refreshToken:String?

    // @DataMember(Order=8)
    public var refreshTokenExpiry:Date?

    // @DataMember(Order=9)
    public var profileUrl:String?

    // @DataMember(Order=10)
    public var roles:[String]?

    // @DataMember(Order=11)
    public var permissions:[String]?

    // @DataMember(Order=12)
    public var authProvider:String?

    // @DataMember(Order=13)
    public var responseStatus:ResponseStatus?

    // @DataMember(Order=14)
    public var meta:[String:String]?

    required public init(){}
}

// @DataContract
public class GetAccessTokenResponse : Codable
{
    // @DataMember(Order=1)
    public var accessToken:String?

    // @DataMember(Order=2)
    public var meta:[String:String]?

    // @DataMember(Order=3)
    public var responseStatus:ResponseStatus?

    required public init(){}
}

public class StringFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var format:String?

    // @DataMember
    public var pattern:String?

    // @DataMember
    public var minLength:Int?

    // @DataMember
    public var maxLength:Int?

    // @DataMember
    public var translateOptions:IReadOnlyDictionary<String, String>?

    // @DataMember
    public var `default`:String?

    // @DataMember
    public var unique:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case format
        case pattern
        case minLength
        case maxLength
        case translateOptions
        case `default`
        case unique
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        format = try container.decodeIfPresent(String.self, forKey: .format)
        pattern = try container.decodeIfPresent(String.self, forKey: .pattern)
        minLength = try container.decodeIfPresent(Int.self, forKey: .minLength)
        maxLength = try container.decodeIfPresent(Int.self, forKey: .maxLength)
        translateOptions = try container.decodeIfPresent(IReadOnlyDictionary<String, String>.self, forKey: .translateOptions)
        `default` = try container.decodeIfPresent(String.self, forKey: .`default`)
        unique = try container.decodeIfPresent(Bool.self, forKey: .unique)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if format != nil { try container.encode(format, forKey: .format) }
        if pattern != nil { try container.encode(pattern, forKey: .pattern) }
        if minLength != nil { try container.encode(minLength, forKey: .minLength) }
        if maxLength != nil { try container.encode(maxLength, forKey: .maxLength) }
        if translateOptions != nil { try container.encode(translateOptions, forKey: .translateOptions) }
        if `default` != nil { try container.encode(`default`, forKey: .`default`) }
        if unique != nil { try container.encode(unique, forKey: .unique) }
    }
}

public class DecimalFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var minimum:Double?

    // @DataMember
    public var maximum:Double?

    // @DataMember
    public var multipleOf:Double?

    // @DataMember
    public var `default`:Double?

    // @DataMember
    public var unique:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case minimum
        case maximum
        case multipleOf
        case `default`
        case unique
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        minimum = try container.decodeIfPresent(Double.self, forKey: .minimum)
        maximum = try container.decodeIfPresent(Double.self, forKey: .maximum)
        multipleOf = try container.decodeIfPresent(Double.self, forKey: .multipleOf)
        `default` = try container.decodeIfPresent(Double.self, forKey: .`default`)
        unique = try container.decodeIfPresent(Bool.self, forKey: .unique)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if minimum != nil { try container.encode(minimum, forKey: .minimum) }
        if maximum != nil { try container.encode(maximum, forKey: .maximum) }
        if multipleOf != nil { try container.encode(multipleOf, forKey: .multipleOf) }
        if `default` != nil { try container.encode(`default`, forKey: .`default`) }
        if unique != nil { try container.encode(unique, forKey: .unique) }
    }
}

public class CurrencyFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var allowedCurrencies:IReadOnlyList<String>?

    // @DataMember
    public var multipleOf:Double?

    // @DataMember
    public var minimum:Double?

    // @DataMember
    public var maximum:Double?

    // @DataMember
    public var `default`:CurrencyDefaultDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case allowedCurrencies
        case multipleOf
        case minimum
        case maximum
        case `default`
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        allowedCurrencies = try container.decodeIfPresent(IReadOnlyList<String>.self, forKey: .allowedCurrencies)
        multipleOf = try container.decodeIfPresent(Double.self, forKey: .multipleOf)
        minimum = try container.decodeIfPresent(Double.self, forKey: .minimum)
        maximum = try container.decodeIfPresent(Double.self, forKey: .maximum)
        `default` = try container.decodeIfPresent(CurrencyDefaultDto.self, forKey: .`default`)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if allowedCurrencies != nil { try container.encode(allowedCurrencies, forKey: .allowedCurrencies) }
        if multipleOf != nil { try container.encode(multipleOf, forKey: .multipleOf) }
        if minimum != nil { try container.encode(minimum, forKey: .minimum) }
        if maximum != nil { try container.encode(maximum, forKey: .maximum) }
        if `default` != nil { try container.encode(`default`, forKey: .`default`) }
    }
}

public class BooleanFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var `default`:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case `default`
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        `default` = try container.decodeIfPresent(Bool.self, forKey: .`default`)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if `default` != nil { try container.encode(`default`, forKey: .`default`) }
    }
}

public class DateFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var minimum:Int?

    // @DataMember
    public var maximum:Int?

    // @DataMember
    public var `default`:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case minimum
        case maximum
        case `default`
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        minimum = try container.decodeIfPresent(Int.self, forKey: .minimum)
        maximum = try container.decodeIfPresent(Int.self, forKey: .maximum)
        `default` = try container.decodeIfPresent(Int.self, forKey: .`default`)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if minimum != nil { try container.encode(minimum, forKey: .minimum) }
        if maximum != nil { try container.encode(maximum, forKey: .maximum) }
        if `default` != nil { try container.encode(`default`, forKey: .`default`) }
    }
}

public class IntegerFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var minimum:Int?

    // @DataMember
    public var maximum:Int?

    // @DataMember
    public var `default`:Int?

    // @DataMember
    public var unique:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case minimum
        case maximum
        case `default`
        case unique
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        minimum = try container.decodeIfPresent(Int.self, forKey: .minimum)
        maximum = try container.decodeIfPresent(Int.self, forKey: .maximum)
        `default` = try container.decodeIfPresent(Int.self, forKey: .`default`)
        unique = try container.decodeIfPresent(Bool.self, forKey: .unique)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if minimum != nil { try container.encode(minimum, forKey: .minimum) }
        if maximum != nil { try container.encode(maximum, forKey: .maximum) }
        if `default` != nil { try container.encode(`default`, forKey: .`default`) }
        if unique != nil { try container.encode(unique, forKey: .unique) }
    }
}

public class GeolocationFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var allowedTypes:IReadOnlyList<String>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case allowedTypes
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        allowedTypes = try container.decodeIfPresent(IReadOnlyList<String>.self, forKey: .allowedTypes)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if allowedTypes != nil { try container.encode(allowedTypes, forKey: .allowedTypes) }
    }
}

public class TagsFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var minItems:Int?

    // @DataMember
    public var maxItems:Int?

    // @DataMember
    public var `default`:IReadOnlyList<String>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case minItems
        case maxItems
        case `default`
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        minItems = try container.decodeIfPresent(Int.self, forKey: .minItems)
        maxItems = try container.decodeIfPresent(Int.self, forKey: .maxItems)
        `default` = try container.decodeIfPresent(IReadOnlyList<String>.self, forKey: .`default`)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if minItems != nil { try container.encode(minItems, forKey: .minItems) }
        if maxItems != nil { try container.encode(maxItems, forKey: .maxItems) }
        if `default` != nil { try container.encode(`default`, forKey: .`default`) }
    }
}

public class FileFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var storages:IReadOnlyList<String>?

    // @DataMember
    public var minItems:Int?

    // @DataMember
    public var maxItems:Int?

    // @DataMember
    public var allowedFileType:String?

    // @DataMember
    public var maxSizeMb:Double?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case storages
        case minItems
        case maxItems
        case allowedFileType
        case maxSizeMb
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        storages = try container.decodeIfPresent(IReadOnlyList<String>.self, forKey: .storages)
        minItems = try container.decodeIfPresent(Int.self, forKey: .minItems)
        maxItems = try container.decodeIfPresent(Int.self, forKey: .maxItems)
        allowedFileType = try container.decodeIfPresent(String.self, forKey: .allowedFileType)
        maxSizeMb = try container.decodeIfPresent(Double.self, forKey: .maxSizeMb)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if storages != nil { try container.encode(storages, forKey: .storages) }
        if minItems != nil { try container.encode(minItems, forKey: .minItems) }
        if maxItems != nil { try container.encode(maxItems, forKey: .maxItems) }
        if allowedFileType != nil { try container.encode(allowedFileType, forKey: .allowedFileType) }
        if maxSizeMb != nil { try container.encode(maxSizeMb, forKey: .maxSizeMb) }
    }
}

public class TaxonomySelectionFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var taxonomyId:String?

    // @DataMember
    public var multiple:Bool?

    // @DataMember
    public var displayField:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case taxonomyId
        case multiple
        case displayField
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        taxonomyId = try container.decodeIfPresent(String.self, forKey: .taxonomyId)
        multiple = try container.decodeIfPresent(Bool.self, forKey: .multiple)
        displayField = try container.decodeIfPresent(String.self, forKey: .displayField)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if taxonomyId != nil { try container.encode(taxonomyId, forKey: .taxonomyId) }
        if multiple != nil { try container.encode(multiple, forKey: .multiple) }
        if displayField != nil { try container.encode(displayField, forKey: .displayField) }
    }
}

public class CollectionSelectionFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var collectionId:String?

    // @DataMember
    public var displayField:String?

    // @DataMember
    public var multiple:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionId
        case displayField
        case multiple
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionId = try container.decodeIfPresent(String.self, forKey: .collectionId)
        displayField = try container.decodeIfPresent(String.self, forKey: .displayField)
        multiple = try container.decodeIfPresent(Bool.self, forKey: .multiple)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionId != nil { try container.encode(collectionId, forKey: .collectionId) }
        if displayField != nil { try container.encode(displayField, forKey: .displayField) }
        if multiple != nil { try container.encode(multiple, forKey: .multiple) }
    }
}

public class UserSelectionFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var multiple:Bool?

    // @DataMember
    public var displayField:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case multiple
        case displayField
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        multiple = try container.decodeIfPresent(Bool.self, forKey: .multiple)
        displayField = try container.decodeIfPresent(String.self, forKey: .displayField)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if multiple != nil { try container.encode(multiple, forKey: .multiple) }
        if displayField != nil { try container.encode(displayField, forKey: .displayField) }
    }
}

public class RoleSelectionFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var multiple:Bool?

    // @DataMember
    public var displayField:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case multiple
        case displayField
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        multiple = try container.decodeIfPresent(Bool.self, forKey: .multiple)
        displayField = try container.decodeIfPresent(String.self, forKey: .displayField)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if multiple != nil { try container.encode(multiple, forKey: .multiple) }
        if displayField != nil { try container.encode(displayField, forKey: .displayField) }
    }
}

public class EnumSelectionFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var values:IReadOnlyList<String>?

    // @DataMember
    public var multiple:Bool?

    // @DataMember
    public var `default`:IReadOnlyList<String>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case values
        case multiple
        case `default`
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        values = try container.decodeIfPresent(IReadOnlyList<String>.self, forKey: .values)
        multiple = try container.decodeIfPresent(Bool.self, forKey: .multiple)
        `default` = try container.decodeIfPresent(IReadOnlyList<String>.self, forKey: .`default`)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if values != nil { try container.encode(values, forKey: .values) }
        if multiple != nil { try container.encode(multiple, forKey: .multiple) }
        if `default` != nil { try container.encode(`default`, forKey: .`default`) }
    }
}

public class ObjectFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var properties:IReadOnlyList<JsonSchemaFieldDto>?

    // @DataMember
    public var required:IReadOnlyList<String>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case properties
        case required
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        properties = try container.decodeIfPresent(IReadOnlyList<JsonSchemaFieldDto>.self, forKey: .properties)
        required = try container.decodeIfPresent(IReadOnlyList<String>.self, forKey: .required)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if properties != nil { try container.encode(properties, forKey: .properties) }
        if required != nil { try container.encode(required, forKey: .required) }
    }
}

public class ArrayFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var items:JsonSchemaFieldDto?

    // @DataMember
    public var minItems:Int?

    // @DataMember
    public var maxItems:Int?

    // @DataMember
    public var uniqueItems:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case items
        case minItems
        case maxItems
        case uniqueItems
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decodeIfPresent(JsonSchemaFieldDto.self, forKey: .items)
        minItems = try container.decodeIfPresent(Int.self, forKey: .minItems)
        maxItems = try container.decodeIfPresent(Int.self, forKey: .maxItems)
        uniqueItems = try container.decodeIfPresent(Bool.self, forKey: .uniqueItems)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if items != nil { try container.encode(items, forKey: .items) }
        if minItems != nil { try container.encode(minItems, forKey: .minItems) }
        if maxItems != nil { try container.encode(maxItems, forKey: .maxItems) }
        if uniqueItems != nil { try container.encode(uniqueItems, forKey: .uniqueItems) }
    }
}

public class JsonFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var maxBytes:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case maxBytes
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        maxBytes = try container.decodeIfPresent(Int.self, forKey: .maxBytes)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if maxBytes != nil { try container.encode(maxBytes, forKey: .maxBytes) }
    }
}

// @DataContract(Namespace="http://codemash.io/types/")
public class RequestBase : IVersionBasedRequest, IHasCorrelationIdRequest, Codable
{
    /**
    * TimeZone
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="TimeZone", Name="TimeZoneId", ParameterType="header")
    public var timeZoneId:String?

    /**
    * The CodeMash API version used to fetch data from the API. If not specified, the last version will be used.  E.g.: v3
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="The CodeMash API version used to fetch data from the API. If not specified, the last version will be used.  E.g.: v3", IsRequired=true, Name="version", ParameterType="path")
    public var version:String?

    /**
    * CorrelationId for each request
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="CorrelationId for each request", Name="CorrelationId", ParameterType="header")
    public var correlationId:String?

    required public init(){}
}

public protocol IVersionBasedRequest
{
    var version:String? { get set }

}

public protocol IHasCorrelationIdRequest
{
    var correlationId:String? { get set }

}

// @DataContract(Namespace="http://codemash.io/types/")
public class CodeMashRequestBase : RequestBase, IHasProjectId, IHasEnv
{
    /**
    * ID of your project. Can be passed in a header as norbix-project-id.
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="ID of your project. Can be passed in a header as norbix-project-id.", IsRequired=true, Name="norbix-project-id", ParameterType="header")
    public var projectId:String?

    /**
    * Target environment for this request (e.g. TEST, STAGING). Optional — when omitted the request runs against PROD. Can be passed in a header as norbix-env.
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="Target environment for this request (e.g. TEST, STAGING). Optional — when omitted the request runs against PROD. Can be passed in a header as norbix-env.", Name="norbix-env", ParameterType="header")
    public var env:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case projectId
        case env
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        projectId = try container.decodeIfPresent(String.self, forKey: .projectId)
        env = try container.decodeIfPresent(String.self, forKey: .env)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if projectId != nil { try container.encode(projectId, forKey: .projectId) }
        if env != nil { try container.encode(env, forKey: .env) }
    }
}

public protocol IHasProjectId
{
    var projectId:String? { get set }

}

public protocol IHasEnv
{
    var env:String? { get set }

}

public class UserGeneralInfoDto : Codable
{
    public var phone:String?
    public var primaryEmail:String?
    public var displayName:String?
    public var firstName:String?
    public var lastName:String?
    public var fullName:String?
    public var addressLine1:String?
    public var addressLine2:String?
    public var country:String?
    public var city:String?
    public var state:String?
    public var postalCode:String?
    public var company:String?
    public var gender:Gender?
    public var birthDate:Int?
    public var timeZone:String?
    public var language:String?
    public var blockAllMarketingMessages:Bool?
    public var blockedTags:[String:HashSet<String>]?
    public var blockReasons:[MarketingBlockReason]?
    public var extraMetadata:String?
    public var notes:String?

    required public init(){}
}

// @DataContract
public class SaveUserWithRolesBase : SaveUser
{
    // @DataMember
    public var roles:[String] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case roles
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        roles = try container.decodeIfPresent([String].self, forKey: .roles) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if roles.count > 0 { try container.encode(roles, forKey: .roles) }
    }
}

// @DataContract
public class SaveUser : CodeMashRequestBase
{
    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    public var databaseIntegrationId:String?

    /**
    * User Info
    */
    // @DataMember
    // @ApiMember(DataType="object", Description="User Info", Name="UserGeneralInfo", ParameterType="body")
    public var userGeneralInfo:UserGeneralInfoDto?

    /**
    * Attach this login to an existing user id. Optional.
    */
    // @DataMember
    // @ApiMember(Description="Attach this login to an existing user id. Optional.")
    public var userId:String?

    /**
    * Ignore UserRegistersAsRole from Membership Settings
    */
    // @DataMember
    // @ApiMember(DataType="boolean", Description="Ignore UserRegistersAsRole from Membership Settings", Name="IgnoreUserRegistersAsRole", ParameterType="body")
    public var ignoreUserRegistersAsRole:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case databaseIntegrationId
        case userGeneralInfo
        case userId
        case ignoreUserRegistersAsRole
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        userGeneralInfo = try container.decodeIfPresent(UserGeneralInfoDto.self, forKey: .userGeneralInfo)
        userId = try container.decodeIfPresent(String.self, forKey: .userId)
        ignoreUserRegistersAsRole = try container.decodeIfPresent(Bool.self, forKey: .ignoreUserRegistersAsRole)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if userGeneralInfo != nil { try container.encode(userGeneralInfo, forKey: .userGeneralInfo) }
        if userId != nil { try container.encode(userId, forKey: .userId) }
        if ignoreUserRegistersAsRole != nil { try container.encode(ignoreUserRegistersAsRole, forKey: .ignoreUserRegistersAsRole) }
    }
}

public protocol IPublicRegistrationRequest
{
    var roles:[String]? { get set }

}

public class CodeMashListPaginationRequestBase : RequestBase, IHasProjectId, IHasEnv
{
    /**
    * ID of your project. Can be passed in a header as norbix-project-id.
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="ID of your project. Can be passed in a header as norbix-project-id.", IsRequired=true, Name="norbix-project-id", ParameterType="header")
    public var projectId:String?

    /**
    * Target environment for this request (e.g. TEST, STAGING). Optional — when omitted the request runs against PROD. Can be passed in a header as norbix-env.
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="Target environment for this request (e.g. TEST, STAGING). Optional — when omitted the request runs against PROD. Can be passed in a header as norbix-env.", Name="norbix-env", ParameterType="header")
    public var env:String?

    /**
    * Cursor token — fetch the page AFTER this item.
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="Cursor token — fetch the page AFTER this item.", Name="startingAfter", ParameterType="query")
    public var startingAfter:String?

    /**
    * Cursor token — fetch the page BEFORE this item.
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="Cursor token — fetch the page BEFORE this item.", Name="endingBefore", ParameterType="query")
    public var endingBefore:String?

    /**
    * Amount of records to return.
    */
    // @DataMember
    // @ApiMember(DataType="integer", Description="Amount of records to return.", Format="int32", Name="pageSize", ParameterType="query")
    public var pageSize:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case projectId
        case env
        case startingAfter
        case endingBefore
        case pageSize
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        projectId = try container.decodeIfPresent(String.self, forKey: .projectId)
        env = try container.decodeIfPresent(String.self, forKey: .env)
        startingAfter = try container.decodeIfPresent(String.self, forKey: .startingAfter)
        endingBefore = try container.decodeIfPresent(String.self, forKey: .endingBefore)
        pageSize = try container.decodeIfPresent(Int.self, forKey: .pageSize)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if projectId != nil { try container.encode(projectId, forKey: .projectId) }
        if env != nil { try container.encode(env, forKey: .env) }
        if startingAfter != nil { try container.encode(startingAfter, forKey: .startingAfter) }
        if endingBefore != nil { try container.encode(endingBefore, forKey: .endingBefore) }
        if pageSize != nil { try container.encode(pageSize, forKey: .pageSize) }
    }
}

public protocol IPasskeyCeremonyRequest
{
}

public class PagingArgs : Codable
{
    public var cursorArgs:CursorArgs?
    public var pageSize:Int?
    public var startingAfter:String?
    public var endingBefore:String?

    required public init(){}
}

// @DataContract
public class RegisterFileItem : Codable
{
    // @DataMember
    public var path:String?

    // @DataMember
    public var ownerUserId:String?

    // @DataMember
    public var contentType:String?

    // @DataMember
    public var sizeBytes:Int?

    // @DataMember
    public var fileName:String?

    required public init(){}
}

public class WriteLogEntry : Codable
{
    /**
    * information (default), warning or error.
    */
    // @ApiMember(Description="information (default), warning or error.")
    public var level:String?

    /**
    * A short line, 1–200 characters — what the Logs list shows.
    */
    // @ApiMember(Description="A short line, 1–200 characters — what the Logs list shows.", IsRequired=true)
    public var title:String?

    /**
    * Details, at most 8 000 characters.
    */
    // @ApiMember(Description="Details, at most 8 000 characters.")
    public var message:String?

    /**
    * Your own code for this kind of line, e.g. order:paid — lower case letters, digits and _ . : -, at most 64. Stored as app:<code>; app:log when empty.
    */
    // @ApiMember(Description="Your own code for this kind of line, e.g. order:paid — lower case letters, digits and _ . : -, at most 64. Stored as app:<code>; app:log when empty.")
    public var eventCode:String?

    /**
    * Groups your lines into one flow in the Logs details view: at most 64 letters, digits, _ or -. Empty = the id of this request.
    */
    // @ApiMember(Description="Groups your lines into one flow in the Logs details view: at most 64 letters, digits, _ or -. Empty = the id of this request.")
    public var correlationId:String?

    /**
    * When it happened (UTC). Empty = when Norbix received it. At most 7 days old and at most 5 minutes ahead.
    */
    // @ApiMember(Description="When it happened (UTC). Empty = when Norbix received it. At most 7 days old and at most 5 minutes ahead.")
    public var timestamp:Date?

    /**
    * Extra fields, at most 20; key at most 64, value at most 2 000 characters. Values under secret-looking keys (password, token, apiKey …) are masked.
    */
    // @ApiMember(Description="Extra fields, at most 20; key at most 64, value at most 2 000 characters. Values under secret-looking keys (password, token, apiKey …) are masked.")
    public var meta:[String:String]?

    required public init(){}
}

// @DataContract
public class PaymentOrderLineInput : Codable
{
    // @DataMember
    public var sku:String?

    // @DataMember
    public var title:String?

    // @DataMember
    public var quantity:Int?

    // @DataMember
    public var unitAmountMinor:Int?

    required public init(){}
}

// @DataContract
public enum CodeMashRelease : String, Codable
{
    case NotSet
    case Community
    case ManagedService
    case Enterprise
}

public enum CodeMashRuntime : String, Codable
{
    case Development
    case CI
    case Staging
    case Production
}

public class EchoRegionDto : Codable
{
    public var code:String?
    public var displayName:String?
    public var apiUrl:String?
    public var hubUrl:String?

    required public init(){}
}

public class EchoAgentDto : Codable
{
    public var mcpUrl:String?
    public var oAuthMetadataUrl:String?
    public var installationType:String?
    public var onboardingDocsUrl:String?
    public var toolsUrl:String?
    public var cliPackage:String?
    public var cliInstallCommand:String?
    public var deviceAuthorizationUrl:String?
    public var deviceTokenUrl:String?
    public var snippets:[EchoAgentSnippetDto] = []

    required public init(){}
}

public class EchoHostingPlatformDto : Codable
{
    public var provider:String?
    public var isAws:Bool?

    required public init(){}
}

public class PublicBrandDto : Codable
{
    public var displayName:String?
    public var mainColor:String?
    public var accentColor:String?
    public var logoUrl:String?
    public var iconUrl:String?

    required public init(){}
}

public class PublicAuthDto : Codable
{
    public var socialProviders:[String] = []
    public var passkey:Bool?
    public var methods:[String]?
    public var passwordPolicy:PublicPasswordPolicyDto?

    required public init(){}
}

public class PublicAiChatDto : Codable
{
    public var enabled:Bool?
    public var assistants:[PublicAiAssistantDto] = []

    required public init(){}
}

public class CodeMashResponseStatus : Codable
{
    public var isSuccess:Bool?
    public var errors:[ErrorDto]?

    required public init(){}
}

// @DataContract
public class ResponseBase : Codable
{
    // @DataMember
    public var responseStatus:CodeMashResponseStatus?

    required public init(){}
}

public class EndUserChatAttachment : Codable
{
    public var id:String?
    public var sessionId:String?
    public var fileName:String?
    public var contentType:String?
    public var kind:String?
    public var size:Int?
    public var summary:String?
    public var createdAtUtc:Date?

    required public init(){}
}

public class EndUserChatMemoryNote : Codable
{
    public var id:String?
    public var sessionId:String?
    public var kind:String?
    public var text:String?
    public var createdAtUtc:Date?

    required public init(){}
}

public class EndUserChatAssistant : Codable
{
    public var id:String?
    public var name:String?
    public var welcomeMessage:String?
    public var isDefault:Bool?
    public var memoryEnabled:Bool?

    required public init(){}
}

public class EndUserChatPlan : Codable
{
    public var id:String?
    public var name:String?
    public var quotaUnit:String?
    public var monthlyQuota:Int?
    public var used:Int?
    public var remaining:Int?
    public var attachments:Bool?
    public var rag:Bool?
    public var memory:Bool?

    required public init(){}
}

public class EndUserChatSession : Codable
{
    public var id:String?
    public var assistantId:String?
    public var title:String?
    public var isPinned:Bool?
    public var isArchived:Bool?
    public var lastSeq:Int?
    public var createdAtUtc:Date?
    public var updatedAtUtc:Date?

    required public init(){}
}

public class AiChatEntryWireDto : Codable
{
    public var kind:String?
    public var id:String?
    public var seq:Int?
    public var atUtc:Date?
    public var refEntryId:String?
    public var workItemId:String?
    public var feedback:String?
    public var feedbackAtUtc:Date?
    public var feedbackByUserAuthId:String?

    required public init(){}
}

public class EndUserAiTool : Codable
{
    public var name:String?
    public var Description:String?
    public var toolsets:[String] = []
    public var requiresConfirmation:Bool?
    public var parameters:[EndUserAiToolParameter] = []

    required public init(){}
}

public class AuthDto : IBindableContract, Codable
{
    public var id:String?
    public var type:AuthType?
    public var email:String?
    public var userName:String?
    public var registration:RegistrationDto?
    public var login:LoginDto?
    public var generalInfo:UserGeneralInfoDto?
    public var roles:[String]?
    public var pushDevices:[String]?
    public var tags:[String]?
    public var status:AuthStatus?
    public var createdOn:Date?
    public var modifiedOn:Date?

    required public init(){}
}

public class PaginatedResponse<TViewModelProjection : Codable> : Codable
{
    public var items:IList<TViewModelProjection>?
    public var hasMore:Bool?
    public var hasPrevious:Bool?
    public var startingAfter:String?
    public var endingBefore:String?

    required public init(){}
}

public class UserMarketingPreferencesDto : Codable
{
    public var blockAllMarketingMessages:Bool?
    public var blockedTags:[String:HashSet<String>]?
    public var blockReasons:[MarketingBlockReason]?

    required public init(){}
}

public class PasskeyListItemDto : Codable
{
    public var credentialId:String?
    public var friendlyName:String?
    public var registeredOnUtc:Date?
    public var lastUsedOnUtc:Date?
    public var isRevoked:Bool?

    required public init(){}
}

public class TermTreeDto : Codable
{
    // @DataMember
    public var id:String?

    // @DataMember
    public var taxonomyId:String?

    // @DataMember
    public var taxonomyName:String?

    // @DataMember
    public var parentId:String?

    // @DataMember
    public var order:Int?

    // @DataMember
    public var name:String?

    // @DataMember
    public var names:[String:String]?

    // @DataMember
    public var slug:String?

    // @DataMember
    public var Description:String?

    // @DataMember
    public var descriptions:[String:String]?

    // @DataMember
    public var multiParents:[TermMultiParentDto]?

    // @DataMember
    public var meta:String?

    // @DataMember
    public var children:[TermTreeDto]?

    required public init(){}
}

public class TaxonomyTreeDto : Codable
{
    // @DataMember
    public var viewId:String?

    // @DataMember
    public var taxonomyName:String?

    // @DataMember
    public var taxonomySlug:String?

    // @DataMember
    public var parentId:String?

    // @DataMember
    public var children:[TaxonomyTreeDto]?

    // @DataMember
    public var terms:[TermTreeDto]?

    required public init(){}
}

public class TermDto : Codable
{
    // @DataMember
    public var id:String?

    // @DataMember
    public var taxonomyId:String?

    // @DataMember
    public var taxonomyName:String?

    // @DataMember
    public var parentId:String?

    // @DataMember
    public var order:Int?

    // @DataMember
    public var name:String?

    // @DataMember
    public var names:[String:String]?

    // @DataMember
    public var slug:String?

    // @DataMember
    public var Description:String?

    // @DataMember
    public var descriptions:[String:String]?

    // @DataMember
    public var multiParents:[TermMultiParentDto]?

    // @DataMember
    public var meta:String?

    // @DataMember
    public var origin:String?

    required public init(){}
}

public class SchemaDto : IHasViewId, Codable
{
    // @DataMember
    public var viewId:String?

    // @DataMember
    public var schemaName:String?

    // @DataMember
    public var schemaSlug:String?

    // @DataMember
    public var version:Int?

    // @DataMember
    public var metaSchemaVersion:Int?

    // @DataMember
    public var dataSchema:DataSchemaDto?

    // @DataMember
    public var visualSchema:VisualSchemaDto?

    // @DataMember
    public var publishedAt:Date?

    // @DataMember
    public var settings:SchemaSettingsDto?

    // @DataMember
    public var embed:SchemaEmbedSettingsDto?

    // @DataMember
    public var triggers:[TriggerDto]?

    required public init(){}
}

public class SchemaListProjection : IHasViewId, Codable
{
    // @DataMember
    public var viewId:String?

    // @DataMember
    public var schemaName:String?

    // @DataMember
    public var schemaTitle:String?

    // @DataMember
    public var latestVersion:Int?

    // @DataMember
    public var hasDraft:Bool?

    // @DataMember
    public var metaSchemaVersion:Int?

    // @DataMember
    public var Description:String?

    // @DataMember
    public var env:String?

    required public init(){}
}

// @DataContract
public class FileResourceRefDto : Codable
{
    // @DataMember(Order=1)
    public var resource:FileResourceDto?

    // @DataMember(Order=2)
    public var integrationId:String?

    // @DataMember(Order=3)
    public var provider:FileProvider?

    // @DataMember(Order=4)
    public var path:String?

    // @DataMember(Order=5)
    public var publicUrl:String?

    // @DataMember(Order=6)
    public var isPublic:Bool?

    required public init(){}
}

// @DataContract
public class PublicFolderDto : Codable
{
    // @DataMember(Order=1)
    public var path:String?

    // @DataMember(Order=2)
    public var publicId:String?

    // @DataMember(Order=3)
    public var publicUrl:String?

    // @DataMember(Order=4)
    public var inherited:Bool?

    required public init(){}
}

public class RegisterFileResult : Codable
{
    public var index:Int?
    public var path:String?
    public var ownerUserId:String?
    public var status:String?
    public var fileId:String?
    public var verified:Bool?
    public var warning:String?
    public var errorCode:String?
    public var errorStatus:Int?
    public var error:String?

    required public init(){}
}

// @DataContract
public class IntegrationTestResultItemDto : Codable
{
    // @DataMember
    public var operation:String?

    // @DataMember
    public var result:String?

    // @DataMember
    public var errors:IReadOnlyList<String>?

    required public init(){}
}

// @DataContract
public class OwnPushDeviceDto : Codable
{
    // @DataMember
    public var id:String?

    // @DataMember
    public var provider:String?

    // @DataMember
    public var token:String?

    // @DataMember
    public var platform:String?

    // @DataMember
    public var osName:String?

    // @DataMember
    public var osVersion:String?

    // @DataMember
    public var appVersion:String?

    // @DataMember
    public var deviceName:String?

    // @DataMember
    public var modelName:String?

    // @DataMember
    public var brand:String?

    // @DataMember
    public var installationId:String?

    // @DataMember
    public var locale:String?

    // @DataMember
    public var timeZone:String?

    // @DataMember
    public var updatedAtUtc:Date?

    required public init(){}
}

// @DataContract
public class OwnPushMessageDto : Codable
{
    // @DataMember
    public var id:String?

    // @DataMember
    public var campaignId:String?

    // @DataMember
    public var title:String?

    // @DataMember
    public var body:String?

    // @DataMember
    public var sentAtUtc:Date?

    // @DataMember
    public var isRead:Bool?

    // @DataMember
    public var readAtUtc:Date?

    required public init(){}
}

// @DataContract
public class PaymentOrderDto : Codable
{
    // @DataMember
    public var id:String?

    // @DataMember
    public var env:String?

    // @DataMember
    public var buyerUserId:String?

    // @DataMember
    public var merchantReference:String?

    // @DataMember
    public var currency:String?

    // @DataMember
    public var priceVersion:String?

    // @DataMember
    public var lines:[PaymentOrderLineDto] = []

    // @DataMember
    public var totalMinor:Int?

    // @DataMember
    public var metadata:[String:String] = [:]

    // @DataMember
    public var status:String?

    // @DataMember
    public var createdOnUtc:Date?

    // @DataMember
    public var updatedOnUtc:Date?

    // @DataMember
    public var checkouts:[PaymentOrderCheckoutDto] = []

    // @DataMember
    public var settledMinor:Int?

    // @DataMember
    public var refundedMinor:Int?

    // @DataMember
    public var paidOnUtc:Date?

    // @DataMember
    public var providerPaymentId:String?

    // @DataMember
    public var mismatches:[String] = []

    required public init(){}
}

// @DataContract
public class PaymentOrderCheckoutDto : Codable
{
    // @DataMember
    public var attempt:Int?

    // @DataMember
    public var integrationId:String?

    // @DataMember
    public var provider:String?

    // @DataMember
    public var providerOrderId:String?

    // @DataMember
    public var providerReference:String?

    // @DataMember
    public var paymentUrl:String?

    // @DataMember
    public var method:String?

    // @DataMember
    public var startedOnUtc:Date?

    // @DataMember
    public var expiresAtUtc:Date?

    required public init(){}
}

public class InAppNotificationDto : Codable
{
    public var id:String?
    public var projectId:String?
    public var userId:String?
    public var channel:String?
    public var eventName:String?
    public var payloadJson:String?
    public var isRead:Bool?
    public var seenAtUtc:Date?
    public var readAtUtc:Date?
    public var createdAtUtc:Date?

    required public init(){}
}

public class JsonSchemaFieldDto : Codable
{
    // @DataMember
    public var fieldName:String?

    required public init(){}
}

public class CurrencyDefaultDto : Codable
{
    // @DataMember
    public var value:Double?

    // @DataMember
    public var currency:String?

    required public init(){}
}

public enum Gender : String, Codable
{
    case Male
    case Female
    case Other
}

public enum MarketingBlockReason : String, Codable
{
    case Unspecified
    case Unsubscribed
    case Complaint
    case HardBounce
    case InvalidEmail
    case AdminBlock
}

public class CursorArgs : ICursorArgs, Codable
{
    public var field:String?
    public var order:Int?

    required public init(){}
}

public class EchoAgentSnippetDto : Codable
{
    public var client:String?
    public var kind:String?
    public var recommended:Bool?
    public var auth:String?
    public var config:String?

    required public init(){}
}

public class PublicPasswordPolicyDto : Codable
{
    public var minLength:Int?
    public var maxLength:Int?
    public var minNumbers:Int?
    public var minUpper:Int?
    public var minLower:Int?
    public var minSpecial:Int?
    public var allowedSpecial:String?

    required public init(){}
}

public class PublicAiAssistantDto : Codable
{
    public var id:String?
    public var name:String?
    public var welcome:String?

    required public init(){}
}

public class ErrorDto : Codable
{
    public var message:String?
    public var errorCode:String?
    public var context:[String:String]?
    public var stackTrace:[ErrorDto]?

    required public init(){}
}

public class EndUserAiToolParameter : Codable
{
    public var name:String?
    public var type:String?
    public var required:Bool?
    public var Description:String?

    required public init(){}
}

public enum AuthType : String, Codable
{
    case Service
    case Email
    case UserName
    case Phone
    case Guest
    case Social
}

public class RegistrationDto : Codable
{
    public var registrationInformation:AccessInformationDto?

    required public init(){}
}

public class LoginDto : Codable
{
    public var needChangePasswordOnNextLogin:Bool?
    public var lastAccessInformation:AccessInformationDto?

    required public init(){}
}

public enum AuthStatus : Int, Codable
{
    case Registered = 0
    case PendingValidation = 2
    case Invited = 4
    case Active = 8
    case Unregistered = 16
    case Suspended = 32
    case InActive = 64
    case Blocked = 128
}

public protocol IBindableContract
{
}

public class TermMultiParentDto : Codable
{
    // @DataMember
    public var taxonomyId:String?

    // @DataMember
    public var parentId:String?

    // @DataMember
    public var name:String?

    // @DataMember
    public var names:[String:String]?

    required public init(){}
}

public class DataSchemaDto : Codable
{
    // @DataMember
    public var json:String?

    // @DataMember
    public var fields:[JsonSchemaFieldDto] = []

    required public init(){}
}

public class VisualSchemaDto : Codable
{
    // @DataMember
    public var json:String?

    required public init(){}
}

public class SchemaSettingsDto : Codable
{
    // @DataMember
    public var softDelete:Bool?

    // @DataMember
    public var hasRecordOwner:Bool?

    // @DataMember
    public var Description:String?

    // @DataMember
    public var uniqueIndexes:[SchemaUniqueIndexDto]?

    // @DataMember
    public var endUserOwnRecords:Bool?

    required public init(){}
}

public class SchemaEmbedSettingsDto : Codable
{
    // @DataMember
    public var enabled:Bool?

    // @DataMember
    public var fields:[String] = []

    // @DataMember
    public var embeddingIntegrationId:String?

    // @DataMember
    public var perUser:Bool?

    required public init(){}
}

// @DataContract
public class TriggerDto : IHasViewId, IQueuedTrigger, Codable
{
    // @DataMember
    public var type:TriggerType?

    // @DataMember
    public var viewId:String?

    // @DataMember
    public var name:String?

    // @DataMember
    public var thenAction:TriggerActionDto?

    // @DataMember
    public var Description:String?

    // @DataMember
    public var isEnabled:Bool?

    // @DataMember
    public var activationCode:String?

    // @DataMember
    public var order:Int?

    // @DataMember
    public var breakOnError:Bool?

    // @DataMember
    public var savedByAuthId:String?

    required public init(){}
}

public protocol IHasViewId
{
    var viewId:String? { get set }

}

// @DataContract
public class FileResourceDto : Codable
{
    // @DataMember(Order=1)
    public var id:String?

    // @DataMember(Order=2)
    public var originalFileName:String?

    // @DataMember(Order=3)
    public var `extension`:String?

    // @DataMember(Order=4)
    public var storedFileName:String?

    // @DataMember(Order=5)
    public var sizeBytes:Int?

    // @DataMember(Order=6)
    public var checksum:FileChecksumDto?

    required public init(){}
}

public enum FileProvider : String, Codable
{
    case Local
    case AwsS3
    case AzureBlobStorage
    case GoogleCloudStorage
    case Ftp
    case AppleICloud
    case DropBox
    case GoogleDrive
}

// @DataContract
public class PaymentOrderLineDto : Codable
{
    // @DataMember
    public var sku:String?

    // @DataMember
    public var title:String?

    // @DataMember
    public var quantity:Int?

    // @DataMember
    public var unitAmountMinor:Int?

    // @DataMember
    public var amountMinor:Int?

    required public init(){}
}

public protocol ICursorArgs
{
    var field:String? { get set }
    var order:Int? { get set }

}

public class AccessInformationDto : Codable
{
    public var ip:String?
    public var date:Date?
    public var timeZone:String?

    required public init(){}
}

public class SchemaUniqueIndexDto : Codable
{
    // @DataMember
    public var fields:[String] = []

    required public init(){}
}

public enum TriggerType : String, Codable
{
    case Membership
    case Schema
    case Files
    case Payments
    case Ai
}

// @DataContract
public class TriggerActionDto : Codable
{
    // @DataMember
    public var type:TriggerActionType?

    // @DataMember
    public var integrationId:String?

    required public init(){}
}

public protocol IQueuedTrigger
{
    var viewId:String? { get set }
    var name:String? { get set }
    var order:Int? { get set }
    var breakOnError:Bool? { get set }

}

// @DataContract
public class FileChecksumDto : Codable
{
    // @DataMember(Order=1)
    public var algorithm:String?

    // @DataMember(Order=2)
    public var hash:String?

    required public init(){}
}

public enum TriggerActionType : String, Codable
{
    case Code
    case Push
    case Sms
    case Email
    case WebhookCall
    case SseCall
    case Marketplace
}


