/* Options:
Date: 2026-09-04 14:55:57
SwiftVersion: 6.0
Version: 10.08
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
    public var paymentCustomerRef:PaymentCustomerRef?

    required public init(){}
}

public class SubscriptionChanged : Codable
{
    public var subscription:CodeMashManagedServiceSubscription?

    required public init(){}
}

public class SubscriptionCanceled : Codable
{
    public var paymentCustomerRef:PaymentCustomerRef?
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
    public var primaryRegion:ProjectRegion?
    public var additionalRegions:[ProjectRegion]?
    public var Description:String?
    public var isProvisioning:Bool?

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
    public var primaryRegion:ProjectRegion?
    public var additionalRegions:[ProjectRegion]?

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
    public var authId:AuthId?
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
// @Route("/{version}/membership/auth/register/user-name", "POST")
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
// @Route("/{version}/membership/auth/register/email", "POST")
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
    * Email address the invitation is sent to.
    */
    // @DataMember
    // @ApiMember(Description="Email address the invitation is sent to.", IsRequired=true)
    public var email:String?

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
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

    // @DataMember
    public var taxonomyName:String?

    // @DataMember
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case taxonomyName
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        taxonomyName = try container.decodeIfPresent(String.self, forKey: .taxonomyName)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
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

    // @DataMember
    public var includeTerms:Bool?

    // @DataMember
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case includeTerms
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        includeTerms = try container.decodeIfPresent(Bool.self, forKey: .includeTerms)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
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

    // @DataMember
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
        case taxonomyName
        case databaseIntegrationId
        case filter
        case sortDescending
        case pagingArgs
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        taxonomyName = try container.decodeIfPresent(String.self, forKey: .taxonomyName)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        filter = try container.decodeIfPresent(String.self, forKey: .filter)
        sortDescending = try container.decodeIfPresent(Bool.self, forKey: .sortDescending)
        pagingArgs = try container.decodeIfPresent(PagingArgs.self, forKey: .pagingArgs)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
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
// @Route("/{version}/database/taxonomies/{taxonomyName}/terms/tree", "GET")
// @Api(Description="Database")
// @DataContract
public class FindTermTreeRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = FindTermTreeResponse

    // @DataMember
    public var taxonomyName:String?

    // @DataMember
    public var rootTermId:String?

    // @DataMember
    public var depth:Int?

    // @DataMember
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case taxonomyName
        case rootTermId
        case depth
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        taxonomyName = try container.decodeIfPresent(String.self, forKey: .taxonomyName)
        rootTermId = try container.decodeIfPresent(String.self, forKey: .rootTermId)
        depth = try container.decodeIfPresent(Int.self, forKey: .depth)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
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

    // @DataMember
    public var sortBy:String?

    // @DataMember
    public var sortOrder:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case collectionName
        case databaseIntegrationId
        case filter
        case schemaVersion
        case pagingArgs
        case sortBy
        case sortOrder
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

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case filesIntegrationId
        case path
        case contentType
        case sizeBytes
        case fileName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        filesIntegrationId = try container.decodeIfPresent(String.self, forKey: .filesIntegrationId)
        path = try container.decodeIfPresent(String.self, forKey: .path)
        contentType = try container.decodeIfPresent(String.self, forKey: .contentType)
        sizeBytes = try container.decodeIfPresent(Int.self, forKey: .sizeBytes)
        fileName = try container.decodeIfPresent(String.self, forKey: .fileName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if filesIntegrationId != nil { try container.encode(filesIntegrationId, forKey: .filesIntegrationId) }
        if path != nil { try container.encode(path, forKey: .path) }
        if contentType != nil { try container.encode(contentType, forKey: .contentType) }
        if sizeBytes != nil { try container.encode(sizeBytes, forKey: .sizeBytes) }
        if fileName != nil { try container.encode(fileName, forKey: .fileName) }
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

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case filesIntegrationId
        case path
        case contentType
        case expirationSeconds
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        filesIntegrationId = try container.decodeIfPresent(String.self, forKey: .filesIntegrationId)
        path = try container.decodeIfPresent(String.self, forKey: .path)
        contentType = try container.decodeIfPresent(String.self, forKey: .contentType)
        expirationSeconds = try container.decodeIfPresent(Int.self, forKey: .expirationSeconds)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if filesIntegrationId != nil { try container.encode(filesIntegrationId, forKey: .filesIntegrationId) }
        if path != nil { try container.encode(path, forKey: .path) }
        if contentType != nil { try container.encode(contentType, forKey: .contentType) }
        if expirationSeconds != nil { try container.encode(expirationSeconds, forKey: .expirationSeconds) }
    }
}

