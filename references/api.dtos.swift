/* Options:
Date: 2026-04-27 20:26:37
SwiftVersion: 6.0
Version: 10.06
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

public class AccountCreated : Codable
{
    public var email:EmailAddress?
    public var displayName:DisplayName?
    public var accountId:AccountId?
    public var createdOn:UtcDateTime?

    required public init(){}
}

public class AccountVerified : Codable
{
    required public init(){}
}

public class AccountSetAsActive : Codable
{
    required public init(){}
}

public class AccountValidationTokenIssued : Codable
{
    public var expiration:ExpirationToken?

    required public init(){}
}

public class AccountBlocked : Codable
{
    required public init(){}
}

public class AccountProfileUpdated : Codable
{
    public var displayName:DisplayName?
    public var billingEmail:EmailAddress?
    public var operationsEmail:EmailAddress?
    public var securityEmail:EmailAddress?

    required public init(){}
}

public class AccountSetAsInactive : Codable
{
    required public init(){}
}

public class AccountUnregistered : Codable
{
    required public init(){}
}

public class LicenseCreated : Codable
{
    public var license:CodeMashLicense?

    required public init(){}
}

public class CustomerCreated : Codable
{
    public var customerId:ExternalCustomerId?

    required public init(){}
}

public class SubscriptionChanged : Codable
{
    public var subscription:CodeMashManagedServiceSubscription?

    required public init(){}
}

public class SubscriptionCanceled : Codable
{
    public var customerId:ExternalCustomerId?
    public var subscriptionId:String?

    required public init(){}
}

public class ProjectCommunicationGroupSaved : Codable
{
    public var group:GroupDefinition?
    public var channel:CommunicationChannel?
    public var originChannel:CommunicationChannel?

    required public init(){}
}

public class ProjectCommunicationTagFromGroupDeleted : Codable
{
    public var groupTag:Tag?
    public var removedTag:Tag?

    required public init(){}
}

public class ProjectCommunicationGroupDeleted : Codable
{
    public var groupTag:Tag?

    required public init(){}
}

public class ProjectCommunicationTagSaved : Codable
{
    public var tag:TagDefinition?
    public var groupTag:Tag?
    public var channel:CommunicationChannel?

    required public init(){}
}

public class ProjectCommunicationTagDeleted : Codable
{
    public var tag:Tag?

    required public init(){}
}

public class ProjectCreated : Codable
{
    public var id:ProjectId?
    public var name:ProjectName?
    public var databaseIntegrationId:IntegrationId?
    public var regions:[ProjectRegion]?
    public var Description:String?

    required public init(){}
}

public class ProjectDeleted : Codable
{
    required public init(){}
}

public class ProjectActivated : Codable
{
    required public init(){}
}

public class ProjectEnabled : Codable
{
    required public init(){}
}

public class ProjectDisabled : Codable
{
    required public init(){}
}

public class ProjectNameChanged : Codable
{
    public var projectName:ProjectName?

    required public init(){}
}

public class ProjectDescriptionChanged : Codable
{
    public var Description:String?

    required public init(){}
}

public class ProjectMarketingUrlChanged : Codable
{
    public var url:DomainUrl?

    required public init(){}
}

public class ProjectAllowedOriginsChanged : Codable
{
    public var origins:[DomainUrl]?

    required public init(){}
}

public class ProjectDefaultLanguageChanged : Codable
{
    public var language:Language?

    required public init(){}
}

public class ProjectLanguagesChanged : Codable
{
    public var languages:[Language] = []

    required public init(){}
}

public class ProjectLogoChanged : Codable
{
    public var logo:ProjectLogo?

    required public init(){}
}

public class ProjectIconChanged : Codable
{
    public var icon:ProjectIcon?

    required public init(){}
}

public class ProjectMainColorChanged : Codable
{
    public var color:BrandColor?

    required public init(){}
}

public class ProjectAccentColorChanged : Codable
{
    public var color:BrandColor?

    required public init(){}
}

public class ProjectRegionsChanged : Codable
{
    public var regions:[ProjectRegion]?

    required public init(){}
}

public class ProjectTimeZoneChanged : Codable
{
    public var timeZone:TimeZone?

    required public init(){}
}

public class ProjectPaymentZonesChanged : Codable
{
    public var paymentZones:[TimeZone]?

    required public init(){}
}

public class ProjectCommunicationSet : Codable
{
    public var projectCommunication:ProjectCommunication?

    required public init(){}
}

public class AccountUserPushDeviceCreated : Codable
{
    public var userId:UserId?
    public var pushDevice:PushDevice?

    required public init(){}
}

/**
* AI
*/
// @Route("/{version}/chat/complete", "POST")
// @Api(Description="AI")
// @DataContract
public class AskChatRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = AskChatResponse

    // @DataMember
    public var prompt:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case prompt
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        prompt = try container.decodeIfPresent(String.self, forKey: .prompt)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if prompt != nil { try container.encode(prompt, forKey: .prompt) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/users/block", "PATCH")
// @Api(Description="Membership")
// @DataContract
public class BlockUserRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var id:String?

    // @DataMember
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
// @Route("/{version}/membership/users/register/service", "POST")
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
// @Route("/{version}/membership/users/register/guest", "POST")
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
// @Route("/{version}/membership/users/register/user-name", "POST")
// @Api(Description="Membership")
// @DataContract
public class SaveUserNameUser : SaveUser, IReturn
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
// @Route("/{version}/membership/users/register/email", "POST")
// @Api(Description="Membership")
// @DataContract
public class SaveEmailUser : SaveUser, IReturn
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
// @Route("/{version}/membership/users/register/phone", "POST")
// @Api(Description="Membership")
// @DataContract
public class SavePhoneUser : SaveUser, IReturn
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
// @Route("/{version}/membership/users/register/phone-with-permissions", "POST")
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
// @Route("/{version}/membership/users/register/email-with-permissions", "POST")
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
// @Route("/{version}/membership/users/register/user-name-with-permissions", "POST")
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
// @Route("/{version}/membership/users", "DELETE")
// @Api(Description="Membership")
// @DataContract
public class DeleteUserRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var id:String?

    // @DataMember
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
// @Route("/{version}/membership/users/{id}", "GET")
// @Api(Description="Membership")
// @DataContract
public class GetUserRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = GetUserResponse

    // @DataMember
    public var id:String?

    // @DataMember
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
// @Route("/{version}/membership/users", "GET")
// @Api(Description="Membership")
// @DataContract
public class GetUsersRequest : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetUsersResponse

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var includePermissions:Bool?

    // @DataMember
    public var userShouldHavePushDevice:Bool?

    // @DataMember
    public var userShouldHaveEmail:Bool?

    // @DataMember
    public var includeMeta:Bool?

    // @DataMember
    public var roleNames:[String]?

    // @DataMember
    public var userIds:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case databaseIntegrationId
        case includePermissions
        case userShouldHavePushDevice
        case userShouldHaveEmail
        case includeMeta
        case roleNames
        case userIds
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
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/users/{id}/preferences", "GET")
// @Api(Description="Membership")
// @DataContract
public class GetUserPreferencesRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = GetUserPreferencesResponse

    // @DataMember
    public var id:String?

    // @DataMember
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
// @Route("/{version}/membership/users/invite", "POST")
// @Api(Description="Membership")
// @DataContract
public class InviteUserRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var email:String?

    // @DataMember
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case email
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if email != nil { try container.encode(email, forKey: .email) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

/**
* Membership
*/
// @Route("/{version}/membership/users/assign-roles", "PUT")
// @Api(Description="Membership")
// @DataContract
public class AssignRolePermissionsRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var id:String?

    /**
    * Database integration id
    */
    // @DataMember
    // @ApiMember(Description="Database integration id", IsRequired=true)
    public var databaseIntegrationId:String?

    // @DataMember
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
// @Route("/{version}/membership/users/unblock", "PATCH")
// @Api(Description="Membership")
// @DataContract
public class UnblockUserRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var id:String?

    // @DataMember
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
// @Route("/{version}/membership/users", "PUT")
// @Api(Description="Membership")
// @DataContract
public class UpdateUserRequest : SaveUser, IReturn
{
    public typealias Return = IdResponse

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
* Membership
*/
// @Route("/{version}/membership/users/{id}/preferences", "PUT")
// @Api(Description="Membership")
// @DataContract
public class UpdateUserPreferencesRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var id:String?

    // @DataMember
    public var blockAllMarketingMessages:Bool?

    // @DataMember
    public var blockedTags:[String:IReadOnlySet<String>]?

    // @DataMember
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
        blockedTags = try container.decodeIfPresent([String:IReadOnlySet<String>].self, forKey: .blockedTags) ?? [:]
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
* Database
*/
// @Route("/{version}/database/taxonomies/{taxonomyName}/terms", "GET")
// @Api(Description="Database")
// @DataContract
public class FindTermsRequest : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = FindTermsResponse

    // @DataMember
    public var taxonomyName:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var filter:String?

    // @DataMember
    public var pagingArgs:PagingArgs?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case taxonomyName
        case databaseIntegrationId
        case filter
        case pagingArgs
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        taxonomyName = try container.decodeIfPresent(String.self, forKey: .taxonomyName)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        filter = try container.decodeIfPresent(String.self, forKey: .filter)
        pagingArgs = try container.decodeIfPresent(PagingArgs.self, forKey: .pagingArgs)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if taxonomyName != nil { try container.encode(taxonomyName, forKey: .taxonomyName) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if filter != nil { try container.encode(filter, forKey: .filter) }
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

    // @DataMember
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
        case taxonomyName
        case parentId
        case databaseIntegrationId
        case filter
        case pagingArgs
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        taxonomyName = try container.decodeIfPresent(String.self, forKey: .taxonomyName)
        parentId = try container.decodeIfPresent(String.self, forKey: .parentId)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        filter = try container.decodeIfPresent(String.self, forKey: .filter)
        pagingArgs = try container.decodeIfPresent(PagingArgs.self, forKey: .pagingArgs)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
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

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case databaseIntegrationId
        case filter
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        filter = try container.decodeIfPresent(String.self, forKey: .filter)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if filter != nil { try container.encode(filter, forKey: .filter) }
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

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case databaseIntegrationId
        case filter
        case schemaVersion
        case pagingArgs
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        filter = try container.decodeIfPresent(String.self, forKey: .filter)
        schemaVersion = try container.decodeIfPresent(Int.self, forKey: .schemaVersion)
        pagingArgs = try container.decodeIfPresent(PagingArgs.self, forKey: .pagingArgs)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if filter != nil { try container.encode(filter, forKey: .filter) }
        if schemaVersion != nil { try container.encode(schemaVersion, forKey: .schemaVersion) }
        if pagingArgs != nil { try container.encode(pagingArgs, forKey: .pagingArgs) }
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
    public var update:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case databaseIntegrationId
        case filter
        case update
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        filter = try container.decodeIfPresent(String.self, forKey: .filter)
        update = try container.decodeIfPresent(String.self, forKey: .update)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if filter != nil { try container.encode(filter, forKey: .filter) }
        if update != nil { try container.encode(update, forKey: .update) }
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

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case id
        case databaseIntegrationId
        case update
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        update = try container.decodeIfPresent(String.self, forKey: .update)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if id != nil { try container.encode(id, forKey: .id) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if update != nil { try container.encode(update, forKey: .update) }
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

// @Route("/apikeys")
// @Route("/apikeys/{Environment}")
// @DataContract
public class GetApiKeys : IReturn, IGet, Codable
{
    public typealias Return = GetApiKeysResponse

    // @DataMember(Order=1)
    public var environment:String?

    // @DataMember(Order=2)
    public var meta:[String:String]?

    required public init(){}
}

// @Route("/apikeys/regenerate")
// @Route("/apikeys/regenerate/{Environment}")
// @DataContract
public class RegenerateApiKeys : IReturn, IPost, Codable
{
    public typealias Return = RegenerateApiKeysResponse

    // @DataMember(Order=1)
    public var environment:String?

    // @DataMember(Order=2)
    public var meta:[String:String]?

    required public init(){}
}

public class EchoResponse : Codable
{
    public var containerName:String?
    public var ip:String?
    public var release:CodeMashRelease?
    public var runtime:CodeMashRuntime?
    public var managedServiceHubUrl:String?
    public var managedServiceApiUrl:String?
    public var hubUrl:String?
    public var apiUrl:String?
    public var apiVersion:String?
    public var hubVersion:String?
    public var mjmlUrl:String?
    public var license:CodeMashLicenseFromEndpointDto?
    public var askForEnterpriseLicenseEmail:String?

    required public init(){}
}

public class AskChatResponse : ResponseBase
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

// @DataContract
public class IdResponse : ResponseBase
{
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

public class GetUserResponse : ResponseBase
{
    public var user:UserDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case user
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        user = try container.decodeIfPresent(UserDto.self, forKey: .user)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if user != nil { try container.encode(user, forKey: .user) }
    }
}

public class GetUsersResponse : ResponseBase
{
    public var list:PaginatedResponse<UserDto>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<UserDto>.self, forKey: .list)
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

// @DataContract
public class GetApiKeysResponse : Codable
{
    // @DataMember(Order=1)
    public var results:[UserApiKey]?

    // @DataMember(Order=2)
    public var meta:[String:String]?

    // @DataMember(Order=3)
    public var responseStatus:ResponseStatus?

    required public init(){}
}

// @DataContract
public class RegenerateApiKeysResponse : Codable
{
    // @DataMember(Order=1)
    public var results:[UserApiKey]?

    // @DataMember(Order=2)
    public var meta:[String:String]?

    // @DataMember(Order=3)
    public var responseStatus:ResponseStatus?

    required public init(){}
}

// @DataContract(Namespace="http://codemash.io/types/")
public class RequestBase : ICultureBasedRequest, IVersionBasedRequest, IHasCorrelationIdRequest, Codable
{
    /**
    * Specify culture code when your response from the API should be localised. E.g.: en
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="Specify culture code when your response from the API should be localised. E.g.: en", Name="CultureCode", ParameterType="header")
    public var cultureCode:String?

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

public protocol ICultureBasedRequest
{
    var cultureCode:String? { get set }

}

public protocol IVersionBasedRequest
{
    var version:String? { get set }

}

public protocol IHasCorrelationIdRequest
{
    var correlationId:String? { get set }

}

public class EmailAddress : Codable
{
    public var address:String?

    required public init(){}
}

public class DisplayName : Codable
{
    public var value:String?

    required public init(){}
}

public class AccountId : AggregateId, IHasDomainEntityId
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class UtcDateTime : Codable
{
    required public init(){}
}

public class ExpirationToken : Codable
{
    public var items:Int?
    public var unit:TimeUnit?
    public var value:Int?

    required public init(){}
}

public class CodeMashLicense : CodeMashManagedServiceSubscription
{
    public var domain:DomainUrl?
    public var accountId:AccountId?
    public var isEnterprise:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case domain
        case accountId
        case isEnterprise
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        domain = try container.decodeIfPresent(DomainUrl.self, forKey: .domain)
        accountId = try container.decodeIfPresent(AccountId.self, forKey: .accountId)
        isEnterprise = try container.decodeIfPresent(Bool.self, forKey: .isEnterprise)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if domain != nil { try container.encode(domain, forKey: .domain) }
        if accountId != nil { try container.encode(accountId, forKey: .accountId) }
        if isEnterprise != nil { try container.encode(isEnterprise, forKey: .isEnterprise) }
    }
}

public class ExternalCustomerId : Codable
{
    public var id:String?

    required public init(){}
}

public class CodeMashManagedServiceSubscription : Codable
{
    public var subscriptionId:CodeMashSubscriptionId?
    public var refCustomerId:ExternalCustomerId?
    public var refSubscriptionId:String?
    public var issuedOn:UtcDateTime?
    public var willExpireOn:UtcDateTime?
    public var projectCap:Quantity?
    public var isTrial:Bool?

    required public init(){}
}

public class GroupDefinition : BaseTagDefinition
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public enum CommunicationChannel : String, Codable
{
    case Transactional
    case Marketing
    case System
}

public class Tag : Codable
{
    required public init(){}
}

public class TagDefinition : BaseTagDefinition
{
    public var defaultDelivery:[DeliveryChannel:Bool] = [:]

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case defaultDelivery
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        defaultDelivery = try container.decodeIfPresent([DeliveryChannel:Bool].self, forKey: .defaultDelivery) ?? [:]
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if defaultDelivery.count > 0 { try container.encode(defaultDelivery, forKey: .defaultDelivery) }
    }
}

public class ProjectId : AggregateId, IHasDomainEntityId
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
public class ProjectName : Codable
{
    // @DataMember
    public var name:String?

    // @DataMember
    public var uniqueName:String?

    required public init(){}
}

public class IntegrationId : AggregateId, IHasDomainEntityId
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
public class ProjectRegion : Codable
{
    // @DataMember
    public var id:ProjectRegionId?

    // @DataMember
    public var name:String?

    // @DataMember
    public var continent:Continent?

    required public init(){}
}

public class DomainUrl : Codable
{
    public var value:Uri?

    required public init(){}
}

public class Language : Codable
{
    public var code:String?
    public var name:String?

    required public init(){}
}

public class ProjectLogo : Codable
{
    public var fileResource:FileResource?
    public var publicUrl:String?

    required public init(){}
}

public class ProjectIcon : Codable
{
    public var fileResource:FileResource?
    public var publicUrl:String?

    required public init(){}
}

// @DataContract
public class BrandColor : Codable
{
    // @DataMember
    public var value:String?

    required public init(){}
}

// @DataContract
public class TimeZone : Codable
{
    // @DataMember
    public var zoneId:String?

    required public init(){}
}

// @DataContract
public class ProjectCommunication : Codable
{
    // @DataMember
    public var channels:[ProjectCommunicationChannel] = []

    // @DataMember
    public var groups:[GroupDefinition] = []

    // @DataMember
    public var tags:[TagDefinition] = []

    required public init(){}
}

public class UserId : IHasDomainEntityId, Codable
{
    public var value:String?

    required public init(){}
}

// @DataContract
public class PushDevice : Codable
{
    // @DataMember
    public var id:DeviceId?

    // @DataMember
    public var brand:String?

    // @DataMember
    public var manufacturer:String?

    // @DataMember
    public var modelName:String?

    // @DataMember
    public var deviceName:String?

    // @DataMember
    public var deviceType:DeviceType?

    // @DataMember
    public var osName:String?

    // @DataMember
    public var osVersion:String?

    // @DataMember
    public var platformApiLevel:Int?

    // @DataMember
    public var token:PushDeviceDeliveryToken?

    required public init(){}
}

public class CodeMashRequestBase : RequestBase, IHasProjectId
{
    /**
    * ID of your project. Can be passed in a header as norbix-project-id.
    */
    // @ApiMember(DataType="string", Description="ID of your project. Can be passed in a header as norbix-project-id.", IsRequired=true, Name="norbix-project-id", ParameterType="header")
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

public protocol IHasProjectId
{
    var projectId:String? { get set }

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
    public var blockedTags:[String:IReadOnlySet<String>]?
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
    * Database integration id
    */
    // @DataMember
    // @ApiMember(Description="Database integration id", IsRequired=true)
    public var databaseIntegrationId:String?

    /**
    * User Info
    */
    // @DataMember
    // @ApiMember(DataType="object", Description="User Info", Name="UserGeneralInfo", ParameterType="body")
    public var userGeneralInfo:UserGeneralInfoDto?

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
        case ignoreUserRegistersAsRole
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        userGeneralInfo = try container.decodeIfPresent(UserGeneralInfoDto.self, forKey: .userGeneralInfo)
        ignoreUserRegistersAsRole = try container.decodeIfPresent(Bool.self, forKey: .ignoreUserRegistersAsRole)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if userGeneralInfo != nil { try container.encode(userGeneralInfo, forKey: .userGeneralInfo) }
        if ignoreUserRegistersAsRole != nil { try container.encode(ignoreUserRegistersAsRole, forKey: .ignoreUserRegistersAsRole) }
    }
}

public class PagingArgs : Codable
{
    public var cursorArgs:CursorArgs?
    public var pageSize:Int?
    public var startingAfter:String?
    public var endingBefore:String?

    required public init(){}
}

public class CodeMashListPaginationRequestBase : RequestBase, IHasProjectId
{
    /**
    * ID of your project. Can be passed in a header as norbix-project-id.
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="ID of your project. Can be passed in a header as norbix-project-id.", IsRequired=true, Name="norbix-project-id", ParameterType="header")
    public var projectId:String?

    /**
    * Paging
    */
    // @DataMember
    // @ApiMember(DataType="object", Description="Paging", IsRequired=true, Name="paging", ParameterType="body")
    public var paging:PagingArgs?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case projectId
        case paging
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        projectId = try container.decodeIfPresent(String.self, forKey: .projectId)
        paging = try container.decodeIfPresent(PagingArgs.self, forKey: .paging)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if projectId != nil { try container.encode(projectId, forKey: .projectId) }
        if paging != nil { try container.encode(paging, forKey: .paging) }
    }
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
    case Production
}

// @DataContract
public class CodeMashLicenseFromEndpointDto : Codable
{
    // @DataMember(Name="domain")
    public var domain:String?

    // @DataMember(Name="accountId")
    public var accountId:String?

    // @DataMember(Name="refCustomerId")
    public var refCustomerId:String?

    // @DataMember(Name="refSubscriptionId")
    public var refSubscriptionId:String?

    // @DataMember(Name="issued")
    public var issued:Int?

    // @DataMember(Name="expire")
    public var expire:Int?

    // @DataMember(Name="cap")
    public var cap:Int?

    // @DataMember(Name="isTrial")
    public var isTrial:Bool?

    // @DataMember(Name="release")
    public var release:String?

    required public init(){}
}

public class CodeMashResponseStatus : Codable
{
    public var isSuccess:Bool?
    public var errors:[ErrorDto]?

    required public init(){}
}

public class ResponseBase : Codable
{
    public var responseStatus:CodeMashResponseStatus?

    required public init(){}
}

public class UserDto : IBindableContract, Codable
{
    public var id:String?
    public var type:UserType?
    public var email:String?
    public var userName:String?
    public var registration:RegistrationDto?
    public var login:LoginDto?
    public var generalInfo:UserGeneralInfoDto?
    public var roles:IReadOnlySet<String>?
    public var pushDevices:IReadOnlySet<String>?
    public var tags:IReadOnlySet<String>?
    public var status:UserStatus?
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
    public var blockedTags:[String:IReadOnlySet<String>]?

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
    public var Description:String?

    // @DataMember
    public var descriptions:[String:String]?

    // @DataMember
    public var multiParents:[TermMultiParentDto]?

    // @DataMember
    public var meta:String?

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

    required public init(){}
}

// @DataContract
public class UserApiKey : Codable
{
    // @DataMember(Order=1)
    public var key:String?

    // @DataMember(Order=2)
    public var keyType:String?

    // @DataMember(Order=3)
    public var expiryDate:Date?

    // @DataMember(Order=4)
    public var meta:[String:String]?

    required public init(){}
}

public class AggregateId : Codable
{
    public var value:String?

    required public init(){}
}

public protocol IHasDomainEntityId
{
    var viewId:String? { get set }

}

public enum TimeUnit : String, Codable
{
    case Ticks
    case Milliseconds
    case Seconds
    case Minutes
    case Hours
}

public class CodeMashSubscriptionId : AggregateId
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class Quantity : Codable
{
    public var value:Int?

    required public init(){}
}

public class TagTranslation : MessageTranslation<TagDescription>
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class BaseTagDefinition : Codable
{
    public var tag:Tag?
    public var translations:[TagTranslation] = []

    required public init(){}
}

public enum DeliveryChannel : String, Codable
{
    case Email
    case Push
    case Sms
    case WebPush
    case InApp
    case ChatBot
    case ChatPlatform
}

public class ProjectRegionId : Codable
{
    public var value:String?

    required public init(){}
}

public enum Continent : String, Codable
{
    case Africa
    case Antarctica
    case Asia
    case Europe
    case NorthAmerica
    case Oceania
    case SouthAmerica
}

// @DataContract
public class FileResource : Codable
{
    // @DataMember
    public var id:FileResourceId?

    // @DataMember
    public var originalFileName:String?

    // @DataMember
    public var `extension`:String?

    // @DataMember
    public var sizeBytes:Int?

    // @DataMember
    public var checksum:FileChecksum?

    // @DataMember
    public var storedFileName:String?

    required public init(){}
}

// @DataContract
public class ProjectCommunicationChannel : Codable
{
    // @DataMember
    public var channel:CommunicationChannel?

    // @DataMember
    public var groups:[GroupTags] = []

    required public init(){}
}

public class DeviceId : Codable
{
    public var id:String?

    required public init(){}
}

public enum DeviceType : String, Codable
{
    case Unknown
    case Phone
    case Tablet
    case Desktop
    case Tv
}

// @DataContract
public class PushDeviceDeliveryToken : Codable
{
    // @DataMember
    public var pushDeviceToken:PushDeviceToken?

    // @DataMember
    public var deliveryFamily:PushDeviceDeliveryFamily?

    required public init(){}
}

public enum Gender : String, Codable
{
    case Male
    case Female
    case Other
}

public class CursorArgs : ICursorArgs, Codable
{
    public var field:String?
    public var order:Int?

    required public init(){}
}

public class ErrorDto : Codable
{
    public var message:String?
    public var errorCode:String?
    public var context:[String:String]?
    public var stackTrace:IReadOnlySet<ErrorDto>?

    required public init(){}
}

public enum UserType : String, Codable
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

public enum UserStatus : Int, Codable
{
    case Registered = 0
    case PendingValidation = 2
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

    required public init(){}
}

// @DataContract
public class TriggerDto : IHasViewId, Codable
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

    required public init(){}
}

public protocol IHasViewId
{
    var viewId:String? { get set }

}

public class TagDescription : Codable
{
    public var displayName:DisplayName?
    public var Description:String?

    required public init(){}
}

// @DataContract
public class MessageTranslation<TContent : Codable> : Codable
{
    required public init(){}
}

public class FileResourceId : Codable
{
    public var value:String?

    required public init(){}
}

public class FileChecksum : Codable
{
    public var algorithm:String?
    public var hash:String?

    required public init(){}
}

// @DataContract
public class GroupTags : Codable
{
    // @DataMember
    public var group:Tag?

    // @DataMember
    public var tags:[Tag] = []

    required public init(){}
}

public class PushDeviceToken : Codable
{
    public var token:String?

    required public init(){}
}

public enum PushDeviceDeliveryFamily : String, Codable
{
    case Ios
    case Android
    case Chrome
    case Safari
    case Expo
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

public class JsonSchemaFieldDto : Codable
{
    // @DataMember
    public var fieldName:String?

    required public init(){}
}

public enum TriggerType : String, Codable
{
    case Membership
    case Schema
    case Files
    case Payments
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

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case format
        case pattern
        case minLength
        case maxLength
        case translateOptions
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        format = try container.decodeIfPresent(String.self, forKey: .format)
        pattern = try container.decodeIfPresent(String.self, forKey: .pattern)
        minLength = try container.decodeIfPresent(Int.self, forKey: .minLength)
        maxLength = try container.decodeIfPresent(Int.self, forKey: .maxLength)
        translateOptions = try container.decodeIfPresent(IReadOnlyDictionary<String, String>.self, forKey: .translateOptions)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if format != nil { try container.encode(format, forKey: .format) }
        if pattern != nil { try container.encode(pattern, forKey: .pattern) }
        if minLength != nil { try container.encode(minLength, forKey: .minLength) }
        if maxLength != nil { try container.encode(maxLength, forKey: .maxLength) }
        if translateOptions != nil { try container.encode(translateOptions, forKey: .translateOptions) }
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

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case minimum
        case maximum
        case multipleOf
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        minimum = try container.decodeIfPresent(Double.self, forKey: .minimum)
        maximum = try container.decodeIfPresent(Double.self, forKey: .maximum)
        multipleOf = try container.decodeIfPresent(Double.self, forKey: .multipleOf)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if minimum != nil { try container.encode(minimum, forKey: .minimum) }
        if maximum != nil { try container.encode(maximum, forKey: .maximum) }
        if multipleOf != nil { try container.encode(multipleOf, forKey: .multipleOf) }
    }
}

public class CurrencyFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var allowedCurrencies:IReadOnlyList<String>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case allowedCurrencies
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        allowedCurrencies = try container.decodeIfPresent(IReadOnlyList<String>.self, forKey: .allowedCurrencies)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if allowedCurrencies != nil { try container.encode(allowedCurrencies, forKey: .allowedCurrencies) }
    }
}

public class BooleanFieldDto : JsonSchemaFieldDto
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class DateFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var minimum:Int?

    // @DataMember
    public var maximum:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case minimum
        case maximum
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        minimum = try container.decodeIfPresent(Int.self, forKey: .minimum)
        maximum = try container.decodeIfPresent(Int.self, forKey: .maximum)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if minimum != nil { try container.encode(minimum, forKey: .minimum) }
        if maximum != nil { try container.encode(maximum, forKey: .maximum) }
    }
}