public class PushIntegrationSaved : Codable
{
    public var integration:PushIntegration?

    required public init(){}
}

public class PushIntegrationRenamed : Codable
{
    public var id:IntegrationId?
    public var name:DisplayName?
    public var env:Env?

    required public init(){}
}

public class PushIntegrationSetAsDefault : Codable
{
    public var env:Env?
    public var id:IntegrationId?

    required public init(){}
}

public class PushIntegrationDeleted : Codable
{
    public var id:IntegrationId?
    public var env:Env?

    required public init(){}
}

public class PushIntegrationEnabled : Codable
{
    public var id:IntegrationId?
    public var env:Env?

    required public init(){}
}

public class PushIntegrationDisabled : Codable
{
    public var id:IntegrationId?
    public var env:Env?

    required public init(){}
}

public class PushServiceEstablished : Codable
{
    public var defaultTemplates:[PushTemplate]?

    required public init(){}
}

public class PushServiceEnabled : Codable
{
    required public init(){}
}

public class PushServiceDisabled : Codable
{
    required public init(){}
}

public class PushTemplateCreated : Codable
{
    public var templateId:TemplateId?
    public var displayName:DisplayName?
    public var translations:[MessageTranslation<PushMessageContent>] = []
    public var channel:CommunicationChannel?
    public var Description:String?
    public var tags:[Tag]?
    public var env:Env?

    required public init(){}
}

public class PushTemplateUpdated : Codable
{
    public var templateId:TemplateId?
    public var displayName:DisplayName?
    public var translations:[MessageTranslation<PushMessageContent>] = []
    public var channel:CommunicationChannel?
    public var Description:String?
    public var tags:[Tag]?
    public var env:Env?

    required public init(){}
}

public class PushTemplateDeleted : Codable
{
    public var templateId:TemplateId?
    public var env:Env?

    required public init(){}
}

public class PushTemplateArchived : Codable
{
    public var templateId:TemplateId?
    public var env:Env?

    required public init(){}
}

public class PushTemplateUnArchived : Codable
{
    public var templateId:TemplateId?
    public var env:Env?

    required public init(){}
}

public class PushTemplateMirrored : Codable
{
    public var template:PushTemplate?

    required public init(){}
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
    public var adminUrlTemplate:String?
    public var license:EchoLicenseDto?
    public var askForEnterpriseLicenseEmail:String?
    public var emailServiceConfigured:Bool?
    public var rootBootstrapPasswordSource:String?
    public var regions:[EchoRegionDto]?
    public var isProductionInstallation:Bool?
    public var licensingMode:String?
    public var graceDaysLeft:Int?
    public var installationDomain:String?
    public var licensingDocsUrl:String?

    required public init(){}
}

public class PublicProjectConfigDto : Codable
{
    public var displayName:String?
    public var adminPortalEnabled:Bool?
    public var branding:PublicBrandDto?
    public var auth:PublicAuthDto?

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

    // @DataMember
    public var status:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case status
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        status = try container.decodeIfPresent(String.self, forKey: .status)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if status != nil { try container.encode(status, forKey: .status) }
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

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
        case folders
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<FileResourceRefDto>.self, forKey: .list)
        folders = try container.decodeIfPresent(IList<String>.self, forKey: .folders)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
        if folders != nil { try container.encode(folders, forKey: .folders) }
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

public class PaymentCustomerRef : ResourceRef
{
    public var source:ResourceSource?
    public var externalId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case kind
        case source
        case externalId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        kind = try container.decodeIfPresent(ResourceRefKind.self, forKey: .kind)
        source = try container.decodeIfPresent(ResourceSource.self, forKey: .source)
        externalId = try container.decodeIfPresent(String.self, forKey: .externalId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if kind != nil { try container.encode(kind, forKey: .kind) }
        if source != nil { try container.encode(source, forKey: .source) }
        if externalId != nil { try container.encode(externalId, forKey: .externalId) }
    }
}

public class CodeMashManagedServiceSubscription : Codable
{
    public var subscriptionId:CodeMashSubscriptionId?
    public var paymentCustomerRef:PaymentCustomerRef?
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
    public var region:NorbixRegion?

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
    public var fileResource:FileResourceRef?
    public var publicUrl:String?

    required public init(){}
}

public class ProjectIcon : Codable
{
    public var fileResource:FileResourceRef?
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

public class AuthId : IHasDomainEntityId, Codable
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

    public var resolvedEnv:Env?
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

    /**
    * Paging
    */
    // @ApiMember(DataType="object", Description="Paging", Name="paging", ParameterType="body")
    public var paging:PagingArgs?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case projectId
        case env
        case resolvedEnv
        case startingAfter
        case endingBefore
        case pageSize
        case paging
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        projectId = try container.decodeIfPresent(String.self, forKey: .projectId)
        env = try container.decodeIfPresent(String.self, forKey: .env)
        resolvedEnv = try container.decodeIfPresent(Env.self, forKey: .resolvedEnv)
        startingAfter = try container.decodeIfPresent(String.self, forKey: .startingAfter)
        endingBefore = try container.decodeIfPresent(String.self, forKey: .endingBefore)
        pageSize = try container.decodeIfPresent(Int.self, forKey: .pageSize)
        paging = try container.decodeIfPresent(PagingArgs.self, forKey: .paging)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if projectId != nil { try container.encode(projectId, forKey: .projectId) }
        if env != nil { try container.encode(env, forKey: .env) }
        if resolvedEnv != nil { try container.encode(resolvedEnv, forKey: .resolvedEnv) }
        if startingAfter != nil { try container.encode(startingAfter, forKey: .startingAfter) }
        if endingBefore != nil { try container.encode(endingBefore, forKey: .endingBefore) }
        if pageSize != nil { try container.encode(pageSize, forKey: .pageSize) }
        if paging != nil { try container.encode(paging, forKey: .paging) }
    }
}

public class Env : Codable
{
    public var value:String?
    public var isProd:Bool?

    required public init(){}
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

public class PushIntegration : Integration
{
    public var provider:PushProvider?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(PushProvider.self, forKey: .provider)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
    }
}

// @DataContract
public class PushTemplate : Template<PushMessageContent>
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class TemplateId : Codable
{
    public var value:String?

    required public init(){}
}

// @DataContract
public class MessageTranslation<TContent : Codable> : Codable
{
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

// @DataContract
public class EchoLicenseDto : Codable
{
    // @DataMember(Name="domain")
    public var domain:String?

    // @DataMember(Name="accountId")
    public var accountId:String?

    // @DataMember(Name="email")
    public var email:String?

    // @DataMember(Name="release")
    public var release:String?

    // @DataMember(Name="expire")
    public var expire:Int?

    // @DataMember(Name="isTrial")
    public var isTrial:Bool?

    // @DataMember(Name="cap")
    public var cap:Int?

    required public init(){}
}

public class EchoRegionDto : Codable
{
    public var code:String?
    public var displayName:String?
    public var apiUrl:String?
    public var hubUrl:String?

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