public class IntegerFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var minimum:Int?

    // @DataMember
    public var maximum:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case minimum
        case maximum
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        minimum = try container.decodeIfPresent(Int.self, forKey: .minimum)
        maximum = try container.decodeIfPresent(Int.self, forKey: .maximum)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if minimum != nil { try container.encode(minimum, forKey: .minimum) }
        if maximum != nil { try container.encode(maximum, forKey: .maximum) }
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
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class FileFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var storages:IReadOnlyList<String>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case storages
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        storages = try container.decodeIfPresent(IReadOnlyList<String>.self, forKey: .storages)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if storages != nil { try container.encode(storages, forKey: .storages) }
    }
}

public class TaxonomySelectionFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var taxonomyId:String?

    // @DataMember
    public var multiple:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case taxonomyId
        case multiple
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        taxonomyId = try container.decodeIfPresent(String.self, forKey: .taxonomyId)
        multiple = try container.decodeIfPresent(Bool.self, forKey: .multiple)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if taxonomyId != nil { try container.encode(taxonomyId, forKey: .taxonomyId) }
        if multiple != nil { try container.encode(multiple, forKey: .multiple) }
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

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case multiple
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        multiple = try container.decodeIfPresent(Bool.self, forKey: .multiple)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if multiple != nil { try container.encode(multiple, forKey: .multiple) }
    }
}

public class RoleSelectionFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var multiple:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case multiple
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        multiple = try container.decodeIfPresent(Bool.self, forKey: .multiple)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if multiple != nil { try container.encode(multiple, forKey: .multiple) }
    }
}

public class EnumSelectionFieldDto : JsonSchemaFieldDto
{
    // @DataMember
    public var values:IReadOnlyList<String>?

    // @DataMember
    public var multiple:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case values
        case multiple
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        values = try container.decodeIfPresent(IReadOnlyList<String>.self, forKey: .values)
        multiple = try container.decodeIfPresent(Bool.self, forKey: .multiple)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if values != nil { try container.encode(values, forKey: .values) }
        if multiple != nil { try container.encode(multiple, forKey: .multiple) }
    }
}

public enum TriggerActionType : String, Codable
{
    case Code
    case Push
    case Sms
    case Email
    case WebhookCall
}