    // @DataMember
    public var Description:String?

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

public enum ResourceRefKind : String, Codable
{
    case Contact
    case Document
    case File
    case PaymentCustomer
    case Order
    case Payment
    case Product
    case Integration
}

public enum ResourceSource : String, Codable
{
    case Norbix
    case Stripe
    case Shopify
    case PayPal
    case Adyen
    case Mollie
    case Paddle
    case LemonSqueezy
    case AppleInApp
    case GoogleInApp
    case AuthorizeNet
    case Braintree
    case CheckOutCom
    case WooCommerce
    case Magento
    case Worldpay
}

public class ResourceRef : Codable
{
    public var projectId:ProjectId?
    public var integrationId:IntegrationId?
    public var kind:ResourceRefKind?

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

public class NorbixRegion : Codable
{
    public var code:String?

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
public class FileResourceRef : Codable
{
    // @DataMember(Order=1)
    public var resource:FileResource?

    // @DataMember(Order=2)
    public var integrationId:IntegrationId?

    // @DataMember(Order=3)
    public var provider:FileProvider?

    // @DataMember(Order=4)
    public var path:String?

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

// @DataContract
public enum PushProvider : String, Codable
{
    case AppleApns
    case SafariWeb
    case SafariPush
    case AndroidFirebase
    case ChromeWeb
    case FirefoxWeb
    case EdgeWeb
    case ChromePush
    case CodeMashIosApp
    case CodeMashAndroidApp
    case CodeMashSafariPlugin
    case CodeMashSafariWeb
    case CodeMashChromePlugin
    case CodeMashChromeWeb
    case Expo
    case Fake
}

public class Integration : IIntegrationIdentification, IHasDomainEntityId, Codable
{
    public var integrationId:IntegrationId?
    public var env:Env?
    public var capability:String?
    public var isSystemOwned:Bool?
    public var integrationName:DisplayName?
    public var isEnabled:Bool?
    public var isConfigured:Bool?
    public var lastIntegrationTestAtUtc:Date?
    public var lastIntegrationTestSucceeded:Bool?
    public var lastIntegrationTestErrorMessages:IReadOnlyList<String>?
    public var humanDeliveryConfirmedAtUtc:Date?
    public var isApprovedThatItWorks:Bool?

    required public init(){}
}

public protocol IIntegrationIdentification
{
    var integrationId:IntegrationId? { get set }
    var capability:String? { get set }
    var isSystemOwned:Bool? { get set }

}

// @DataContract
public class Template<TMessageContent : Codable> : IBindableContract, Codable
{
    // @DataMember
    public var templateId:TemplateId?

    // @DataMember
    public var templateName:DisplayName?

    // @DataMember
    public var translations:[MessageTranslation<TMessageContent>] = []

    // @DataMember
    public var communicationChannel:CommunicationChannel?

    // @DataMember
    public var isActive:Bool?

    // @DataMember
    public var Description:String?

    // @DataMember
    public var tags:[Tag]?

    // @DataMember
    public var fileIntegrationId:IntegrationId?

    // @DataMember
    public var env:Env?

    required public init(){}
}

// @DataContract
public class PushMessageContent : Codable
{
    // @DataMember(Order=1)
    public var title:PushTitle?

    // @DataMember(Order=1)
    public var subTitle:PushTitle?

    // @DataMember(Order=2)
    public var body:PushBody?

    required public init(){}
}

public protocol IBindableContract
{
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

public class ErrorDto : Codable
{
    public var message:String?
    public var errorCode:String?
    public var context:[String:String]?
    public var stackTrace:[ErrorDto]?

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
    case Active = 8
    case Unregistered = 16
    case Suspended = 32
    case InActive = 64
    case Blocked = 128
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

public class TagDescription : Codable
{
    public var displayName:DisplayName?
    public var Description:String?

    required public init(){}
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

// @DataContract
public class PushTitle : Codable
{
    // @DataMember
    public var value:TemplateCode?

    required public init(){}
}

public class PushBody : Codable
{
    public var value:TemplateCode?

    required public init(){}
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

// @DataContract
public class FileChecksumDto : Codable
{
    // @DataMember(Order=1)
    public var algorithm:String?

    // @DataMember(Order=2)
    public var hash:String?

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
public class TemplateCode : Codable
{
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
    case SseCall
    case Marketplace
}


