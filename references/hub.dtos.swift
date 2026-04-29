/* Options:
Date: 2026-04-27 20:26:38
SwiftVersion: 6.0
Version: 10.06
Tip: To override a DTO option, remove "//" prefix before updating
BaseUrl: http://localhost:5001

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

// @Route("/internal/_typegen", "GET")
public class InternalsTypeGen : Codable
{
    public var typegen_0_SmtpEmailIntegrationRequest:SmtpEmailIntegrationRequest?
    public var typegen_1_AwsSesEmailIntegrationRequest:AwsSesEmailIntegrationRequest?
    public var typegen_2_SendGridEmailIntegrationRequest:SendGridEmailIntegrationRequest?
    public var typegen_3_MailGunEmailIntegrationRequest:MailGunEmailIntegrationRequest?
    public var typegen_4_EmailToAllUsersDeliverySettingsRequest:EmailToAllUsersDeliverySettingsRequest?
    public var typegen_5_EmailToAccountUsersDeliverySettingsRequest:EmailToAccountUsersDeliverySettingsRequest?
    public var typegen_6_EmailToCollectionRecordsDeliverySettingsRequest:EmailToCollectionRecordsDeliverySettingsRequest?
    public var typegen_7_EmailToEmailsDeliverySettingsRequest:EmailToEmailsDeliverySettingsRequest?
    public var typegen_8_EmailToUsersDeliverySettingsRequest:EmailToUsersDeliverySettingsRequest?
    public var typegen_9_MembershipTriggerRequest:MembershipTriggerRequest?
    public var typegen_10_SchemaTriggerRequest:SchemaTriggerRequest?
    public var typegen_11_FilesTriggerRequest:FilesTriggerRequest?
    public var typegen_12_PaymentTriggerRequest:PaymentTriggerRequest?
    public var typegen_13_MongoDbAtlasServerlessDatabaseIntegrationRequest:MongoDbAtlasServerlessDatabaseIntegrationRequest?
    public var typegen_14_MongoDbAtlasClusterDatabaseIntegrationRequest:MongoDbAtlasClusterDatabaseIntegrationRequest?
    public var typegen_15_MongoDbConnectionStringDatabaseIntegrationRequest:MongoDbConnectionStringDatabaseIntegrationRequest?
    public var typegen_16_GoogleDriveFilesIntegrationRequest:GoogleDriveFilesIntegrationRequest?
    public var typegen_17_FtpFilesIntegrationRequest:FtpFilesIntegrationRequest?
    public var typegen_18_DropBoxFilesIntegrationRequest:DropBoxFilesIntegrationRequest?
    public var typegen_19_AppleICloudFilesIntegrationRequest:AppleICloudFilesIntegrationRequest?
    public var typegen_20_AwsS3FilesIntegrationRequest:AwsS3FilesIntegrationRequest?
    public var typegen_21_GoogleCloudFilesIntegrationRequest:GoogleCloudFilesIntegrationRequest?
    public var typegen_22_AzureBlobFilesIntegrationRequest:AzureBlobFilesIntegrationRequest?
    public var typegen_23_LocalFilesIntegrationRequest:LocalFilesIntegrationRequest?
    public var typegen_24_AmqpLoggingIntegrationRequest:AmqpLoggingIntegrationRequest?
    public var typegen_25_AwsKinesisLoggingIntegrationRequest:AwsKinesisLoggingIntegrationRequest?
    public var typegen_26_AwsS3LoggingIntegrationRequest:AwsS3LoggingIntegrationRequest?
    public var typegen_27_TelegramLoggingIntegrationRequest:TelegramLoggingIntegrationRequest?
    public var typegen_28_NewRelicLoggingIntegrationRequest:NewRelicLoggingIntegrationRequest?
    public var typegen_29_MicrosoftTeamsLoggingIntegrationRequest:MicrosoftTeamsLoggingIntegrationRequest?
    public var typegen_30_MongoDbLoggingIntegrationRequest:MongoDbLoggingIntegrationRequest?
    public var typegen_31_KafkaLoggingIntegrationRequest:KafkaLoggingIntegrationRequest?
    public var typegen_32_PrometheusLoggingIntegrationRequest:PrometheusLoggingIntegrationRequest?
    public var typegen_33_DataDogLoggingIntegrationRequest:DataDogLoggingIntegrationRequest?
    public var typegen_34_InternalKafkaLoggingIntegrationRequest:InternalKafkaLoggingIntegrationRequest?
    public var typegen_35_ElasticSearchLoggingIntegrationRequest:ElasticSearchLoggingIntegrationRequest?
    public var typegen_36_ZabbixLoggingIntegrationRequest:ZabbixLoggingIntegrationRequest?
    public var typegen_37_SplunkLoggingIntegrationRequest:SplunkLoggingIntegrationRequest?
    public var typegen_38_AzureOtelLoggingIntegrationRequest:AzureOtelLoggingIntegrationRequest?
    public var typegen_39_KibanaLoggingIntegrationRequest:KibanaLoggingIntegrationRequest?
    public var typegen_40_LocalFileLoggingIntegrationRequest:LocalFileLoggingIntegrationRequest?
    public var typegen_41_OktaMembershipIntegrationRequest:OktaMembershipIntegrationRequest?
    public var typegen_42_XMembershipIntegrationRequest:XMembershipIntegrationRequest?
    public var typegen_43_GoogleMembershipIntegrationRequest:GoogleMembershipIntegrationRequest?
    public var typegen_44_MicrosoftMembershipIntegrationRequest:MicrosoftMembershipIntegrationRequest?
    public var typegen_45_GitHubMembershipIntegrationRequest:GitHubMembershipIntegrationRequest?
    public var typegen_46_MetaMembershipIntegrationRequest:MetaMembershipIntegrationRequest?
    public var typegen_47_AppleMembershipIntegrationRequest:AppleMembershipIntegrationRequest?
    public var typegen_48_LemonSqueezyPaymentIntegrationRequest:LemonSqueezyPaymentIntegrationRequest?
    public var typegen_49_AdyenPaymentIntegrationRequest:AdyenPaymentIntegrationRequest?
    public var typegen_50_MolliePaymentIntegrationRequest:MolliePaymentIntegrationRequest?
    public var typegen_51_PaddlePaymentIntegrationRequest:PaddlePaymentIntegrationRequest?
    public var typegen_52_PayPalPaymentIntegrationRequest:PayPalPaymentIntegrationRequest?
    public var typegen_53_StripePaymentIntegrationRequest:StripePaymentIntegrationRequest?
    public var typegen_54_AppleInAppPaymentIntegrationRequest:AppleInAppPaymentIntegrationRequest?
    public var typegen_55_GoogleInAppPaymentIntegrationRequest:GoogleInAppPaymentIntegrationRequest?
    public var typegen_56_EdgeWebPushIntegrationRequest:EdgeWebPushIntegrationRequest?
    public var typegen_57_ChromePluginPushIntegrationRequest:ChromePluginPushIntegrationRequest?
    public var typegen_58_SafariPushIntegrationRequest:SafariPushIntegrationRequest?
    public var typegen_59_ChromeWebPushIntegrationRequest:ChromeWebPushIntegrationRequest?
    public var typegen_60_FirefoxWebPushIntegrationRequest:FirefoxWebPushIntegrationRequest?
    public var typegen_61_AndroidFirebasePushIntegrationRequest:AndroidFirebasePushIntegrationRequest?
    public var typegen_62_AppleApnsPushIntegrationRequest:AppleApnsPushIntegrationRequest?
    public var typegen_65_AwsLambdaCodeIntegrationRequest:AwsLambdaCodeIntegrationRequest?
    public var typegen_66_AzureFunctionsCodeIntegrationRequest:AzureFunctionsCodeIntegrationRequest?
    public var typegen_67_GoogleCloudFunctionsCodeIntegrationRequest:GoogleCloudFunctionsCodeIntegrationRequest?
    public var typegen_68_OllamaLlmIntegrationRequest:OllamaLlmIntegrationRequest?
    public var typegen_69_OpenRouterLlmIntegrationRequest:OpenRouterLlmIntegrationRequest?
    public var typegen_70_MistralLlmIntegrationRequest:MistralLlmIntegrationRequest?
    public var typegen_71_GrokLlmIntegrationRequest:GrokLlmIntegrationRequest?
    public var typegen_72_GroqLlmIntegrationRequest:GroqLlmIntegrationRequest?
    public var typegen_73_GoogleLlmIntegrationRequest:GoogleLlmIntegrationRequest?
    public var typegen_74_AnthropicLlmIntegrationRequest:AnthropicLlmIntegrationRequest?
    public var typegen_75_OpenAiLlmIntegrationRequest:OpenAiLlmIntegrationRequest?
    public var typegen_76_PlaywrightMcpIntegrationRequest:PlaywrightMcpIntegrationRequest?
    public var typegen_77_MongoDbMcpIntegrationRequest:MongoDbMcpIntegrationRequest?
    public var typegen_78_GitHubMcpIntegrationRequest:GitHubMcpIntegrationRequest?
    public var typegen_79_StripeMcpIntegrationRequest:StripeMcpIntegrationRequest?
    public var typegen_80_BraveSearchMcpIntegrationRequest:BraveSearchMcpIntegrationRequest?
    public var typegen_81_ObsidianMcpIntegrationRequest:ObsidianMcpIntegrationRequest?
    public var typegen_82_EmailTemplateDto:EmailTemplateDto?
    public var typegen_83_PushTemplateDto:PushTemplateDto?
    public var typegen_84_SmsTemplateDto:SmsTemplateDto?
    public var typegen_85_SystemEmailTemplateDto:SystemEmailTemplateDto?
    public var typegen_86_TriggerActionEmailDto:TriggerActionEmailDto?
    public var typegen_87_TriggerActionPushDto:TriggerActionPushDto?
    public var typegen_88_TriggerActionCodeDto:TriggerActionCodeDto?
    public var typegen_89_TriggerActionWebhookDto:TriggerActionWebhookDto?
    public var typegen_90_EmailToAllUsersDeliverySettingsDto:EmailToAllUsersDeliverySettingsDto?
    public var typegen_91_EmailToAccountUsersDeliverySettingsDto:EmailToAccountUsersDeliverySettingsDto?
    public var typegen_92_EmailToUsersDeliverySettingsDto:EmailToUsersDeliverySettingsDto?
    public var typegen_93_EmailToEmailAddressesDeliverySettingsDto:EmailToEmailAddressesDeliverySettingsDto?
    public var typegen_94_EmailToCollectionRecordsDeliverySettingsDto:EmailToCollectionRecordsDeliverySettingsDto?
    public var typegen_95_PushToAllUsersDeliverySettingsDto:PushToAllUsersDeliverySettingsDto?
    public var typegen_96_PushToUsersDeliverySettingsDto:PushToUsersDeliverySettingsDto?
    public var typegen_97_PushToCollectionRecordsDeliverySettingsDto:PushToCollectionRecordsDeliverySettingsDto?
    public var typegen_98_PushToDevicesDeliverySettingsDto:PushToDevicesDeliverySettingsDto?
    public var typegen_99_SmsToAllUsersDeliverySettingsDto:SmsToAllUsersDeliverySettingsDto?
    public var typegen_100_SmsToUsersDeliverySettingsDto:SmsToUsersDeliverySettingsDto?
    public var typegen_101_SmsToCollectionRecordsDeliverySettingsDto:SmsToCollectionRecordsDeliverySettingsDto?
    public var typegen_102_SmsToPhoneNumbersDeliverySettingsDto:SmsToPhoneNumbersDeliverySettingsDto?
    public var typegen_103_OpenAiLlmIntegrationDto:OpenAiLlmIntegrationDto?
    public var typegen_104_AnthropicLlmIntegrationDto:AnthropicLlmIntegrationDto?
    public var typegen_105_OllamaLlmIntegrationDto:OllamaLlmIntegrationDto?
    public var typegen_106_GroqLlmIntegrationDto:GroqLlmIntegrationDto?
    public var typegen_107_GoogleLlmIntegrationDto:GoogleLlmIntegrationDto?
    public var typegen_108_MistralLlmIntegrationDto:MistralLlmIntegrationDto?
    public var typegen_109_OpenRouterLlmIntegrationDto:OpenRouterLlmIntegrationDto?
    public var typegen_110_GrokLlmIntegrationDto:GrokLlmIntegrationDto?
    public var typegen_111_DockerMcpIntegrationDto:DockerMcpIntegrationDto?
    public var typegen_112_GoogleCalendarMcpIntegrationDto:GoogleCalendarMcpIntegrationDto?
    public var typegen_113_ObsidianMcpIntegrationDto:ObsidianMcpIntegrationDto?
    public var typegen_114_AwsLambdaCrossAccountRoleCodeIntegrationDto:AwsLambdaCrossAccountRoleCodeIntegrationDto?
    public var typegen_115_AwsLambdaIamCodeIntegrationDto:AwsLambdaIamCodeIntegrationDto?
    public var typegen_116_AzureFunctionsCodeIntegrationDto:AzureFunctionsCodeIntegrationDto?
    public var typegen_118_GoogleCloudFunctionsCodeIntegrationDto:GoogleCloudFunctionsCodeIntegrationDto?
    public var typegen_120_AdyenPaymentIntegrationDto:AdyenPaymentIntegrationDto?
    public var typegen_121_AppleInAppPaymentIntegrationDto:AppleInAppPaymentIntegrationDto?
    public var typegen_122_GoogleInAppPaymentIntegrationDto:GoogleInAppPaymentIntegrationDto?
    public var typegen_123_LemonSqueezyPaymentIntegrationDto:LemonSqueezyPaymentIntegrationDto?
    public var typegen_124_MolliePaymentIntegrationDto:MolliePaymentIntegrationDto?
    public var typegen_125_PaddlePaymentIntegrationDto:PaddlePaymentIntegrationDto?
    public var typegen_126_PayPalPaymentIntegrationDto:PayPalPaymentIntegrationDto?
    public var typegen_127_StripePaymentIntegrationDto:StripePaymentIntegrationDto?
    public var typegen_184_ShopifyPaymentIntegrationDto:ShopifyPaymentIntegrationDto?
    public var typegen_185_WooCommercePaymentIntegrationDto:WooCommercePaymentIntegrationDto?
    public var typegen_186_MagentoPaymentIntegrationDto:MagentoPaymentIntegrationDto?
    public var typegen_187_BraintreePaymentIntegrationDto:BraintreePaymentIntegrationDto?
    public var typegen_188_AuthorizeNetPaymentIntegrationDto:AuthorizeNetPaymentIntegrationDto?
    public var typegen_189_CheckOutComPaymentIntegrationDto:CheckOutComPaymentIntegrationDto?
    public var typegen_190_WorldpayPaymentIntegrationDto:WorldpayPaymentIntegrationDto?
    public var typegen_128_AppleSignInMembershipIntegrationDto:AppleSignInMembershipIntegrationDto?
    public var typegen_129_GitHubMembershipIntegrationDto:GitHubMembershipIntegrationDto?
    public var typegen_130_GoogleMembershipIntegrationDto:GoogleMembershipIntegrationDto?
    public var typegen_131_MetaMembershipIntegrationDto:MetaMembershipIntegrationDto?
    public var typegen_132_MicrosoftMembershipIntegrationDto:MicrosoftMembershipIntegrationDto?
    public var typegen_133_OktaMembershipIntegrationDto:OktaMembershipIntegrationDto?
    public var typegen_134_XMembershipIntegrationDto:XMembershipIntegrationDto?
    public var typegen_135_AmqpLoggingIntegrationDto:AmqpLoggingIntegrationDto?
    public var typegen_136_AwsKinesisLoggingIntegrationDto:AwsKinesisLoggingIntegrationDto?
    public var typegen_137_AwsS3CrossAccountRoleLoggingIntegrationDto:AwsS3CrossAccountRoleLoggingIntegrationDto?
    public var typegen_138_AwsS3IamLoggingIntegrationDto:AwsS3IamLoggingIntegrationDto?
    public var typegen_139_AzureOtelLoggingIntegrationDto:AzureOtelLoggingIntegrationDto?
    public var typegen_140_DataDogLoggingIntegrationDto:DataDogLoggingIntegrationDto?
    public var typegen_141_ElasticSearchLoggingIntegrationDto:ElasticSearchLoggingIntegrationDto?
    public var typegen_142_InternalKafkaLoggingIntegrationDto:InternalKafkaLoggingIntegrationDto?
    public var typegen_143_KafkaLoggingIntegrationDto:KafkaLoggingIntegrationDto?
    public var typegen_144_KibanaLoggingIntegrationDto:KibanaLoggingIntegrationDto?
    public var typegen_145_LocalFileLoggingIntegrationDto:LocalFileLoggingIntegrationDto?
    public var typegen_146_MicrosoftTeamsLoggingIntegrationDto:MicrosoftTeamsLoggingIntegrationDto?
    public var typegen_147_MongoDbLoggingIntegrationDto:MongoDbLoggingIntegrationDto?
    public var typegen_148_NewRelicLoggingIntegrationDto:NewRelicLoggingIntegrationDto?
    public var typegen_149_PrometheusLoggingIntegrationDto:PrometheusLoggingIntegrationDto?
    public var typegen_150_SplunkLoggingIntegrationDto:SplunkLoggingIntegrationDto?
    public var typegen_151_TelegramLoggingIntegrationDto:TelegramLoggingIntegrationDto?
    public var typegen_152_ZabbixLoggingIntegrationDto:ZabbixLoggingIntegrationDto?
    public var typegen_191_SlackLoggingIntegrationDto:SlackLoggingIntegrationDto?
    public var typegen_153_AppleICloudFilesIntegrationDto:AppleICloudFilesIntegrationDto?
    public var typegen_154_AwsS3CrossAccountRoleFilesIntegrationDto:AwsS3CrossAccountRoleFilesIntegrationDto?
    public var typegen_155_AwsS3IamFilesIntegrationDto:AwsS3IamFilesIntegrationDto?
    public var typegen_156_AzureBlobFilesIntegrationDto:AzureBlobFilesIntegrationDto?
    public var typegen_157_DropBoxFilesIntegrationDto:DropBoxFilesIntegrationDto?
    public var typegen_158_FtpFilesIntegrationDto:FtpFilesIntegrationDto?
    public var typegen_159_GoogleCloudFilesIntegrationDto:GoogleCloudFilesIntegrationDto?
    public var typegen_160_GoogleDriveFilesIntegrationDto:GoogleDriveFilesIntegrationDto?
    public var typegen_161_LocalFilesIntegrationDto:LocalFilesIntegrationDto?
    public var typegen_162_MongoDbAtlasClusterIntegrationDto:MongoDbAtlasClusterIntegrationDto?
    public var typegen_163_MongoDbAtlasServerlessIntegrationDto:MongoDbAtlasServerlessIntegrationDto?
    public var typegen_164_MongoDbConnectionStringIntegrationDto:MongoDbConnectionStringIntegrationDto?
    public var typegen_165_BirdSmsIntegrationDto:BirdSmsIntegrationDto?
    public var typegen_166_PlivoSmsIntegrationDto:PlivoSmsIntegrationDto?
    public var typegen_167_SinchSmsIntegrationDto:SinchSmsIntegrationDto?
    public var typegen_168_TelesignSmsIntegrationDto:TelesignSmsIntegrationDto?
    public var typegen_169_TelnyxSmsIntegrationDto:TelnyxSmsIntegrationDto?
    public var typegen_170_TwilioSmsIntegrationDto:TwilioSmsIntegrationDto?
    public var typegen_171_VonageSmsIntegrationDto:VonageSmsIntegrationDto?
    public var typegen_172_AndroidFirebasePushIntegrationDto:AndroidFirebasePushIntegrationDto?
    public var typegen_173_AppleApnsPushIntegrationDto:AppleApnsPushIntegrationDto?
    public var typegen_174_ChromePluginPushIntegrationDto:ChromePluginPushIntegrationDto?
    public var typegen_175_ChromeWebPushIntegrationDto:ChromeWebPushIntegrationDto?
    public var typegen_176_EdgeWebPushIntegrationDto:EdgeWebPushIntegrationDto?
    public var typegen_177_FirefoxWebPushIntegrationDto:FirefoxWebPushIntegrationDto?
    public var typegen_178_SafariPushIntegrationDto:SafariPushIntegrationDto?
    public var typegen_179_AwsCrossAccountRoleEmailIntegrationDto:AwsCrossAccountRoleEmailIntegrationDto?
    public var typegen_180_AwsIamEmailIntegrationDto:AwsIamEmailIntegrationDto?
    public var typegen_181_MailGunEmailIntegrationDto:MailGunEmailIntegrationDto?
    public var typegen_182_SendGridEmailIntegrationDto:SendGridEmailIntegrationDto?
    public var typegen_183_SmtpEmailIntegrationDto:SmtpEmailIntegrationDto?
    public var typegen_192_WebhookIntegrationDto:WebhookIntegrationDto?
    public var typegen_193_WebhookDestinationDto:WebhookDestinationDto?
    public var typegen_194_SchedulerTaskDto:SchedulerTaskDto?
    public var typegen_195_MongoDbAggregateDto:MongoDbAggregateDto?
    public var typegen_196_MarketplaceIntegrationDto:MarketplaceIntegrationDto?
    public var typegen_197_MarketplaceFunctionBindingDto:MarketplaceFunctionBindingDto?
    public var typegen_198_MarketplaceListingDto:MarketplaceListingDto?
    public var typegen_199_MarketplaceFunctionDefinitionDto:MarketplaceFunctionDefinitionDto?
    public var typegen_200_MarketplaceFunctionParameterDto:MarketplaceFunctionParameterDto?
    public var typegen_201_MarketplaceMappingDto:MarketplaceMappingDto?

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

// @Route("/{version}/account/profile", "GET")
public class GetAccountProfile : RequestBase, IReturn
{
    public typealias Return = GetAccountProfileResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/account/profile", "PUT")
// @DataContract
public class UpdateAccountProfile : RequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var displayName:String?

    // @DataMember
    public var billingEmail:String?

    // @DataMember
    public var operationsEmail:String?

    // @DataMember
    public var securityEmail:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case displayName
        case billingEmail
        case operationsEmail
        case securityEmail
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
        billingEmail = try container.decodeIfPresent(String.self, forKey: .billingEmail)
        operationsEmail = try container.decodeIfPresent(String.self, forKey: .operationsEmail)
        securityEmail = try container.decodeIfPresent(String.self, forKey: .securityEmail)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if displayName != nil { try container.encode(displayName, forKey: .displayName) }
        if billingEmail != nil { try container.encode(billingEmail, forKey: .billingEmail) }
        if operationsEmail != nil { try container.encode(operationsEmail, forKey: .operationsEmail) }
        if securityEmail != nil { try container.encode(securityEmail, forKey: .securityEmail) }
    }
}

// @Route("/{version}/account/verify/resend", "GET")
public class ResendAccountVerificationToken : RequestBase, IReturn
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
* Get Account Status.
*/
// @Route("/{version}/account/status", "GET")
// @Api(Description="Get Account Status.")
public class GetAccountStatus : RequestBase, IReturn
{
    public typealias Return = GetAccountStatusResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/account/stripe/create-checkout-session", "POST")
// @DataContract
public class CreateStripeCheckoutSession : RequestBase, IReturn
{
    public typealias Return = CreateStripeCheckoutSessionResponse

    // @DataMember
    public var subscriptionType:SubscriptionType?

    // @DataMember
    public var domain:String?

    // @DataMember
    public var projectCap:Int?

    // @DataMember
    public var newProjectSessionId:String?

    // @DataMember
    public var returnUrl:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case subscriptionType
        case domain
        case projectCap
        case newProjectSessionId
        case returnUrl
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        subscriptionType = try container.decodeIfPresent(SubscriptionType.self, forKey: .subscriptionType)
        domain = try container.decodeIfPresent(String.self, forKey: .domain)
        projectCap = try container.decodeIfPresent(Int.self, forKey: .projectCap)
        newProjectSessionId = try container.decodeIfPresent(String.self, forKey: .newProjectSessionId)
        returnUrl = try container.decodeIfPresent(String.self, forKey: .returnUrl)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if subscriptionType != nil { try container.encode(subscriptionType, forKey: .subscriptionType) }
        if domain != nil { try container.encode(domain, forKey: .domain) }
        if projectCap != nil { try container.encode(projectCap, forKey: .projectCap) }
        if newProjectSessionId != nil { try container.encode(newProjectSessionId, forKey: .newProjectSessionId) }
        if returnUrl != nil { try container.encode(returnUrl, forKey: .returnUrl) }
    }
}

// @Route("/{version}/account/stripe/get-portal-url", "POST")
// @DataContract
public class GetStripeBillingPortalUrl : RequestBase, IReturn
{
    public typealias Return = GetStripeBillingPortalUrlResponse

    // @DataMember
    public var subscriptionType:SubscriptionType?

    // @DataMember
    public var returnUrl:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case subscriptionType
        case returnUrl
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        subscriptionType = try container.decodeIfPresent(SubscriptionType.self, forKey: .subscriptionType)
        returnUrl = try container.decodeIfPresent(String.self, forKey: .returnUrl)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if subscriptionType != nil { try container.encode(subscriptionType, forKey: .subscriptionType) }
        if returnUrl != nil { try container.encode(returnUrl, forKey: .returnUrl) }
    }
}

// @Route("/{version}/account/team/member", "POST")
public class CreateTeamMemberFromInvitation : RequestBase, IReturn
{
    public typealias Return = CreateTeamMemberFromInvitationResponse

    /**
    * Display name of the account holder
    */
    // @ApiMember(DataType="string", Description="Display name of the account holder", IsRequired=true, Name="DisplayName", ParameterType="form")
    public var displayName:String?

    /**
    * Token from invitation email
    */
    // @ApiMember(DataType="string", Description="Token from invitation email", IsRequired=true, Name="Token", ParameterType="form")
    public var token:String?

    /**
    * Set password for a new account
    */
    // @ApiMember(DataType="string", Description="Set password for a new account", Format="password", IsRequired=true, Name="Password", ParameterType="form")
    public var password:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case displayName
        case token
        case password
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
        token = try container.decodeIfPresent(String.self, forKey: .token)
        password = try container.decodeIfPresent(String.self, forKey: .password)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if displayName != nil { try container.encode(displayName, forKey: .displayName) }
        if token != nil { try container.encode(token, forKey: .token) }
        if password != nil { try container.encode(password, forKey: .password) }
    }
}

// @Route("/{version}/account/verify", "GET")
public class VerifyAccount : RequestBase, IReturn, IHasAccountId
{
    public typealias Return = EmptyResponse

    public var token:String?
    public var accountId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case token
        case accountId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        token = try container.decodeIfPresent(String.self, forKey: .token)
        accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if token != nil { try container.encode(token, forKey: .token) }
        if accountId != nil { try container.encode(accountId, forKey: .accountId) }
    }
}

// @Route("/{version}/account/projects/{projectId}/notifications/settings/group", "DELETE")
public class DeleteNotificationsGroup : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var groupTag:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case groupTag
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        groupTag = try container.decodeIfPresent(String.self, forKey: .groupTag)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if groupTag != nil { try container.encode(groupTag, forKey: .groupTag) }
    }
}

// @Route("/{version}/account/projects/{projectId}/notifications/settings/tag", "DELETE")
public class DeleteNotificationsTag : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var tag:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case tag
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tag = try container.decodeIfPresent(String.self, forKey: .tag)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if tag != nil { try container.encode(tag, forKey: .tag) }
    }
}

// @Route("/{version}/account/projects/{projectId}/notifications/settings/group/tag", "DELETE")
public class RemoveTagFromNotificationsGroup : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var groupTag:String?
    public var tag:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case groupTag
        case tag
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        groupTag = try container.decodeIfPresent(String.self, forKey: .groupTag)
        tag = try container.decodeIfPresent(String.self, forKey: .tag)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if groupTag != nil { try container.encode(groupTag, forKey: .groupTag) }
        if tag != nil { try container.encode(tag, forKey: .tag) }
    }
}

// @Route("/{version}/account/projects/{projectId}/notifications/settings/group", "POST")
public class SaveNotificationsGroup : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var groupDefinition:GroupDefinitionDto?
    public var channel:CommunicationChannel?
    public var originChannel:CommunicationChannel?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case groupDefinition
        case channel
        case originChannel
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        groupDefinition = try container.decodeIfPresent(GroupDefinitionDto.self, forKey: .groupDefinition)
        channel = try container.decodeIfPresent(CommunicationChannel.self, forKey: .channel)
        originChannel = try container.decodeIfPresent(CommunicationChannel.self, forKey: .originChannel)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if groupDefinition != nil { try container.encode(groupDefinition, forKey: .groupDefinition) }
        if channel != nil { try container.encode(channel, forKey: .channel) }
        if originChannel != nil { try container.encode(originChannel, forKey: .originChannel) }
    }
}

// @Route("/{version}/account/projects/{projectId}/notifications/settings/tag", "POST")
public class SaveNotificationsTag : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var tagDefinition:TagDefinitionDto?
    public var channel:CommunicationChannel?
    public var groupTag:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case tagDefinition
        case channel
        case groupTag
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tagDefinition = try container.decodeIfPresent(TagDefinitionDto.self, forKey: .tagDefinition)
        channel = try container.decodeIfPresent(CommunicationChannel.self, forKey: .channel)
        groupTag = try container.decodeIfPresent(String.self, forKey: .groupTag)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if tagDefinition != nil { try container.encode(tagDefinition, forKey: .tagDefinition) }
        if channel != nil { try container.encode(channel, forKey: .channel) }
        if groupTag != nil { try container.encode(groupTag, forKey: .groupTag) }
    }
}

/**
* Create a new backend project.
*/
// @Route("/{version}/account/projects", "POST")
// @Api(Description="Create a new backend project.")
// @DataContract
public class CreateProjectRequest : RequestBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var integration:DatabaseIntegrationRequest?

    // @DataMember
    public var projectName:String?

    // @DataMember
    public var regions:[String]?

    // @DataMember
    public var Description:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integration
        case projectName
        case regions
        case Description
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integration = try container.decodeIfPresent(DatabaseIntegrationRequest.self, forKey: .integration)
        projectName = try container.decodeIfPresent(String.self, forKey: .projectName)
        regions = try container.decodeIfPresent([String].self, forKey: .regions) ?? []
        Description = try container.decodeIfPresent(String.self, forKey: .Description)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integration != nil { try container.encode(integration, forKey: .integration) }
        if projectName != nil { try container.encode(projectName, forKey: .projectName) }
        if regions != nil { try container.encode(regions, forKey: .regions) }
        if Description != nil { try container.encode(Description, forKey: .Description) }
    }
}

// @Route("/{version}/account/projects/{projectId}", "DELETE")
public class DeleteProject : CodeMashRequestBase, IReturn
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
* Gets project info.
*/
// @Route("/{version}/account/projects/{projectId}", "GET")
// @Api(Description="Gets project info.")
public class GetProject : CodeMashRequestBase, IReturn
{
    public typealias Return = GetProjectResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

/**
* Retrieve projects list.
*/
// @Route("/{version}/account/projects", "GET")
// @Api(Description="Retrieve projects list.")
public class GetProjects : RequestBase, IReturn
{
    public typealias Return = GetProjectsResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

/**
* Get available project regions.
*/
// @Route("/{version}/account/regions", "GET")
// @Api(Description="Get available project regions.")
public class GetAccountRegions : RequestBase, IReturn
{
    public typealias Return = GetAccountRegionsResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

/**
* Gets project tokens.
*/
// @Route("/{version}/account/projects/{projectId}/tokens", "GET")
// @Api(Description="Gets project tokens.")
public class GetProjectTokens : CodeMashRequestBase, IReturn
{
    public typealias Return = GetProjectTokensResponse

    public var initiatorId:String?
    public var recipientId:String?
    public var targetUserId:String?
    public var membershipTriggerOldUserId:String?
    public var membershipTriggerNewUserId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case initiatorId
        case recipientId
        case targetUserId
        case membershipTriggerOldUserId
        case membershipTriggerNewUserId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        initiatorId = try container.decodeIfPresent(String.self, forKey: .initiatorId)
        recipientId = try container.decodeIfPresent(String.self, forKey: .recipientId)
        targetUserId = try container.decodeIfPresent(String.self, forKey: .targetUserId)
        membershipTriggerOldUserId = try container.decodeIfPresent(String.self, forKey: .membershipTriggerOldUserId)
        membershipTriggerNewUserId = try container.decodeIfPresent(String.self, forKey: .membershipTriggerNewUserId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if initiatorId != nil { try container.encode(initiatorId, forKey: .initiatorId) }
        if recipientId != nil { try container.encode(recipientId, forKey: .recipientId) }
        if targetUserId != nil { try container.encode(targetUserId, forKey: .targetUserId) }
        if membershipTriggerOldUserId != nil { try container.encode(membershipTriggerOldUserId, forKey: .membershipTriggerOldUserId) }
        if membershipTriggerNewUserId != nil { try container.encode(membershipTriggerNewUserId, forKey: .membershipTriggerNewUserId) }
    }
}

/**
* Updates project accent color
*/
// @Route("/{version}/account/projects/{projectId}/settings/accent-color", "PATCH")
// @Api(Description="Updates project accent color")
public class UpdateProjectAccentColor : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var color:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case color
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        color = try container.decodeIfPresent(String.self, forKey: .color)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if color != nil { try container.encode(color, forKey: .color) }
    }
}

/**
* Updates project icon
*/
// @Route("/{version}/account/projects/{projectId}/settings/icon", "PATCH")
// @Api(Description="Updates project icon")
public class UpdateProjectIcon : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var fileResource:FileResourceDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case fileResource
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fileResource = try container.decodeIfPresent(FileResourceDto.self, forKey: .fileResource)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if fileResource != nil { try container.encode(fileResource, forKey: .fileResource) }
    }
}

/**
* Updates project logo
*/
// @Route("/{version}/account/projects/{projectId}/settings/logo", "PATCH")
// @Api(Description="Updates project logo")
public class UpdateProjectLogo : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var fileResource:FileResourceDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case fileResource
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fileResource = try container.decodeIfPresent(FileResourceDto.self, forKey: .fileResource)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if fileResource != nil { try container.encode(fileResource, forKey: .fileResource) }
    }
}

/**
* Updates project main color
*/
// @Route("/{version}/account/projects/{projectId}/settings/main-color", "PATCH")
// @Api(Description="Updates project main color")
public class UpdateProjectMainColor : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var color:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case color
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        color = try container.decodeIfPresent(String.self, forKey: .color)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if color != nil { try container.encode(color, forKey: .color) }
    }
}

/**
* Updates project CORS settings
*/
// @Route("/{version}/account/projects/{projectId}/settings/origins", "PATCH")
// @Api(Description="Updates project CORS settings")
public class UpdateProjectAllowedOrigins : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var origins:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case origins
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        origins = try container.decodeIfPresent([String].self, forKey: .origins) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if origins != nil { try container.encode(origins, forKey: .origins) }
    }
}

/**
* Update project default language
*/
// @Route("/{version}/account/projects/{projectId}/settings/default-language", "PATCH")
// @Api(Description="Update project default language")
public class UpdateProjectDefaultLanguage : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var defaultLanguage:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case defaultLanguage
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        defaultLanguage = try container.decodeIfPresent(String.self, forKey: .defaultLanguage)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if defaultLanguage != nil { try container.encode(defaultLanguage, forKey: .defaultLanguage) }
    }
}

/**
* Updates project description
*/
// @Route("/{version}/account/projects/{projectId}/settings/description", "PATCH")
// @Api(Description="Updates project description")
public class UpdateProjectDescription : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var Description:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case Description
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        Description = try container.decodeIfPresent(String.self, forKey: .Description)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if Description != nil { try container.encode(Description, forKey: .Description) }
    }
}

/**
* Disables project
*/
// @Route("/{version}/account/projects/{projectId}/disable", "PATCH")
// @Api(Description="Disables project")
public class DisableProject : CodeMashRequestBase, IReturn
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
* Enables project
*/
// @Route("/{version}/account/projects/{projectId}/enable", "PATCH")
// @Api(Description="Enables project")
public class EnableProject : CodeMashRequestBase, IReturn
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
* Updates project languages
*/
// @Route("/{version}/account/projects/{projectId}/settings/languages", "PATCH")
// @Api(Description="Updates project languages")
public class UpdateProjectLanguages : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var languages:[String] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case languages
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        languages = try container.decodeIfPresent([String].self, forKey: .languages) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if languages.count > 0 { try container.encode(languages, forKey: .languages) }
    }
}

/**
* Updates project marketing url
*/
// @Route("/{version}/account/projects/{projectId}/settings/url", "PATCH")
// @Api(Description="Updates project marketing url")
public class UpdateProjectUrl : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

/**
* Updates project name
*/
// @Route("/{version}/account/projects/{projectId}/settings/name", "PATCH")
// @Api(Description="Updates project name")
public class UpdateProjectName : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var name:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case name
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if name != nil { try container.encode(name, forKey: .name) }
    }
}

/**
* Updates project regions
*/
// @Route("/{version}/account/projects/{projectId}/settings/regions", "PATCH")
// @Api(Description="Updates project regions")
public class UpdateProjectRegions : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var regions:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case regions
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        regions = try container.decodeIfPresent([String].self, forKey: .regions) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if regions != nil { try container.encode(regions, forKey: .regions) }
    }
}

/**
* This API endpoint allows users to create a new CodeMash account.
*/
// @Route("/{version}/account", "POST")
// @Api(Description="This API endpoint allows users to create a new CodeMash account.")
public class CreateAccount : RequestBase, IReturn
{
    public typealias Return = CreateAccountResponse

    /**
    * Display name of the account holder
    */
    // @ApiMember(DataType="string", Description="Display name of the account holder", IsRequired=true, Name="DisplayName", ParameterType="form")
    public var displayName:String?

    /**
    * Real email of account holder
    */
    // @ApiMember(DataType="string", Description="Real email of account holder", IsRequired=true, Name="Email", ParameterType="form")
    public var email:String?

    /**
    * Set password for a new account
    */
    // @ApiMember(DataType="string", Description="Set password for a new account", Format="password", IsRequired=true, Name="Password", ParameterType="form")
    public var password:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case displayName
        case email
        case password
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        password = try container.decodeIfPresent(String.self, forKey: .password)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if displayName != nil { try container.encode(displayName, forKey: .displayName) }
        if email != nil { try container.encode(email, forKey: .email) }
        if password != nil { try container.encode(password, forKey: .password) }
    }
}

// @Route("/{version}/account/collaborators", "GET")
public class GetAccountCollaborators : RequestBase, IReturn
{
    public typealias Return = GetAccountCollaboratorsResponse

    public var includeAccountOwner:Bool?
    public var userShouldHavePushDevice:Bool?
    public var projectId:String?
    public var userIds:[String]?
    public var pagingArgs:PagingArgs?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case includeAccountOwner
        case userShouldHavePushDevice
        case projectId
        case userIds
        case pagingArgs
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        includeAccountOwner = try container.decodeIfPresent(Bool.self, forKey: .includeAccountOwner)
        userShouldHavePushDevice = try container.decodeIfPresent(Bool.self, forKey: .userShouldHavePushDevice)
        projectId = try container.decodeIfPresent(String.self, forKey: .projectId)
        userIds = try container.decodeIfPresent([String].self, forKey: .userIds) ?? []
        pagingArgs = try container.decodeIfPresent(PagingArgs.self, forKey: .pagingArgs)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if includeAccountOwner != nil { try container.encode(includeAccountOwner, forKey: .includeAccountOwner) }
        if userShouldHavePushDevice != nil { try container.encode(userShouldHavePushDevice, forKey: .userShouldHavePushDevice) }
        if projectId != nil { try container.encode(projectId, forKey: .projectId) }
        if userIds != nil { try container.encode(userIds, forKey: .userIds) }
        if pagingArgs != nil { try container.encode(pagingArgs, forKey: .pagingArgs) }
    }
}

// @Route("/{version}/account/team/member/invite", "POST")
public class SendInviteToTeamMember : RequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/account/licenses", "GET")
public class GetLicenses : RequestBase, IReturn
{
    public typealias Return = GetLicensesResponse

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

public class AccountProfileUpdated : Codable
{
    public var displayName:DisplayName?
    public var billingEmail:EmailAddress?
    public var operationsEmail:EmailAddress?
    public var securityEmail:EmailAddress?

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

public class AccountVerified : Codable
{
    required public init(){}
}

public class AccountBlocked : Codable
{
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

public class ProjectCreated : Codable
{
    public var id:ProjectId?
    public var name:ProjectName?
    public var databaseIntegrationId:IntegrationId?
    public var regions:[ProjectRegion]?
    public var Description:String?

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

public class ProjectDeleted : Codable
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

public class ProjectEnabled : Codable
{
    required public init(){}
}

public class ProjectCommunicationSet : Codable
{
    public var projectCommunication:ProjectCommunication?

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

// @Route("/{version}/membership/disable", "GET")
public class DisableMembership : CodeMashRequestBase, IReturn
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

// @Route("/{version}/membership/enable", "GET")
public class EnableMembership : CodeMashRequestBase, IReturn
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

// @Route("/{version}/notifications/user/preferences", "GET")
public class GetUserNotificationPreferences : CodeMashRequestBase, IReturn
{
    public typealias Return = GetUserEmailPreferencesResponse

    public var userId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case userId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userId = try container.decodeIfPresent(String.self, forKey: .userId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if userId != nil { try container.encode(userId, forKey: .userId) }
    }
}

// @Route("/{version}/notifications/user/preferences", "PUT")
public class UpdateUserNotificationsPreferences : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var userId:String?
    public var blockAllMarketingMessages:Bool?
    public var subscribedToTags:[DeliveryChannel:HashSet<String>]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case userId
        case blockAllMarketingMessages
        case subscribedToTags
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userId = try container.decodeIfPresent(String.self, forKey: .userId)
        blockAllMarketingMessages = try container.decodeIfPresent(Bool.self, forKey: .blockAllMarketingMessages)
        subscribedToTags = try container.decodeIfPresent([DeliveryChannel:HashSet<String>].self, forKey: .subscribedToTags) ?? [:]
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if userId != nil { try container.encode(userId, forKey: .userId) }
        if blockAllMarketingMessages != nil { try container.encode(blockAllMarketingMessages, forKey: .blockAllMarketingMessages) }
        if subscribedToTags != nil { try container.encode(subscribedToTags, forKey: .subscribedToTags) }
    }
}

// @Route("/{version}/membership/triggers/{triggerId}", "DELETE")
// @Route("/{version}/triggers", "DELETE")
// @DataContract
public class DeleteMembershipTrigger : DeleteTrigger, IReturn
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

// @Route("/{version}/membership/triggers/{triggerId}/disable", "PATCH")
// @Route("/{version}/triggers/disable", "PUT")
// @DataContract
public class DisableMembershipTrigger : DisableTrigger, IReturn
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

// @Route("/{version}/membership/triggers/{triggerId}/enable", "PATCH")
// @Route("/{version}/triggers/enable", "PUT")
// @DataContract
public class EnableMembershipTrigger : EnableTrigger, IReturn
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
* Gets membership trigger by specified Id
*/
// @Route("/{version}/membership/triggers/{id}", "GET")
// @Api(Description="Gets membership trigger by specified Id")
public class GetMembershipTrigger : GetTrigger, IReturn
{
    public typealias Return = GetMembershipTriggerResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

/**
* Gets membership triggers
*/
// @Route("/{version}/membership/triggers", "GET")
// @Api(Description="Gets membership triggers")
public class GetMembershipTriggers : GetTriggers, IReturn
{
    public typealias Return = GetMembershipTriggersResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/membership/triggers", "POST")
// @Route("/{version}/triggers", "POST")
// @DataContract
public class SaveMembershipTrigger : SaveTrigger, IReturn
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
* Create a new custom role for project.
*/
// @Route("/{version}/membership/roles", "POST")
// @Api(Description="Create a new custom role for project.")
public class CreateRole : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    public var roleName:String?
    public var Description:String?
    public var policies:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case roleName
        case Description
        case policies
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        roleName = try container.decodeIfPresent(String.self, forKey: .roleName)
        Description = try container.decodeIfPresent(String.self, forKey: .Description)
        policies = try container.decodeIfPresent([String].self, forKey: .policies) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if roleName != nil { try container.encode(roleName, forKey: .roleName) }
        if Description != nil { try container.encode(Description, forKey: .Description) }
        if policies != nil { try container.encode(policies, forKey: .policies) }
    }
}

/**
* Deletes custom role from project.
*/
// @Route("/{version}/membership/roles", "DELETE")
// @Api(Description="Deletes custom role from project.")
public class DeleteRole : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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
* Gets project role details.
*/
// @Route("/{version}/membership/roles/{Id}", "GET")
// @Api(Description="Gets project role details.")
public class GetRole : CodeMashRequestBase, IReturn
{
    public typealias Return = GetRoleResponse

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
* Gets project roles.
*/
// @Route("/{version}/membership/roles", "GET")
// @Api(Description="Gets project roles.")
public class GetRoles : CodeMashRequestBase, IReturn
{
    public typealias Return = GetRolesResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

/**
* Updates role policies
*/
// @Route("/{version}/membership/roles", "PATCH")
// @Api(Description="Updates role policies")
public class UpdateRolePolicies : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var id:String?
    public var roleName:String?
    public var Description:String?
    public var policies:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case roleName
        case Description
        case policies
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        roleName = try container.decodeIfPresent(String.self, forKey: .roleName)
        Description = try container.decodeIfPresent(String.self, forKey: .Description)
        policies = try container.decodeIfPresent([String].self, forKey: .policies) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if roleName != nil { try container.encode(roleName, forKey: .roleName) }
        if Description != nil { try container.encode(Description, forKey: .Description) }
        if policies != nil { try container.encode(policies, forKey: .policies) }
    }
}

/**
* Create a new custom policy for project.
*/
// @Route("/{version}/membership/policies", "POST")
// @Api(Description="Create a new custom policy for project.")
public class CreatePolicy : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    public var policyName:String?
    public var Description:String?
    public var policyDocumentJson:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case policyName
        case Description
        case policyDocumentJson
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        policyName = try container.decodeIfPresent(String.self, forKey: .policyName)
        Description = try container.decodeIfPresent(String.self, forKey: .Description)
        policyDocumentJson = try container.decodeIfPresent(String.self, forKey: .policyDocumentJson)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if policyName != nil { try container.encode(policyName, forKey: .policyName) }
        if Description != nil { try container.encode(Description, forKey: .Description) }
        if policyDocumentJson != nil { try container.encode(policyDocumentJson, forKey: .policyDocumentJson) }
    }
}

/**
* Deletes custom policy from project.
*/
// @Route("/{version}/membership/policies", "DELETE")
// @Api(Description="Deletes custom policy from project.")
public class DeletePolicy : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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
* Gets project policy details.
*/
// @Route("/{version}/membership/policies/{Id}", "GET")
// @Api(Description="Gets project policy details.")
public class GetPolicy : CodeMashRequestBase, IReturn
{
    public typealias Return = GetPolicyResponse

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
* Gets project policies.
*/
// @Route("/{version}/membership/policies", "GET")
// @Api(Description="Gets project policies.")
public class GetPolicies : CodeMashRequestBase, IReturn
{
    public typealias Return = GetPoliciesResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

/**
* Updates a custom policy for project.
*/
// @Route("/{version}/membership/policies", "PUT")
// @Api(Description="Updates a custom policy for project.")
public class UpdatePolicy : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    public var id:String?
    public var policyName:String?
    public var Description:String?
    public var policyDocumentJson:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case policyName
        case Description
        case policyDocumentJson
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        policyName = try container.decodeIfPresent(String.self, forKey: .policyName)
        Description = try container.decodeIfPresent(String.self, forKey: .Description)
        policyDocumentJson = try container.decodeIfPresent(String.self, forKey: .policyDocumentJson)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if policyName != nil { try container.encode(policyName, forKey: .policyName) }
        if Description != nil { try container.encode(Description, forKey: .Description) }
        if policyDocumentJson != nil { try container.encode(policyDocumentJson, forKey: .policyDocumentJson) }
    }
}

// @Route("/{version}/membership/integrations/{Id}", "DELETE")
public class DeleteMembershipIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/membership/integrations/{Id}/disable", "PUT")
public class DisableMembershipIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/membership/integrations/{Id}/enable", "PUT")
public class EnableMembershipIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/membership/integrations/{id}", "GET")
public class GetMembershipIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = GetMembershipIntegrationResponse

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

// @Route("/{version}/membership/integrations", "GET")
public class GetMembershipIntegrations : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetMembershipIntegrationsResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/membership/integrations", "POST")
// @DataContract
public class SaveMembershipIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var integration:MembershipIntegrationRequest?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integration
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integration = try container.decodeIfPresent(MembershipIntegrationRequest.self, forKey: .integration)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integration != nil { try container.encode(integration, forKey: .integration) }
    }
}

// @Route("/{version}/membership/integrations/{Id}/default", "PUT")
public class SetMembershipIntegrationAsDefaultRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

public class MembershipIntegrationSaved : Codable
{
    public var integration:MembershipIntegration?

    required public init(){}
}

public class MembershipIntegrationTested : Codable
{
    public var id:IntegrationId?
    public var succeeded:Bool?
    public var errorMessages:IReadOnlyList<String>?
    public var testedAtUtc:Date?

    required public init(){}
}

public class MembershipIntegrationRenamed : Codable
{
    public var id:IntegrationId?
    public var name:DisplayName?

    required public init(){}
}

public class MembershipIntegrationDeleted : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class MembershipIntegrationSetAsDefault : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class MembershipIntegrationEnabled : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class MembershipIntegrationDisabled : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class MembershipEstablished : Codable
{
    required public init(){}
}

public class MembershipEnabled : Codable
{
    required public init(){}
}

public class MembershipDisabled : Codable
{
    required public init(){}
}

public class SetUserRegistersAsRole : Codable
{
    public var projectId:ProjectId?
    public var role:RoleName?

    required public init(){}
}

public class PolicyCreated : Codable
{
    public var policy:MembershipPolicy?

    required public init(){}
}

public class PolicyUpdated : Codable
{
    public var policy:MembershipPolicy?

    required public init(){}
}

public class PolicyDeleted : Codable
{
    public var policyId:PolicyId?

    required public init(){}
}

public class RoleCreated : Codable
{
    public var role:MembershipRole?

    required public init(){}
}

public class RoleUpdated : Codable
{
    public var role:MembershipRole?

    required public init(){}
}

public class RoleDeleted : Codable
{
    public var roleId:RoleId?

    required public init(){}
}

public class MembershipTriggerSaved : Codable
{
    public var trigger:MembershipTrigger?

    required public init(){}
}

public class MembershipTriggerEnabled : TriggerByIdEventBase
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class MembershipTriggerDisabled : TriggerByIdEventBase
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class MembershipTriggerDeleted : TriggerByIdEventBase
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/database/disable", "GET")
public class DisableDatabase : CodeMashRequestBase, IReturn
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

// @Route("/{version}/database/enable", "GET")
public class EnableDatabase : CodeMashRequestBase, IReturn
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

// @Route("/{version}/database/schemas/triggers/{triggerId}", "DELETE")
// @Route("/{version}/triggers", "DELETE")
// @DataContract
public class DeleteSchemaTrigger : DeleteTrigger, IReturn
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

// @Route("/{version}/database/schemas/triggers/{triggerId}/disable", "PATCH")
// @Route("/{version}/triggers/disable", "PUT")
// @DataContract
public class DisableSchemaTrigger : DisableTrigger, IReturn
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

// @Route("/{version}/database/schemas/triggers/{triggerId}/enable", "PATCH")
// @Route("/{version}/triggers/enable", "PUT")
// @DataContract
public class EnableSchemaTrigger : EnableTrigger, IReturn
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
* Gets database trigger by specified Id
*/
// @Route("/{version}/database/schemas/triggers/{id}", "GET")
// @Api(Description="Gets database trigger by specified Id")
public class GetSchemaTrigger : GetTrigger, IReturn
{
    public typealias Return = GetSchemaTriggerResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

/**
* Gets database triggers
*/
// @Route("/{version}/database/schemas/triggers", "GET")
// @Api(Description="Gets database triggers")
public class GetSchemaTriggers : GetTriggers, IReturn
{
    public typealias Return = GetSchemaTriggersResponse

    public var schemaId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case schemaId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        schemaId = try container.decodeIfPresent(String.self, forKey: .schemaId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if schemaId != nil { try container.encode(schemaId, forKey: .schemaId) }
    }
}

// @Route("/{version}/database/schemas/triggers", "POST")
// @Route("/{version}/triggers", "POST")
// @DataContract
public class SaveSchemaTrigger : SaveTrigger, IReturn
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

// @Route("/{version}/database/taxonomies/{Id}", "DELETE")
public class DeleteDatabaseTaxonomyRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/database/taxonomies/{id}", "GET")
public class GetDatabaseTaxonomy : CodeMashRequestBase, IReturn
{
    public typealias Return = GetDatabaseTaxonomyResponse

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

// @Route("/{version}/database/taxonomies", "GET")
public class GetDatabaseTaxonomies : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetDatabaseTaxonomiesResponse

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

// @Route("/{version}/database/taxonomies", "POST")
// @DataContract
public class SaveDatabaseTaxonomyRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var viewId:String?

    // @DataMember
    public var taxonomyName:String?

    // @DataMember
    public var Description:String?

    // @DataMember
    public var termsMetaDataSchema:String?

    // @DataMember
    public var termsMetaVisualSchema:String?

    // @DataMember
    public var parentId:String?

    // @DataMember
    public var dependencies:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case viewId
        case taxonomyName
        case Description
        case termsMetaDataSchema
        case termsMetaVisualSchema
        case parentId
        case dependencies
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        viewId = try container.decodeIfPresent(String.self, forKey: .viewId)
        taxonomyName = try container.decodeIfPresent(String.self, forKey: .taxonomyName)
        Description = try container.decodeIfPresent(String.self, forKey: .Description)
        termsMetaDataSchema = try container.decodeIfPresent(String.self, forKey: .termsMetaDataSchema)
        termsMetaVisualSchema = try container.decodeIfPresent(String.self, forKey: .termsMetaVisualSchema)
        parentId = try container.decodeIfPresent(String.self, forKey: .parentId)
        dependencies = try container.decodeIfPresent([String].self, forKey: .dependencies) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if viewId != nil { try container.encode(viewId, forKey: .viewId) }
        if taxonomyName != nil { try container.encode(taxonomyName, forKey: .taxonomyName) }
        if Description != nil { try container.encode(Description, forKey: .Description) }
        if termsMetaDataSchema != nil { try container.encode(termsMetaDataSchema, forKey: .termsMetaDataSchema) }
        if termsMetaVisualSchema != nil { try container.encode(termsMetaVisualSchema, forKey: .termsMetaVisualSchema) }
        if parentId != nil { try container.encode(parentId, forKey: .parentId) }
        if dependencies != nil { try container.encode(dependencies, forKey: .dependencies) }
    }
}

// @Route("/{version}/database/taxonomies/{TaxonomyId}/terms/{Id}", "DELETE")
// @DataContract
public class DeleteDatabaseTaxonomyTermRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var taxonomyId:String?

    // @DataMember
    public var id:String?

    // @DataMember
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case taxonomyId
        case id
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        taxonomyId = try container.decodeIfPresent(String.self, forKey: .taxonomyId)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if taxonomyId != nil { try container.encode(taxonomyId, forKey: .taxonomyId) }
        if id != nil { try container.encode(id, forKey: .id) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

// @Route("/{version}/database/taxonomies/{TaxonomyId}/terms/many", "DELETE")
// @DataContract
public class DeleteManyDatabaseTaxonomyTermsRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var taxonomyId:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var filter:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case taxonomyId
        case databaseIntegrationId
        case filter
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        taxonomyId = try container.decodeIfPresent(String.self, forKey: .taxonomyId)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        filter = try container.decodeIfPresent(String.self, forKey: .filter)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if taxonomyId != nil { try container.encode(taxonomyId, forKey: .taxonomyId) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if filter != nil { try container.encode(filter, forKey: .filter) }
    }
}

// @Route("/{version}/database/taxonomies/{TaxonomyId}/terms/{Id}", "GET")
// @DataContract
public class GetDatabaseTaxonomyTermRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = GetDatabaseTaxonomyTermResponse

    // @DataMember
    public var taxonomyId:String?

    // @DataMember
    public var id:String?

    // @DataMember
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case taxonomyId
        case id
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        taxonomyId = try container.decodeIfPresent(String.self, forKey: .taxonomyId)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if taxonomyId != nil { try container.encode(taxonomyId, forKey: .taxonomyId) }
        if id != nil { try container.encode(id, forKey: .id) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

// @Route("/{version}/database/taxonomies/{TaxonomyId}/terms", "POST")
// @DataContract
public class SaveDatabaseTaxonomyTermRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var taxonomyId:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var document:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case taxonomyId
        case databaseIntegrationId
        case document
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        taxonomyId = try container.decodeIfPresent(String.self, forKey: .taxonomyId)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        document = try container.decodeIfPresent(String.self, forKey: .document)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if taxonomyId != nil { try container.encode(taxonomyId, forKey: .taxonomyId) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if document != nil { try container.encode(document, forKey: .document) }
    }
}

// @Route("/{version}/database/taxonomies/{TaxonomyId}/terms/{Id}", "PUT")
// @DataContract
public class UpdateDatabaseTaxonomyTermRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var taxonomyId:String?

    // @DataMember
    public var id:String?

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var update:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case taxonomyId
        case id
        case databaseIntegrationId
        case update
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        taxonomyId = try container.decodeIfPresent(String.self, forKey: .taxonomyId)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        update = try container.decodeIfPresent(String.self, forKey: .update)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if taxonomyId != nil { try container.encode(taxonomyId, forKey: .taxonomyId) }
        if id != nil { try container.encode(id, forKey: .id) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if update != nil { try container.encode(update, forKey: .update) }
    }
}

// @Route("/{version}/database/schemas/{Id}", "DELETE")
public class DeleteDatabaseSchemaRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/database/schemas/{Id}/draft", "DELETE")
// @DataContract
public class DiscardDatabaseSchemaDraftRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/database/schemas/{id}", "GET")
// @DataContract
public class GetDatabaseSchema : CodeMashRequestBase, IReturn
{
    public typealias Return = GetDatabaseSchemaResponse

    // @DataMember
    public var id:String?

    // @DataMember(Name="version")
    // @ApiMember(DataType="integer", Name="version", ParameterType="query")
    public var version:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case version
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        version = try container.decodeIfPresent(Int.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if version != nil { try container.encode(version, forKey: .version) }
    }
}

// @Route("/{version}/database/schemas", "GET")
public class GetDatabaseSchemas : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetDatabaseSchemasResponse

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

// @Route("/{version}/database/schemas/{Id}/draft", "GET")
// @DataContract
public class GetDatabaseSchemaDraft : CodeMashRequestBase, IReturn
{
    public typealias Return = GetDatabaseSchemaDraftResponse

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

// @Route("/{version}/database/schemas/{Id}/versions/diff", "GET")
// @DataContract
public class GetDatabaseSchemaVersionDiff : CodeMashRequestBase, IReturn
{
    public typealias Return = GetDatabaseSchemaVersionDiffResponse

    // @DataMember
    public var id:String?

    // @DataMember
    public var fromVersion:Int?

    // @DataMember
    public var toVersion:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case fromVersion
        case toVersion
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        fromVersion = try container.decodeIfPresent(Int.self, forKey: .fromVersion)
        toVersion = try container.decodeIfPresent(Int.self, forKey: .toVersion)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if fromVersion != nil { try container.encode(fromVersion, forKey: .fromVersion) }
        if toVersion != nil { try container.encode(toVersion, forKey: .toVersion) }
    }
}

// @Route("/{version}/database/schemas/{Id}/versions", "GET")
// @DataContract
public class GetDatabaseSchemaVersions : CodeMashRequestBase, IReturn
{
    public typealias Return = GetDatabaseSchemaVersionsResponse

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

// @Route("/{version}/database/schemas/{Id}/publish", "POST")
// @DataContract
public class PublishDatabaseSchemaRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/database/schemas/{Id}/rename", "PUT")
// @DataContract
public class RenameDatabaseSchemaRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var id:String?

    // @DataMember
    public var title:String?

    // @DataMember
    public var renameUniqueName:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case title
        case renameUniqueName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        renameUniqueName = try container.decodeIfPresent(Bool.self, forKey: .renameUniqueName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if title != nil { try container.encode(title, forKey: .title) }
        if renameUniqueName != nil { try container.encode(renameUniqueName, forKey: .renameUniqueName) }
    }
}

// @Route("/{version}/database/schemas", "POST")
// @DataContract
public class SaveDatabaseSchemaRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var viewId:String?

    // @DataMember
    public var schemaName:String?

    // @DataMember
    public var dataSchema:String?

    // @DataMember
    public var visualSchema:String?

    // @DataMember
    public var settings:SchemaSettingsDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case viewId
        case schemaName
        case dataSchema
        case visualSchema
        case settings
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        viewId = try container.decodeIfPresent(String.self, forKey: .viewId)
        schemaName = try container.decodeIfPresent(String.self, forKey: .schemaName)
        dataSchema = try container.decodeIfPresent(String.self, forKey: .dataSchema)
        visualSchema = try container.decodeIfPresent(String.self, forKey: .visualSchema)
        settings = try container.decodeIfPresent(SchemaSettingsDto.self, forKey: .settings)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if viewId != nil { try container.encode(viewId, forKey: .viewId) }
        if schemaName != nil { try container.encode(schemaName, forKey: .schemaName) }
        if dataSchema != nil { try container.encode(dataSchema, forKey: .dataSchema) }
        if visualSchema != nil { try container.encode(visualSchema, forKey: .visualSchema) }
        if settings != nil { try container.encode(settings, forKey: .settings) }
    }
}

// @Route("/{version}/database/schemas/{Id}/draft", "PUT")
// @DataContract
public class UpdateDatabaseSchemaDraftRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var id:String?

    // @DataMember
    public var dataSchema:String?

    // @DataMember
    public var visualSchema:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case dataSchema
        case visualSchema
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        dataSchema = try container.decodeIfPresent(String.self, forKey: .dataSchema)
        visualSchema = try container.decodeIfPresent(String.self, forKey: .visualSchema)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if dataSchema != nil { try container.encode(dataSchema, forKey: .dataSchema) }
        if visualSchema != nil { try container.encode(visualSchema, forKey: .visualSchema) }
    }
}

// @Route("/{version}/database/schemas/{Id}/settings", "PUT")
// @DataContract
public class UpdateDatabaseSchemaSettingsRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var settings:SchemaSettingsDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case settings
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        settings = try container.decodeIfPresent(SchemaSettingsDto.self, forKey: .settings)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if settings != nil { try container.encode(settings, forKey: .settings) }
    }
}

// @Route("/{version}/database/integrations/{Id}", "DELETE")
public class DeleteDatabaseIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/database/integrations/{Id}/disable", "PUT")
public class DisableDatabaseIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/database/integrations/{Id}/enable", "PUT")
public class EnableDatabaseIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/database/integrations/{id}", "GET")
public class GetDatabaseIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = GetDatabaseIntegrationResponse

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

// @Route("/{version}/database/integrations", "GET")
public class GetDatabaseIntegrations : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetDatabaseIntegrationsResponse

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

// @Route("/{version}/database/integrations", "POST")
// @DataContract
public class SaveDatabaseIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var integration:DatabaseIntegrationRequest?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integration
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integration = try container.decodeIfPresent(DatabaseIntegrationRequest.self, forKey: .integration)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integration != nil { try container.encode(integration, forKey: .integration) }
    }
}

// @Route("/{version}/database/integrations/{Id}/default", "PUT")
public class SetDatabaseIntegrationAsDefaultRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/database/aggregates/{Id}", "DELETE")
// @DataContract
public class DeleteDatabaseAggregateRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var id:String?

    // @DataMember
    public var schemaId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case schemaId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        schemaId = try container.decodeIfPresent(String.self, forKey: .schemaId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if schemaId != nil { try container.encode(schemaId, forKey: .schemaId) }
    }
}

// @Route("/{version}/database/aggregates/{Id}", "GET")
public class GetDatabaseAggregate : CodeMashRequestBase, IReturn
{
    public typealias Return = GetDatabaseAggregateResponse

    public var id:String?
    public var schemaId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case schemaId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        schemaId = try container.decodeIfPresent(String.self, forKey: .schemaId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if schemaId != nil { try container.encode(schemaId, forKey: .schemaId) }
    }
}

// @Route("/{version}/database/aggregates", "GET")
public class GetDatabaseAggregates : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetDatabaseAggregatesResponse

    public var schemaId:String?
    public var pagingArgs:PagingArgs?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case schemaId
        case pagingArgs
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        schemaId = try container.decodeIfPresent(String.self, forKey: .schemaId)
        pagingArgs = try container.decodeIfPresent(PagingArgs.self, forKey: .pagingArgs)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if schemaId != nil { try container.encode(schemaId, forKey: .schemaId) }
        if pagingArgs != nil { try container.encode(pagingArgs, forKey: .pagingArgs) }
    }
}

// @Route("/{version}/database/aggregates", "POST")
// @DataContract
public class SaveDatabaseAggregateRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var viewId:String?

    // @DataMember
    public var schemaId:String?

    // @DataMember
    public var displayName:String?

    // @DataMember
    public var Description:String?

    // @DataMember
    public var pipeline:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case viewId
        case schemaId
        case displayName
        case Description
        case pipeline
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        viewId = try container.decodeIfPresent(String.self, forKey: .viewId)
        schemaId = try container.decodeIfPresent(String.self, forKey: .schemaId)
        displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
        Description = try container.decodeIfPresent(String.self, forKey: .Description)
        pipeline = try container.decodeIfPresent(String.self, forKey: .pipeline)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if viewId != nil { try container.encode(viewId, forKey: .viewId) }
        if schemaId != nil { try container.encode(schemaId, forKey: .schemaId) }
        if displayName != nil { try container.encode(displayName, forKey: .displayName) }
        if Description != nil { try container.encode(Description, forKey: .Description) }
        if pipeline != nil { try container.encode(pipeline, forKey: .pipeline) }
    }
}

// @Route("/{version}/database/aggregates/test", "POST")
// @DataContract
public class TestDatabaseAggregateRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = TestDatabaseAggregateResponse

    // @DataMember
    public var databaseIntegrationId:String?

    // @DataMember
    public var collectionName:String?

    // @DataMember
    public var pipeline:String?

    // @DataMember
    public var tokens:[String:String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case databaseIntegrationId
        case collectionName
        case pipeline
        case tokens
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        pipeline = try container.decodeIfPresent(String.self, forKey: .pipeline)
        tokens = try container.decodeIfPresent([String:String].self, forKey: .tokens) ?? [:]
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if collectionName != nil { try container.encode(collectionName, forKey: .collectionName) }
        if pipeline != nil { try container.encode(pipeline, forKey: .pipeline) }
        if tokens != nil { try container.encode(tokens, forKey: .tokens) }
    }
}

public class MongoDbAggregateCreated : Codable
{
    public var aggregate:MongoDbAggregate?

    required public init(){}
}

public class MongoDbAggregateUpdated : Codable
{
    public var aggregate:MongoDbAggregate?

    required public init(){}
}

public class MongoDbAggregateDeleted : Codable
{
    public var schemaId:SchemaId?
    public var id:MongoDbAggregateId?

    required public init(){}
}

public class DatabaseEstablished : Codable
{
    required public init(){}
}

public class DatabaseEnabled : Codable
{
    required public init(){}
}

public class DatabaseDisabled : Codable
{
    required public init(){}
}

public class DatabaseIntegrationSaved : Codable
{
    public var integration:DatabaseIntegration?

    required public init(){}
}

public class DatabaseIntegrationTested : Codable
{
    public var id:IntegrationId?
    public var succeeded:Bool?
    public var errorMessages:IReadOnlyList<String>?
    public var testedAtUtc:Date?

    required public init(){}
}

public class DatabaseIntegrationRenamed : Codable
{
    public var id:IntegrationId?
    public var name:DisplayName?

    required public init(){}
}

public class DatabaseIntegrationSetAsDefault : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class DatabaseIntegrationDeleted : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class DatabaseIntegrationEnabled : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class DatabaseIntegrationDisabled : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class SchemaCreated : Codable
{
    public var schema:Schema?

    required public init(){}
}

public class SchemaDraftUpdated : Codable
{
    public var id:SchemaId?
    public var draft:SchemaDraft?

    required public init(){}
}

public class SchemaDraftDiscarded : Codable
{
    public var id:SchemaId?

    required public init(){}
}

public class SchemaVersionPublished : Codable
{
    public var id:SchemaId?
    public var version:PublishedSchemaVersion?
    public var diff:SchemaDiff?

    required public init(){}
}

public class SchemaSettingsUpdated : Codable
{
    public var id:SchemaId?
    public var settings:SchemaSettings?

    required public init(){}
}

public class SchemaDeleted : Codable
{
    public var id:SchemaId?

    required public init(){}
}

public class SchemaRenamed : Codable
{
    public var schemaId:SchemaId?
    public var newName:SchemaName?
    public var renameUniqueName:Bool?

    required public init(){}
}

public class SchemaDataCleared : Codable
{
    public var id:SchemaId?
    public var integrations:[IntegrationId] = []

    required public init(){}
}

public class TaxonomyCreated : Codable
{
    public var taxonomy:Taxonomy?

    required public init(){}
}

public class TaxonomyUpdated : Codable
{
    public var taxonomy:Taxonomy?

    required public init(){}
}

public class TaxonomyDeleted : Codable
{
    public var taxonomyId:TaxonomyId?

    required public init(){}
}

public class TaxonomyDataCleared : Codable
{
    public var taxonomyId:TaxonomyId?
    public var integrations:[IntegrationId] = []

    required public init(){}
}

public class SchemaTriggerSaved : Codable
{
    public var trigger:SchemaTrigger?

    required public init(){}
}

public class SchemaTriggerEnabled : TriggerByIdEventBase
{
    public var schemaId:SchemaId?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case schemaId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        schemaId = try container.decodeIfPresent(SchemaId.self, forKey: .schemaId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if schemaId != nil { try container.encode(schemaId, forKey: .schemaId) }
    }
}

public class SchemaTriggerDisabled : TriggerByIdEventBase
{
    public var schemaId:SchemaId?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case schemaId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        schemaId = try container.decodeIfPresent(SchemaId.self, forKey: .schemaId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if schemaId != nil { try container.encode(schemaId, forKey: .schemaId) }
    }
}

public class SchemaTriggerDeleted : TriggerByIdEventBase
{
    public var schemaId:SchemaId?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case schemaId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        schemaId = try container.decodeIfPresent(SchemaId.self, forKey: .schemaId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if schemaId != nil { try container.encode(schemaId, forKey: .schemaId) }
    }
}

// @Route("/{version}/files/disable", "GET")
public class DisableFiles : CodeMashRequestBase, IReturn
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

// @Route("/{version}/files/enable", "GET")
public class EnableFiles : CodeMashRequestBase, IReturn
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

// @Route("/{version}/files/triggers/{triggerId}", "DELETE")
// @Route("/{version}/triggers", "DELETE")
// @DataContract
public class DeleteFilesTrigger : DeleteTrigger, IReturn
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

// @Route("/{version}/files/triggers/{triggerId}/disable", "PATCH")
// @Route("/{version}/triggers/disable", "PUT")
// @DataContract
public class DisableFilesTrigger : DisableTrigger, IReturn
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

// @Route("/{version}/files/triggers/{triggerId}/enable", "PATCH")
// @Route("/{version}/triggers/enable", "PUT")
// @DataContract
public class EnableFilesTrigger : EnableTrigger, IReturn
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
* Gets files trigger by specified Id
*/
// @Route("/{version}/files/triggers/{id}", "GET")
// @Api(Description="Gets files trigger by specified Id")
public class GetFilesTrigger : GetTrigger, IReturn
{
    public typealias Return = GetFilesTriggerResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

/**
* Gets files triggers
*/
// @Route("/{version}/files/triggers", "GET")
// @Api(Description="Gets files triggers")
public class GetFilesTriggers : GetTriggers, IReturn
{
    public typealias Return = GetFilesTriggersResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/files/triggers", "POST")
// @Route("/{version}/triggers", "POST")
// @DataContract
public class SaveFilesTrigger : SaveTrigger, IReturn
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

// @Route("/{version}/files/integrations/{Id}", "DELETE")
public class DeleteFilesIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/files/integrations/{Id}/disable", "PUT")
public class DisableFilesIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/files/integrations/{Id}/enable", "PUT")
public class EnableFilesIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/files/integrations/{id}", "GET")
public class GetFilesIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = GetFilesIntegrationResponse

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

// @Route("/{version}/files/integrations", "GET")
public class GetFilesIntegrations : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetFilesIntegrationsResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/files/integrations", "POST")
// @DataContract
public class SaveFilesIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var integration:FilesIntegrationRequest?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integration
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integration = try container.decodeIfPresent(FilesIntegrationRequest.self, forKey: .integration)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integration != nil { try container.encode(integration, forKey: .integration) }
    }
}

// @Route("/{version}/files/integrations/{Id}/default", "PUT")
public class SetFilesIntegrationAsDefaultRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/notifications/email/disable", "GET")
public class DisableEmail : CodeMashRequestBase, IReturn
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

// @Route("/{version}/notifications/email/enable", "GET")
public class EnableEmail : CodeMashRequestBase, IReturn
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

// @Route("/{version}/notifications/email/templates/attachments", "POST")
public class AttachFileToTemplateRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var language:String?
    public var templateId:String?
    public var fileRef:FileResourceRefDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case language
        case templateId
        case fileRef
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        language = try container.decodeIfPresent(String.self, forKey: .language)
        templateId = try container.decodeIfPresent(String.self, forKey: .templateId)
        fileRef = try container.decodeIfPresent(FileResourceRefDto.self, forKey: .fileRef)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if language != nil { try container.encode(language, forKey: .language) }
        if templateId != nil { try container.encode(templateId, forKey: .templateId) }
        if fileRef != nil { try container.encode(fileRef, forKey: .fileRef) }
    }
}

// @Route("/{version}/notifications/email/templates", "POST")
public class CreateEmailTemplateRequest : SaveEmailTemplate, IReturn
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

// @Route("/{version}/notifications/email/templates/{Id}", "DELETE")
public class DeleteEmailTemplateRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/notifications/email/templates/{id}", "GET")
public class GetEmailTemplate : CodeMashRequestBase, IReturn
{
    public typealias Return = GetEmailTemplateResponse

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

// @Route("/{version}/notifications/email/templates", "GET")
public class GetEmailTemplates : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetEmailTemplatesResponse

    public var showArchived:Bool?
    public var templateId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case showArchived
        case templateId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        showArchived = try container.decodeIfPresent(Bool.self, forKey: .showArchived)
        templateId = try container.decodeIfPresent(String.self, forKey: .templateId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if showArchived != nil { try container.encode(showArchived, forKey: .showArchived) }
        if templateId != nil { try container.encode(templateId, forKey: .templateId) }
    }
}

// @Route("/{version}/notifications/email/templates/mjml", "POST")
public class GetMjml : CodeMashRequestBase, IReturn
{
    public typealias Return = GetHtmlFromMjmlResponse

    public var code:String?
    public var tokens:[TokenMappingDto]?
    public var isForPreview:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case code
        case tokens
        case isForPreview
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decodeIfPresent(String.self, forKey: .code)
        tokens = try container.decodeIfPresent([TokenMappingDto].self, forKey: .tokens) ?? []
        isForPreview = try container.decodeIfPresent(Bool.self, forKey: .isForPreview)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if code != nil { try container.encode(code, forKey: .code) }
        if tokens != nil { try container.encode(tokens, forKey: .tokens) }
        if isForPreview != nil { try container.encode(isForPreview, forKey: .isForPreview) }
    }
}

// @Route("/{version}/notifications/email/system-templates/{id}", "GET")
public class GetSystemEmailTemplate : CodeMashRequestBase, IReturn
{
    public typealias Return = GetSystemEmailTemplateResponse

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

// @Route("/{version}/notifications/email/system-templates", "GET")
public class GetSystemEmailTemplates : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetSystemEmailTemplatesResponse

    public var groupTags:[String]?
    public var themes:[String]?
    public var communicationChannel:CommunicationChannel?
    public var forTrigger:TriggerType?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case groupTags
        case themes
        case communicationChannel
        case forTrigger
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        groupTags = try container.decodeIfPresent([String].self, forKey: .groupTags) ?? []
        themes = try container.decodeIfPresent([String].self, forKey: .themes) ?? []
        communicationChannel = try container.decodeIfPresent(CommunicationChannel.self, forKey: .communicationChannel)
        forTrigger = try container.decodeIfPresent(TriggerType.self, forKey: .forTrigger)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if groupTags != nil { try container.encode(groupTags, forKey: .groupTags) }
        if themes != nil { try container.encode(themes, forKey: .themes) }
        if communicationChannel != nil { try container.encode(communicationChannel, forKey: .communicationChannel) }
        if forTrigger != nil { try container.encode(forTrigger, forKey: .forTrigger) }
    }
}

// @Route("/{version}/notifications/email/templates/{id}/tokens", "GET")
public class GetEmailTemplateAvailableTokens : CodeMashRequestBase, IReturn
{
    public typealias Return = GetEmailTemplateAvailableTokensResponse

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

// @Route("/{version}/notifications/email/templates", "PUT")
public class UpdateEmailTemplateRequest : SaveEmailTemplate, IReturn
{
    public typealias Return = EmptyResponse

    public var viewId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case viewId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        viewId = try container.decodeIfPresent(String.self, forKey: .viewId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if viewId != nil { try container.encode(viewId, forKey: .viewId) }
    }
}

// @Route("/{version}/notifications/email/signatures/{id}", "DELETE")
public class DeleteEmailSignature : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/notifications/email/signatures/{id}", "GET")
public class GetEmailSignature : CodeMashRequestBase, IReturn
{
    public typealias Return = GetEmailSignatureResponse

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

// @Route("/{version}/notifications/email/signatures", "GET")
public class GetEmailSignatures : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetEmailSignaturesResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/notifications/email/signatures", "POST")
public class SaveEmailSignatureRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    public var viewId:String?
    public var displayName:String?
    public var translations:[TranslationDto] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case viewId
        case displayName
        case translations
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        viewId = try container.decodeIfPresent(String.self, forKey: .viewId)
        displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
        translations = try container.decodeIfPresent([TranslationDto].self, forKey: .translations) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if viewId != nil { try container.encode(viewId, forKey: .viewId) }
        if displayName != nil { try container.encode(displayName, forKey: .displayName) }
        if translations.count > 0 { try container.encode(translations, forKey: .translations) }
    }
}

// @Route("/{version}/notifications/email/settings", "GET")
public class GetEmailSettings : CodeMashRequestBase, IReturn
{
    public typealias Return = GetEmailSettingsResponse

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

// @Route("/{version}/notifications/email/integrations/confirm-human-delivery", "POST")
// @DataContract
public class ConfirmEmailIntegrationHumanDeliveryRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var integrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integrationId = try container.decodeIfPresent(String.self, forKey: .integrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integrationId != nil { try container.encode(integrationId, forKey: .integrationId) }
    }
}

// @Route("/{version}/notifications/email/integrations/{Id}", "DELETE")
public class DeleteEmailIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/notifications/email/integrations/{Id}/disable", "PUT")
public class DisableEmailIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/notifications/email/integrations/{Id}/enable", "PUT")
public class EnableEmailIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/notifications/email/integrations/{id}", "GET")
public class GetEmailIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = GetEmailIntegrationResponse

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

// @Route("/{version}/notifications/email/integrations", "GET")
public class GetEmailIntegrations : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetEmailIntegrationsResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/notifications/email/integrations", "POST")
// @DataContract
public class SaveEmailIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var integration:EmailIntegrationRequest?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integration
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integration = try container.decodeIfPresent(EmailIntegrationRequest.self, forKey: .integration)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integration != nil { try container.encode(integration, forKey: .integration) }
    }
}

// @Route("/{version}/notifications/email/integrations/{Id}/default", "PUT")
public class SetEmailsIntegrationAsDefault : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/notifications/email/integrations/test", "POST")
public class TestEmailIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = TestEmailIntegrationResponse

    public var integrationId:String?
    public var to:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integrationId
        case to
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integrationId = try container.decodeIfPresent(String.self, forKey: .integrationId)
        to = try container.decodeIfPresent(String.self, forKey: .to)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integrationId != nil { try container.encode(integrationId, forKey: .integrationId) }
        if to != nil { try container.encode(to, forKey: .to) }
    }
}

// @Route("/{version}/notifications/email/templates/{Id}/archive", "PUT")
public class ArchiveEmailTemplateRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/notifications/email/templates/{Id}/clone", "POST")
public class CloneEmailTemplateRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/notifications/email/templates/{Id}/unarchive", "PUT")
public class UnArchiveEmailTemplateRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/notifications/email/footers/{id}", "DELETE")
public class DeleteEmailFooter : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/notifications/email/footers/{id}", "GET")
public class GetEmailFooter : CodeMashRequestBase, IReturn
{
    public typealias Return = GetEmailFooterResponse

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

// @Route("/{version}/notifications/email/footers", "GET")
public class GetEmailFooters : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetEmailFootersResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/notifications/email/footers", "POST")
public class SaveEmailFooterRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    public var viewId:String?
    public var displayName:String?
    public var translations:[TranslationDto] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case viewId
        case displayName
        case translations
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        viewId = try container.decodeIfPresent(String.self, forKey: .viewId)
        displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
        translations = try container.decodeIfPresent([TranslationDto].self, forKey: .translations) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if viewId != nil { try container.encode(viewId, forKey: .viewId) }
        if displayName != nil { try container.encode(displayName, forKey: .displayName) }
        if translations.count > 0 { try container.encode(translations, forKey: .translations) }
    }
}

/**
* This endpoint implements the RFC 8058 one-click unsubscribe flow used by mailbox providers.
*/
// @Route("/{version}/email/one-click-unsubscribe", "POST")
// @Api(Description="This endpoint implements the RFC 8058 one-click unsubscribe flow used by mailbox providers.")
// @DataContract
public class OneClickUnsubscribeRequest : RequestBase, IReturn
{
    public typealias Return = EmptyResponse

    /**
    * Encrypted unsubscribe token. The campaign batcher embedded this value in the List-Unsubscribe header.
    */
    // @DataMember
    // @ApiMember(Description="Encrypted unsubscribe token. The campaign batcher embedded this value in the List-Unsubscribe header.", IsRequired=true, Name="token", ParameterType="query")
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
* Create email campaign
*/
// @Route("/{version}/notifications/email/campaigns", "POST")
// @Api(Description="Create email campaign")
// @DataContract
public class CreateEmailCampaignRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var campaign:EmailCampaignRequest?

    // @DataMember
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case campaign
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        campaign = try container.decodeIfPresent(EmailCampaignRequest.self, forKey: .campaign)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if campaign != nil { try container.encode(campaign, forKey: .campaign) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

/**
* Deletes emails campaign from queue
*/
// @Route("/{version}/notifications/email/campaigns/{Id}", "DELETE")
// @Api(Description="Deletes emails campaign from queue")
// @DataContract
public class DeleteEmailCampaignRequest : CodeMashRequestBase, IReturn
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

// @Route("/{version}/notifications/email/campaigns/{id}", "GET")
public class GetEmailCampaign : CodeMashRequestBase, IReturn
{
    public typealias Return = GetEmailCampaignResponse

    public var id:String?
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

// @Route("/{version}/notifications/email/campaigns", "GET")
public class GetEmailCampaigns : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetEmailCampaignsResponse

    public var databaseIntegrationId:String?
    public var campaignId:String?
    public var emailAddress:String?
    public var templateId:String?
    public var from:Int?
    public var to:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case databaseIntegrationId
        case campaignId
        case emailAddress
        case templateId
        case from
        case to
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        campaignId = try container.decodeIfPresent(String.self, forKey: .campaignId)
        emailAddress = try container.decodeIfPresent(String.self, forKey: .emailAddress)
        templateId = try container.decodeIfPresent(String.self, forKey: .templateId)
        from = try container.decodeIfPresent(Int.self, forKey: .from)
        to = try container.decodeIfPresent(Int.self, forKey: .to)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if campaignId != nil { try container.encode(campaignId, forKey: .campaignId) }
        if emailAddress != nil { try container.encode(emailAddress, forKey: .emailAddress) }
        if templateId != nil { try container.encode(templateId, forKey: .templateId) }
        if from != nil { try container.encode(from, forKey: .from) }
        if to != nil { try container.encode(to, forKey: .to) }
    }
}

// @Route("/{version}/notifications/email/campaigns/{id}/batches", "GET")
public class GetEmailCampaignBatches : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetEmailCampaignBatchesResponse

    public var id:String?
    public var databaseIntegrationId:String?
    public var batchId:String?
    public var emailAddress:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case databaseIntegrationId
        case batchId
        case emailAddress
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
        batchId = try container.decodeIfPresent(String.self, forKey: .batchId)
        emailAddress = try container.decodeIfPresent(String.self, forKey: .emailAddress)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
        if batchId != nil { try container.encode(batchId, forKey: .batchId) }
        if emailAddress != nil { try container.encode(emailAddress, forKey: .emailAddress) }
    }
}

// @Route("/{version}/notifications/email/campaigns/{id}/batches/{batchId}/{notificationId}", "GET")
public class GetEmailCampaignBatchNotification : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetEmailCampaignBatchNotificationResponse

    public var id:String?
    public var batchId:String?
    public var notificationId:String?
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case batchId
        case notificationId
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        batchId = try container.decodeIfPresent(String.self, forKey: .batchId)
        notificationId = try container.decodeIfPresent(String.self, forKey: .notificationId)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if batchId != nil { try container.encode(batchId, forKey: .batchId) }
        if notificationId != nil { try container.encode(notificationId, forKey: .notificationId) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

// @Route("/{version}/notifications/email/campaigns/{id}/batches/{batchId}", "GET")
public class GetEmailCampaignBatchNotifications : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetEmailCampaignBatchNotificationsResponse

    public var id:String?
    public var batchId:String?
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case id
        case batchId
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        batchId = try container.decodeIfPresent(String.self, forKey: .batchId)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if id != nil { try container.encode(id, forKey: .id) }
        if batchId != nil { try container.encode(batchId, forKey: .batchId) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

// @Route("/{version}/notifications/email/campaigns/{id}/stats", "GET")
public class GetEmailCampaignStatistics : CodeMashRequestBase, IReturn
{
    public typealias Return = GetEmailCampaignStatisticsResponse

    public var id:String?
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

// @Route("/{version}/notifications/email/preview", "GET")
public class PreviewEmailNotification : RequestBase, IReturn
{
    public typealias Return = PreviewEmailNotificationResponse

    public var hash:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case hash
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        hash = try container.decodeIfPresent(String.self, forKey: .hash)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if hash != nil { try container.encode(hash, forKey: .hash) }
    }
}

// @Route("/{version}/notifications/emails/campaigns/{campaignId}/messages/{id}", "GET")
public class GetEmailCampaignMessage : CodeMashRequestBase, IReturn
{
    public typealias Return = GetEmailCampaignMessageResponse

    public var campaignId:String?
    public var campaignBatchId:String?
    public var notificationId:String?
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case campaignId
        case campaignBatchId
        case notificationId
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        campaignId = try container.decodeIfPresent(String.self, forKey: .campaignId)
        campaignBatchId = try container.decodeIfPresent(String.self, forKey: .campaignBatchId)
        notificationId = try container.decodeIfPresent(String.self, forKey: .notificationId)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if campaignId != nil { try container.encode(campaignId, forKey: .campaignId) }
        if campaignBatchId != nil { try container.encode(campaignBatchId, forKey: .campaignBatchId) }
        if notificationId != nil { try container.encode(notificationId, forKey: .notificationId) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

// @Route("/{version}/notifications/emails/campaigns/{campaignId}/messages", "GET")
public class GetEmailCampaignMessagesRequest : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetEmailCampaignMessagesResponse

    public var campaignId:String?
    public var campaignBatchId:String?
    public var databaseIntegrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case campaignId
        case campaignBatchId
        case databaseIntegrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        campaignId = try container.decodeIfPresent(String.self, forKey: .campaignId)
        campaignBatchId = try container.decodeIfPresent(String.self, forKey: .campaignBatchId)
        databaseIntegrationId = try container.decodeIfPresent(String.self, forKey: .databaseIntegrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if campaignId != nil { try container.encode(campaignId, forKey: .campaignId) }
        if campaignBatchId != nil { try container.encode(campaignBatchId, forKey: .campaignBatchId) }
        if databaseIntegrationId != nil { try container.encode(databaseIntegrationId, forKey: .databaseIntegrationId) }
    }
}

public class EmailServiceEstablished : Codable
{
    required public init(){}
}

public class EmailServiceEnabled : Codable
{
    required public init(){}
}

public class EmailServiceDisabled : Codable
{
    required public init(){}
}

public class EmailFooterSaved : Codable
{
    public var id:EmailFooterId?
    public var name:DisplayName?
    public var translations:[MessageTranslation<TemplateCode>] = []

    required public init(){}
}

public class EmailFooterDeleted : Codable
{
    public var id:EmailFooterId?

    required public init(){}
}

public class EmailIntegrationSaved : Codable
{
    public var integration:EmailIntegration?

    required public init(){}
}

public class EmailIntegrationTested : Codable
{
    public var id:IntegrationId?
    public var succeeded:Bool?
    public var errorMessages:IReadOnlyList<String>?
    public var testedAtUtc:Date?

    required public init(){}
}

public class EmailIntegrationHumanDeliveryConfirmed : Codable
{
    public var id:IntegrationId?
    public var confirmedAtUtc:Date?

    required public init(){}
}

public class EmailIntegrationRenamed : Codable
{
    public var id:IntegrationId?
    public var name:DisplayName?

    required public init(){}
}

public class EmailIntegrationSetAsDefault : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class EmailIntegrationDeleted : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class EmailIntegrationEnabled : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class EmailIntegrationDisabled : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class EmailSignatureSaved : Codable
{
    public var id:EmailSignatureId?
    public var name:DisplayName?
    public var translations:[MessageTranslation<TemplateCode>] = []

    required public init(){}
}

public class EmailSignatureDeleted : Codable
{
    public var id:EmailSignatureId?

    required public init(){}
}

public class EmailTemplateCreated : Codable
{
    public var templateId:TemplateId?
    public var displayName:DisplayName?
    public var translations:[MessageTranslation<EmailMessageContent>] = []
    public var channel:CommunicationChannel?
    public var Description:String?
    public var tags:[Tag]?
    public var languageAgnosticAttachments:[FileResourceRef]?

    required public init(){}
}

public class EmailTemplateUpdated : Codable
{
    public var templateId:TemplateId?
    public var displayName:DisplayName?
    public var translations:[MessageTranslation<EmailMessageContent>] = []
    public var channel:CommunicationChannel?
    public var Description:String?
    public var tags:[Tag]?
    public var languageAgnosticAttachments:[FileResourceRef]?
    public var attachmentsToBeDeleted:[FileResourceRef]?

    required public init(){}
}

public class EmailTemplateDeleted : Codable
{
    public var templateId:TemplateId?
    public var filesToBeDeleted:[FileResourceRef]?
    public var fileIntegrationId:IntegrationId?

    required public init(){}
}

public class EmailTemplateArchived : Codable
{
    public var templateId:TemplateId?

    required public init(){}
}

public class EmailTemplateUnArchived : Codable
{
    public var templateId:TemplateId?

    required public init(){}
}

public class CodeIntegrationSaved : Codable
{
    public var integration:CodeIntegration?

    required public init(){}
}

public class CodeIntegrationTested : Codable
{
    public var id:IntegrationId?
    public var succeeded:Bool?
    public var errorMessages:IReadOnlyList<String>?
    public var testedAtUtc:Date?

    required public init(){}
}

public class CodeIntegrationHumanDeliveryConfirmed : Codable
{
    public var id:IntegrationId?
    public var confirmedAtUtc:Date?

    required public init(){}
}

public class CodeIntegrationRenamed : Codable
{
    public var id:IntegrationId?
    public var name:DisplayName?

    required public init(){}
}

public class CodeIntegrationSetAsDefault : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class CodeIntegrationDeleted : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class CodeIntegrationEnabled : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class CodeIntegrationDisabled : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class MarketplaceIntegrationSaved : Codable
{
    public var integration:MarketplaceIntegration?

    required public init(){}
}

public class MarketplaceIntegrationDeleted : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class MarketplaceIntegrationEnabled : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class MarketplaceIntegrationDisabled : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class MarketplaceIntegrationSecretsConfigured : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class MarketplaceIntegrationSecretsConfigurationFailed : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class MarketplaceFunctionBindingSaved : Codable
{
    public var binding:MarketplaceFunctionBinding?

    required public init(){}
}

public class MarketplaceFunctionBindingDeleted : Codable
{
    public var integrationId:IntegrationId?
    public var bindingId:String?

    required public init(){}
}

public class MarketplaceFunctionBindingEnabled : Codable
{
    public var integrationId:IntegrationId?
    public var bindingId:String?

    required public init(){}
}

public class MarketplaceFunctionBindingDisabled : Codable
{
    public var integrationId:IntegrationId?
    public var bindingId:String?

    required public init(){}
}

// @Route("/{version}/notifications/push/disable", "GET")
public class DisablePush : CodeMashRequestBase, IReturn
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

// @Route("/{version}/notifications/push/enable", "GET")
public class EnablePush : CodeMashRequestBase, IReturn
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

// @Route("/{version}/notifications/push/templates/{Id}/archive", "PUT")
public class ArchivePushTemplateRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/notifications/push/templates/{Id}/clone", "POST")
public class ClonePushTemplateRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/notifications/push/templates", "POST")
public class CreatePushTemplateRequest : SavePushTemplate, IReturn
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

// @Route("/{version}/notifications/push/templates/{Id}", "DELETE")
public class DeletePushTemplateRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/notifications/push/templates/{id}", "GET")
public class GetPushTemplate : CodeMashRequestBase, IReturn
{
    public typealias Return = GetPushTemplateResponse

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

// @Route("/{version}/notifications/push/templates", "GET")
public class GetPushTemplates : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetPushTemplatesResponse

    public var showArchived:Bool?
    public var templateId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case showArchived
        case templateId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        showArchived = try container.decodeIfPresent(Bool.self, forKey: .showArchived)
        templateId = try container.decodeIfPresent(String.self, forKey: .templateId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if showArchived != nil { try container.encode(showArchived, forKey: .showArchived) }
        if templateId != nil { try container.encode(templateId, forKey: .templateId) }
    }
}

// @Route("/{version}/notifications/push/templates/{id}/tokens", "GET")
public class GetPushMessageContentTokens : CodeMashRequestBase, IReturn
{
    public typealias Return = GetPushMessageContentTokensResponse

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

// @Route("/{version}/notifications/push/templates/{Id}/unarchive", "PUT")
public class UnArchivePushTemplateRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/notifications/push/templates", "PUT")
public class UpdatePushTemplateRequest : SavePushTemplate, IReturn
{
    public typealias Return = EmptyResponse

    public var viewId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case viewId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        viewId = try container.decodeIfPresent(String.self, forKey: .viewId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if viewId != nil { try container.encode(viewId, forKey: .viewId) }
    }
}

// @Route("/{version}/notifications/push/integrations/confirm-human-delivery", "POST")
// @DataContract
public class ConfirmPushIntegrationHumanDeliveryRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var integrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integrationId = try container.decodeIfPresent(String.self, forKey: .integrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integrationId != nil { try container.encode(integrationId, forKey: .integrationId) }
    }
}

// @Route("/{version}/notifications/push/integrations/{Id}", "DELETE")
public class DeletePushIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/notifications/push/integrations/{Id}/disable", "PUT")
public class DisablePushIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/notifications/push/integrations/{Id}/enable", "PUT")
public class EnablePushIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/notifications/push/integrations/{id}", "GET")
public class GetPushIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = GetPushIntegrationResponse

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

// @Route("/{version}/notifications/push/integrations", "GET")
public class GetPushIntegrations : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetPushIntegrationsResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/notifications/push/integrations", "POST")
// @DataContract
public class SavePushIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var integration:PushIntegrationRequest?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integration
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integration = try container.decodeIfPresent(PushIntegrationRequest.self, forKey: .integration)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integration != nil { try container.encode(integration, forKey: .integration) }
    }
}

// @Route("/{version}/notifications/push/integrations/{Id}/default", "PUT")
public class SetPushIntegrationAsDefaultRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/notifications/push/integrations/test", "POST")
public class TestPushIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = TestEmailIntegrationResponse

    // @DataMember
    public var integrationId:String?

    // @DataMember
    public var testToken:String?

    // @DataMember
    public var deliveryFamily:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integrationId
        case testToken
        case deliveryFamily
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integrationId = try container.decodeIfPresent(String.self, forKey: .integrationId)
        testToken = try container.decodeIfPresent(String.self, forKey: .testToken)
        deliveryFamily = try container.decodeIfPresent(String.self, forKey: .deliveryFamily)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integrationId != nil { try container.encode(integrationId, forKey: .integrationId) }
        if testToken != nil { try container.encode(testToken, forKey: .testToken) }
        if deliveryFamily != nil { try container.encode(deliveryFamily, forKey: .deliveryFamily) }
    }
}

// @Route("/{version}/notifications/push/integrations/app/request", "POST")
public class RegisterCodeMashAppPushIntegration : CodeMashRequestBase, IReturn, IHasAccountId
{
    public typealias Return = EmptyResponse

    public var accountId:String?
    public var userId:String?
    public var requestId:String?
    public var pin:Int?
    public var validTill:Date?
    public var publicKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case accountId
        case userId
        case requestId
        case pin
        case validTill
        case publicKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
        userId = try container.decodeIfPresent(String.self, forKey: .userId)
        requestId = try container.decodeIfPresent(String.self, forKey: .requestId)
        pin = try container.decodeIfPresent(Int.self, forKey: .pin)
        validTill = try container.decodeIfPresent(Date.self, forKey: .validTill)
        publicKey = try container.decodeIfPresent(String.self, forKey: .publicKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if accountId != nil { try container.encode(accountId, forKey: .accountId) }
        if userId != nil { try container.encode(userId, forKey: .userId) }
        if requestId != nil { try container.encode(requestId, forKey: .requestId) }
        if pin != nil { try container.encode(pin, forKey: .pin) }
        if validTill != nil { try container.encode(validTill, forKey: .validTill) }
        if publicKey != nil { try container.encode(publicKey, forKey: .publicKey) }
    }
}

// @Route("/{version}/notifications/push/devices", "POST")
// @DataContract
public class RegisterDevice : RequestBase, IReturn, IHasProjectId
{
    public typealias Return = IdResponse

    // @DataMember
    public var pushDeviceDto:PushDeviceDto?

    // @DataMember
    public var userId:String?

    // @DataMember
    public var projectId:String?

    // @DataMember
    public var accountId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case pushDeviceDto
        case userId
        case projectId
        case accountId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        pushDeviceDto = try container.decodeIfPresent(PushDeviceDto.self, forKey: .pushDeviceDto)
        userId = try container.decodeIfPresent(String.self, forKey: .userId)
        projectId = try container.decodeIfPresent(String.self, forKey: .projectId)
        accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if pushDeviceDto != nil { try container.encode(pushDeviceDto, forKey: .pushDeviceDto) }
        if userId != nil { try container.encode(userId, forKey: .userId) }
        if projectId != nil { try container.encode(projectId, forKey: .projectId) }
        if accountId != nil { try container.encode(accountId, forKey: .accountId) }
    }
}

public class PushIntegrationSaved : Codable
{
    public var integration:PushIntegration?

    required public init(){}
}

public class PushIntegrationTested : Codable
{
    public var id:IntegrationId?
    public var succeeded:Bool?
    public var errorMessages:IReadOnlyList<String>?
    public var testedAtUtc:Date?

    required public init(){}
}

public class PushIntegrationHumanDeliveryConfirmed : Codable
{
    public var id:IntegrationId?
    public var confirmedAtUtc:Date?

    required public init(){}
}

public class PushIntegrationRenamed : Codable
{
    public var id:IntegrationId?
    public var name:DisplayName?

    required public init(){}
}

public class PushIntegrationSetAsDefault : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class PushIntegrationDeleted : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class PushIntegrationEnabled : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class PushIntegrationDisabled : Codable
{
    public var id:IntegrationId?

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

public class PushModuleTagSaved : Codable
{
    public var tag:TagDefinition?
    public var communicationChannel:CommunicationChannel?

    required public init(){}
}

public class PushModuleTagDeleted : Codable
{
    public var tag:Tag?
    public var communicationChannel:CommunicationChannel?

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

    required public init(){}
}

public class PushTemplateDeleted : Codable
{
    public var templateId:TemplateId?

    required public init(){}
}

public class PushTemplateArchived : Codable
{
    public var templateId:TemplateId?

    required public init(){}
}

public class PushTemplateUnArchived : Codable
{
    public var templateId:TemplateId?

    required public init(){}
}

// @Route("/{version}/payments/disable", "GET")
public class DisablePayments : CodeMashRequestBase, IReturn
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

// @Route("/{version}/payments/enable", "GET")
public class EnablePayments : CodeMashRequestBase, IReturn
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

// @Route("/{version}/payments/triggers/{triggerId}", "DELETE")
// @Route("/{version}/triggers", "DELETE")
// @DataContract
public class DeletePaymentsTrigger : DeleteTrigger, IReturn
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

// @Route("/{version}/payments/triggers/{triggerId}/disable", "PATCH")
// @Route("/{version}/triggers/disable", "PUT")
// @DataContract
public class DisablePaymentsTrigger : DisableTrigger, IReturn
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

// @Route("/{version}/payments/triggers/{triggerId}/enable", "PATCH")
// @Route("/{version}/triggers/enable", "PUT")
// @DataContract
public class EnablePaymentsTrigger : EnableTrigger, IReturn
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
* Gets payments trigger by specified Id
*/
// @Route("/{version}/payments/triggers/{id}", "GET")
// @Api(Description="Gets payments trigger by specified Id")
public class GetPaymentsTrigger : GetTrigger, IReturn
{
    public typealias Return = GetPaymentsTriggerResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

/**
* Gets payments triggers
*/
// @Route("/{version}/payments/triggers", "GET")
// @Api(Description="Gets payments triggers")
public class GetPaymentsTriggers : GetTriggers, IReturn
{
    public typealias Return = GetPaymentsTriggersResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/payments/triggers", "POST")
// @Route("/{version}/triggers", "POST")
// @DataContract
public class SavePaymentsTrigger : SaveTrigger, IReturn
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

// @Route("/{version}/payments/integrations/confirm-human-delivery", "POST")
// @DataContract
public class ConfirmPaymentsIntegrationHumanDeliveryRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    // @DataMember
    public var integrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integrationId = try container.decodeIfPresent(String.self, forKey: .integrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integrationId != nil { try container.encode(integrationId, forKey: .integrationId) }
    }
}

// @Route("/{version}/payments/integrations/{Id}", "DELETE")
public class DeletePaymentsIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/payments/integrations/{Id}/disable", "PUT")
public class DisablePaymentsIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/payments/integrations/{Id}/enable", "PUT")
public class EnablePaymentsIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/payments/integrations/{id}", "GET")
public class GetPaymentsIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = GetPaymentsIntegrationResponse

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

// @Route("/{version}/payments/integrations", "GET")
public class GetPaymentsIntegrations : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetPaymentsIntegrationsResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/payments/integrations", "POST")
// @DataContract
public class SavePaymentsIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var integration:PaymentIntegrationRequest?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integration
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integration = try container.decodeIfPresent(PaymentIntegrationRequest.self, forKey: .integration)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integration != nil { try container.encode(integration, forKey: .integration) }
    }
}

// @Route("/{version}/payments/integrations/test", "POST")
public class TestPaymentsIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = TestPaymentsIntegrationResponse

    public var integrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integrationId = try container.decodeIfPresent(String.self, forKey: .integrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integrationId != nil { try container.encode(integrationId, forKey: .integrationId) }
    }
}

// @Route("/{version}/logs/disable", "GET")
public class DisableLogging : CodeMashRequestBase, IReturn
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

// @Route("/{version}/logs/enable", "GET")
public class EnableLogging : CodeMashRequestBase, IReturn
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

// @Route("/{version}/logs/integrations/{Id}", "DELETE")
public class DeleteLoggingIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/logs/integrations/{Id}/disable", "PUT")
public class DisableLoggingIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/logs/integrations/{Id}/enable", "PUT")
public class EnableLoggingIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/logs/integrations/{id}", "GET")
public class GetLoggingIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = GetLoggingIntegrationResponse

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

// @Route("/{version}/logs/integrations", "GET")
public class GetLoggingIntegrations : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetLoggingIntegrationsResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/logs/integrations", "POST")
// @DataContract
public class SaveLoggingIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var integration:LoggingIntegrationRequest?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integration
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integration = try container.decodeIfPresent(LoggingIntegrationRequest.self, forKey: .integration)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integration != nil { try container.encode(integration, forKey: .integration) }
    }
}

// @Route("/{version}/logs/integrations/test", "POST")
public class TestLoggingIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = TestLoggingIntegrationResponse

    public var integrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integrationId = try container.decodeIfPresent(String.self, forKey: .integrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integrationId != nil { try container.encode(integrationId, forKey: .integrationId) }
    }
}

public class LoggingIntegrationSaved : Codable
{
    public var integration:LoggingIntegration?

    required public init(){}
}

public class LoggingIntegrationTested : Codable
{
    public var id:IntegrationId?
    public var succeeded:Bool?
    public var errorMessages:IReadOnlyList<String>?
    public var testedAtUtc:Date?

    required public init(){}
}

public class LoggingIntegrationRenamed : Codable
{
    public var id:IntegrationId?
    public var name:DisplayName?

    required public init(){}
}

public class LoggingIntegrationDeleted : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class LoggingIntegrationEnabled : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class LoggingIntegrationDisabled : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class LoggingEstablished : Codable
{
    required public init(){}
}

public class LoggingEnabled : Codable
{
    required public init(){}
}

public class LoggingDisabled : Codable
{
    required public init(){}
}

/**
* Gets account info.
*/
// @Route("/{version}/account/chat/complete", "POST")
// @Api(Description="Gets account info.")
public class AskChatRequest : RequestBase, IReturn
{
    public typealias Return = AskChatResponse

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

// @Route("/{version}/ai/integrations/llms/{Id}", "DELETE")
public class DeleteLlmIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/ai/integrations/llms/{Id}/disable", "PUT")
public class DisableLlmIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/ai/integrations/llms/{Id}/enable", "PUT")
public class EnableLlmIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/ai/integrations/llms/{id}", "GET")
public class GetLlmIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = GetLlmIntegrationResponse

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

// @Route("/{version}/ai/integrations/llms/integrations", "GET")
public class GetLlmIntegrations : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetLlmIntegrationsResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/ai/integrations/llms/", "POST")
// @DataContract
public class SaveLlmIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var integration:LlmIntegrationRequest?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integration
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integration = try container.decodeIfPresent(LlmIntegrationRequest.self, forKey: .integration)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integration != nil { try container.encode(integration, forKey: .integration) }
    }
}

// @Route("/{version}/ai/integrations/llms/test", "POST")
public class TestLlmIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = TestLlmIntegrationResponse

    public var integrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integrationId = try container.decodeIfPresent(String.self, forKey: .integrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integrationId != nil { try container.encode(integrationId, forKey: .integrationId) }
    }
}

// @Route("/{version}/ai/integrations/mcp/{Id}", "DELETE")
public class DeleteMcpIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/ai/integrations/mcp/{Id}/disable", "PUT")
public class DisableMcpIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/ai/integrations/mcp/{Id}/enable", "PUT")
public class EnableMcpIntegrationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/ai/integrations/mcp/{id}", "GET")
public class GetMcpIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = GetMcpIntegrationResponse

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

// @Route("/{version}/ai/integrations/mcp/integrations", "GET")
public class GetMcpIntegrations : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetMcpIntegrationsResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/ai/integrations/mcp/", "POST")
// @DataContract
public class SaveMcpIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var integration:McpIntegrationRequest?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integration
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integration = try container.decodeIfPresent(McpIntegrationRequest.self, forKey: .integration)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integration != nil { try container.encode(integration, forKey: .integration) }
    }
}

// @Route("/{version}/ai/integrations/mcp/test", "POST")
public class TestMcpIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = TestLlmIntegrationResponse

    public var integrationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integrationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integrationId = try container.decodeIfPresent(String.self, forKey: .integrationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integrationId != nil { try container.encode(integrationId, forKey: .integrationId) }
    }
}

public class WebhookIntegrationSaved : Codable
{
    public var integration:WebhookIntegration?

    required public init(){}
}

public class WebhookIntegrationExtraHeadersChanged : Codable
{
    public var id:IntegrationId?
    public var extraHeaders:IReadOnlyDictionary<String, String>?

    required public init(){}
}

public class WebhookIntegrationSecretsConfigured : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class WebhookIntegrationSecretsConfigurationFailed : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class WebhookIntegrationSecretsCleared : Codable
{
    public var id:IntegrationId?

    required public init(){}
}

public class WebhookDestinationSaved : Codable
{
    public var integrationId:IntegrationId?
    public var destination:WebhookDestination?

    required public init(){}
}

public class WebhookDestinationRemoved : Codable
{
    public var integrationId:IntegrationId?
    public var destinationId:WebhookDestinationId?

    required public init(){}
}

public class WebhookDestinationEnabled : Codable
{
    public var integrationId:IntegrationId?
    public var destinationId:WebhookDestinationId?

    required public init(){}
}

public class WebhookDestinationDisabled : Codable
{
    public var integrationId:IntegrationId?
    public var destinationId:WebhookDestinationId?

    required public init(){}
}

// @Route("/{version}/webhooks/integration", "GET")
public class GetWebhookIntegration : CodeMashRequestBase, IReturn
{
    public typealias Return = GetWebhookIntegrationResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/webhooks/integration/secret", "GET")
public class RevealWebhookIntegrationSecretRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = RevealWebhookIntegrationSecretResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/webhooks/integration/secret/rotate", "POST")
public class RotateWebhookIntegrationSecretRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = RotateWebhookIntegrationSecretResponse

    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

// @Route("/{version}/webhooks/integration/extra-headers", "PUT")
public class UpdateWebhookIntegrationExtraHeadersRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var extraHeaders:[String:String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case extraHeaders
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        extraHeaders = try container.decodeIfPresent([String:String].self, forKey: .extraHeaders) ?? [:]
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if extraHeaders != nil { try container.encode(extraHeaders, forKey: .extraHeaders) }
    }
}

// @Route("/{version}/webhooks/destinations/{DestinationId}/disable", "PUT")
public class DisableWebhookDestinationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var destinationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case destinationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        destinationId = try container.decodeIfPresent(String.self, forKey: .destinationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if destinationId != nil { try container.encode(destinationId, forKey: .destinationId) }
    }
}

// @Route("/{version}/webhooks/destinations/{DestinationId}/enable", "PUT")
public class EnableWebhookDestinationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var destinationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case destinationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        destinationId = try container.decodeIfPresent(String.self, forKey: .destinationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if destinationId != nil { try container.encode(destinationId, forKey: .destinationId) }
    }
}

// @Route("/{version}/webhooks/destinations/{DestinationId}", "DELETE")
public class RemoveWebhookDestinationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

    public var destinationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case destinationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        destinationId = try container.decodeIfPresent(String.self, forKey: .destinationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if destinationId != nil { try container.encode(destinationId, forKey: .destinationId) }
    }
}

// @Route("/{version}/webhooks/destinations", "POST")
public class SaveWebhookDestinationRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = SaveWebhookDestinationResponse

    public var destinationId:String?
    public var destinationName:String?
    public var endpointUrl:String?
    public var selectedEvents:[String] = []
    public var extraHeaders:[String:String]?
    public var isEnabled:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case destinationId
        case destinationName
        case endpointUrl
        case selectedEvents
        case extraHeaders
        case isEnabled
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        destinationId = try container.decodeIfPresent(String.self, forKey: .destinationId)
        destinationName = try container.decodeIfPresent(String.self, forKey: .destinationName)
        endpointUrl = try container.decodeIfPresent(String.self, forKey: .endpointUrl)
        selectedEvents = try container.decodeIfPresent([String].self, forKey: .selectedEvents) ?? []
        extraHeaders = try container.decodeIfPresent([String:String].self, forKey: .extraHeaders) ?? [:]
        isEnabled = try container.decodeIfPresent(Bool.self, forKey: .isEnabled)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if destinationId != nil { try container.encode(destinationId, forKey: .destinationId) }
        if destinationName != nil { try container.encode(destinationName, forKey: .destinationName) }
        if endpointUrl != nil { try container.encode(endpointUrl, forKey: .endpointUrl) }
        if selectedEvents.count > 0 { try container.encode(selectedEvents, forKey: .selectedEvents) }
        if extraHeaders != nil { try container.encode(extraHeaders, forKey: .extraHeaders) }
        if isEnabled != nil { try container.encode(isEnabled, forKey: .isEnabled) }
    }
}

// @Route("/{version}/scheduler/disable", "GET")
public class DisableScheduler : CodeMashRequestBase, IReturn
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

// @Route("/{version}/scheduler/enable", "GET")
public class EnableScheduler : CodeMashRequestBase, IReturn
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

// @Route("/{version}/scheduler/tasks/{Id}", "DELETE")
public class DeleteSchedulerTask : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/scheduler/tasks/{Id}/disable", "PUT")
public class DisableSchedulerTask : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/scheduler/tasks/{Id}/enable", "PUT")
public class EnableSchedulerTask : CodeMashRequestBase, IReturn
{
    public typealias Return = EmptyResponse

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

// @Route("/{version}/scheduler/tasks/{id}", "GET")
public class GetSchedulerTask : CodeMashRequestBase, IReturn
{
    public typealias Return = GetSchedulerTaskResponse

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

// @Route("/{version}/scheduler/tasks", "GET")
public class GetSchedulerTasks : CodeMashListPaginationRequestBase, IReturn
{
    public typealias Return = GetSchedulerTasksResponse

    public var type:SchedulerTaskType?
    public var enabled:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case type
        case enabled
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(SchedulerTaskType.self, forKey: .type)
        enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if type != nil { try container.encode(type, forKey: .type) }
        if enabled != nil { try container.encode(enabled, forKey: .enabled) }
    }
}

/**
* Save scheduled task
*/
// @Route("/{version}/scheduler/tasks", "POST")
// @Api(Description="Save scheduled task")
// @DataContract
public class SaveSchedulerTaskRequest : CodeMashRequestBase, IReturn
{
    public typealias Return = IdResponse

    // @DataMember
    public var taskId:String?

    // @DataMember
    public var name:String?

    // @DataMember
    public var Description:String?

    // @DataMember
    public var cron:String?

    // @DataMember
    public var initiatorUserId:String?

    // @DataMember
    public var isEnabled:Bool?

    // @DataMember
    public var stopOnError:Bool?

    // @DataMember
    public var task:SchedulerTaskRequest?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case taskId
        case name
        case Description
        case cron
        case initiatorUserId
        case isEnabled
        case stopOnError
        case task
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        taskId = try container.decodeIfPresent(String.self, forKey: .taskId)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        Description = try container.decodeIfPresent(String.self, forKey: .Description)
        cron = try container.decodeIfPresent(String.self, forKey: .cron)
        initiatorUserId = try container.decodeIfPresent(String.self, forKey: .initiatorUserId)
        isEnabled = try container.decodeIfPresent(Bool.self, forKey: .isEnabled)
        stopOnError = try container.decodeIfPresent(Bool.self, forKey: .stopOnError)
        task = try container.decodeIfPresent(SchedulerTaskRequest.self, forKey: .task)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if taskId != nil { try container.encode(taskId, forKey: .taskId) }
        if name != nil { try container.encode(name, forKey: .name) }
        if Description != nil { try container.encode(Description, forKey: .Description) }
        if cron != nil { try container.encode(cron, forKey: .cron) }
        if initiatorUserId != nil { try container.encode(initiatorUserId, forKey: .initiatorUserId) }
        if isEnabled != nil { try container.encode(isEnabled, forKey: .isEnabled) }
        if stopOnError != nil { try container.encode(stopOnError, forKey: .stopOnError) }
        if task != nil { try container.encode(task, forKey: .task) }
    }
}

public class SchedulerEnabled : Codable
{
    required public init(){}
}

public class SchedulerDisabled : Codable
{
    required public init(){}
}

public class SchedulerTaskSaved : Codable
{
    public var task:SchedulerTask?

    required public init(){}
}

public class SchedulerTaskEnabled : Codable
{
    public var taskId:TaskId?

    required public init(){}
}

public class SchedulerTaskDisabled : Codable
{
    public var taskId:TaskId?

    required public init(){}
}

public class SchedulerTaskDeleted : Codable
{
    public var taskId:TaskId?

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

public class GetAccountProfileResponse : ResponseBase
{
    public var item:AccountOwnerDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(AccountOwnerDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetAccountStatusResponse : ResponseBase
{
    public var item:AccountStatusDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(AccountStatusDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

// @DataContract
public class CreateStripeCheckoutSessionResponse : IdResponse
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
public class GetStripeBillingPortalUrlResponse : IdResponse
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
public class CreateTeamMemberFromInvitationResponse : IdResponse
{
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

public class GetProjectResponse : ResponseBase
{
    public var item:ProjectDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(ProjectDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetProjectsResponse : ResponseBase
{
    public var list:[ProjectListItemDto]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent([ProjectListItemDto].self, forKey: .list) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetAccountRegionsResponse : ResponseBase
{
    public var items:[ProjectRegionDto]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case items
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decodeIfPresent([ProjectRegionDto].self, forKey: .items) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if items != nil { try container.encode(items, forKey: .items) }
    }
}

public class GetProjectTokensResponse : ResponseBase
{
    public var tokens:[TokenMappingDto]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case tokens
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tokens = try container.decodeIfPresent([TokenMappingDto].self, forKey: .tokens) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if tokens != nil { try container.encode(tokens, forKey: .tokens) }
    }
}

// @DataContract
public class CreateAccountResponse : IdResponse
{
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

public class GetAccountCollaboratorsResponse : ResponseBase
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

public class GetLicensesResponse : ResponseBase
{
    public var list:[LicenseDto]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent([LicenseDto].self, forKey: .list) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetUserEmailPreferencesResponse : ResponseBase
{
    public var defaultLanguage:String?
    public var projectLanguages:[String] = []
    public var blockAllMarketingMessages:Bool?
    public var subscribedTags:[DeliveryChannel:HashSet<String>]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case defaultLanguage
        case projectLanguages
        case blockAllMarketingMessages
        case subscribedTags
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        defaultLanguage = try container.decodeIfPresent(String.self, forKey: .defaultLanguage)
        projectLanguages = try container.decodeIfPresent([String].self, forKey: .projectLanguages) ?? []
        blockAllMarketingMessages = try container.decodeIfPresent(Bool.self, forKey: .blockAllMarketingMessages)
        subscribedTags = try container.decodeIfPresent([DeliveryChannel:HashSet<String>].self, forKey: .subscribedTags) ?? [:]
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if defaultLanguage != nil { try container.encode(defaultLanguage, forKey: .defaultLanguage) }
        if projectLanguages.count > 0 { try container.encode(projectLanguages, forKey: .projectLanguages) }
        if blockAllMarketingMessages != nil { try container.encode(blockAllMarketingMessages, forKey: .blockAllMarketingMessages) }
        if subscribedTags != nil { try container.encode(subscribedTags, forKey: .subscribedTags) }
    }
}

public class GetMembershipTriggerResponse : GetTriggerResponse
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
public class GetMembershipTriggersResponse : GetTriggersResponse
{
    // @DataMember
    public var list:PaginatedResponse<MembershipTriggerProjectionList>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<MembershipTriggerProjectionList>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetRoleResponse : ResponseBase
{
    public var role:RoleItemDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case role
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        role = try container.decodeIfPresent(RoleItemDto.self, forKey: .role)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if role != nil { try container.encode(role, forKey: .role) }
    }
}

public class GetRolesResponse : ResponseBase
{
    public var roles:[RoleListProjectionDto] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case roles
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        roles = try container.decodeIfPresent([RoleListProjectionDto].self, forKey: .roles) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if roles.count > 0 { try container.encode(roles, forKey: .roles) }
    }
}

public class GetPolicyResponse : ResponseBase
{
    public var policy:PolicyItemDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case policy
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        policy = try container.decodeIfPresent(PolicyItemDto.self, forKey: .policy)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if policy != nil { try container.encode(policy, forKey: .policy) }
    }
}

public class GetPoliciesResponse : ResponseBase
{
    public var policies:[PolicyItemDto] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case policies
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        policies = try container.decodeIfPresent([PolicyItemDto].self, forKey: .policies) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if policies.count > 0 { try container.encode(policies, forKey: .policies) }
    }
}

public class GetMembershipIntegrationResponse : ResponseBase
{
    public var item:MembershipIntegrationDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(MembershipIntegrationDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetMembershipIntegrationsResponse : ResponseBase
{
    public var list:PaginatedResponse<MembershipIntegrationListProjection>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<MembershipIntegrationListProjection>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetSchemaTriggerResponse : GetTriggerResponse
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class GetSchemaTriggersResponse : GetTriggersResponse
{
    public var list:PaginatedResponse<SchemaTriggerProjectionList>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<SchemaTriggerProjectionList>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetDatabaseTaxonomyResponse : ResponseBase
{
    public var item:TaxonomyDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(TaxonomyDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetDatabaseTaxonomiesResponse : ResponseBase
{
    public var list:PaginatedResponse<TaxonomyListProjection>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<TaxonomyListProjection>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetDatabaseTaxonomyTermResponse : ResponseBase
{
    public var item:TermDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(TermDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
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

public class GetDatabaseSchemaDraftResponse : ResponseBase
{
    public var item:SchemaDraftDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(SchemaDraftDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetDatabaseSchemaVersionDiffResponse : ResponseBase
{
    public var item:SchemaDiffDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(SchemaDiffDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetDatabaseSchemaVersionsResponse : ResponseBase
{
    public var items:[SchemaVersionSummaryDto]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case items
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decodeIfPresent([SchemaVersionSummaryDto].self, forKey: .items) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if items != nil { try container.encode(items, forKey: .items) }
    }
}

public class GetDatabaseIntegrationResponse : ResponseBase
{
    public var item:DatabaseIntegrationDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(DatabaseIntegrationDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetDatabaseIntegrationsResponse : ResponseBase
{
    public var defaultIntegrationId:String?
    public var list:PaginatedResponse<DatabaseIntegrationListProjection>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case defaultIntegrationId
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        defaultIntegrationId = try container.decodeIfPresent(String.self, forKey: .defaultIntegrationId)
        list = try container.decodeIfPresent(PaginatedResponse<DatabaseIntegrationListProjection>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if defaultIntegrationId != nil { try container.encode(defaultIntegrationId, forKey: .defaultIntegrationId) }
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetDatabaseAggregateResponse : ResponseBase
{
    public var item:MongoDbAggregateDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(MongoDbAggregateDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetDatabaseAggregatesResponse : ResponseBase
{
    public var list:PaginatedResponse<MongoDbAggregateListProjection>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<MongoDbAggregateListProjection>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class TestDatabaseAggregateResponse : ResponseBase
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

public class GetFilesTriggerResponse : GetTriggerResponse
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class GetFilesTriggersResponse : GetTriggersResponse
{
    public var list:PaginatedResponse<FilesTriggerProjectionList>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<FilesTriggerProjectionList>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetFilesIntegrationResponse : ResponseBase
{
    public var item:FilesIntegrationDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(FilesIntegrationDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetFilesIntegrationsResponse : ResponseBase
{
    public var defaultIntegrationId:String?
    public var list:PaginatedResponse<FilesIntegrationListProjection>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case defaultIntegrationId
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        defaultIntegrationId = try container.decodeIfPresent(String.self, forKey: .defaultIntegrationId)
        list = try container.decodeIfPresent(PaginatedResponse<FilesIntegrationListProjection>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if defaultIntegrationId != nil { try container.encode(defaultIntegrationId, forKey: .defaultIntegrationId) }
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetEmailTemplateResponse : ResponseBase
{
    public var item:EmailTemplateDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(EmailTemplateDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetEmailTemplatesResponse : ResponseBase
{
    public var list:PaginatedResponse<TemplateListProjection>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<TemplateListProjection>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetHtmlFromMjmlResponse : ResponseBase
{
    public var variables:[String]?
    public var htmlFromMjmlResponse:HtmlFromMjmlResponse?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case variables
        case htmlFromMjmlResponse
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        variables = try container.decodeIfPresent([String].self, forKey: .variables) ?? []
        htmlFromMjmlResponse = try container.decodeIfPresent(HtmlFromMjmlResponse.self, forKey: .htmlFromMjmlResponse)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if variables != nil { try container.encode(variables, forKey: .variables) }
        if htmlFromMjmlResponse != nil { try container.encode(htmlFromMjmlResponse, forKey: .htmlFromMjmlResponse) }
    }
}

public class GetSystemEmailTemplateResponse : ResponseBase
{
    public var item:SystemEmailTemplateDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(SystemEmailTemplateDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetSystemEmailTemplatesResponse : ResponseBase
{
    public var list:PaginatedResponse<SystemEmailTemplateListProjection>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<SystemEmailTemplateListProjection>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetEmailTemplateAvailableTokensResponse : ResponseBase
{
    public var tokens:[String:[String]]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case tokens
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tokens = try container.decodeIfPresent([String:[String]].self, forKey: .tokens) ?? [:]
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if tokens != nil { try container.encode(tokens, forKey: .tokens) }
    }
}

public class GetEmailSignatureResponse : ResponseBase
{
    public var item:EmailSignatureDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(EmailSignatureDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetEmailSignaturesResponse : ResponseBase
{
    public var list:PaginatedResponse<ListItemWithTranslationsProjection>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<ListItemWithTranslationsProjection>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetEmailSettingsResponse : ResponseBase
{
    public var settings:EmailSettings?
    public var systemTags:[GroupDefinitionDto]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case settings
        case systemTags
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        settings = try container.decodeIfPresent(EmailSettings.self, forKey: .settings)
        systemTags = try container.decodeIfPresent([GroupDefinitionDto].self, forKey: .systemTags) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if settings != nil { try container.encode(settings, forKey: .settings) }
        if systemTags != nil { try container.encode(systemTags, forKey: .systemTags) }
    }
}

public class GetEmailIntegrationResponse : ResponseBase
{
    public var item:EmailIntegrationDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(EmailIntegrationDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetEmailIntegrationsResponse : ResponseBase
{
    public var defaultIntegrationId:String?
    public var list:PaginatedResponse<EmailIntegrationListProjection>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case defaultIntegrationId
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        defaultIntegrationId = try container.decodeIfPresent(String.self, forKey: .defaultIntegrationId)
        list = try container.decodeIfPresent(PaginatedResponse<EmailIntegrationListProjection>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if defaultIntegrationId != nil { try container.encode(defaultIntegrationId, forKey: .defaultIntegrationId) }
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

// @DataContract
public class TestEmailIntegrationResponse : ResponseBase
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

public class GetEmailFooterResponse : ResponseBase
{
    public var item:EmailFooterDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(EmailFooterDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetEmailFootersResponse : ResponseBase
{
    public var list:PaginatedResponse<ListItemWithTranslationsProjection>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<ListItemWithTranslationsProjection>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetEmailCampaignResponse : ResponseBase
{
    public var item:EmailCampaignDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(EmailCampaignDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetEmailCampaignsResponse : ResponseBase
{
    public var list:PaginatedResponse<EmailCampaignListProjection>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<EmailCampaignListProjection>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetEmailCampaignBatchesResponse : ResponseBase
{
    public var list:PaginatedResponse<EmailCampaignBatchDto>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<EmailCampaignBatchDto>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetEmailCampaignBatchNotificationResponse : ResponseBase
{
    public var campaignNotification:EmailCampaignBatchNotificationDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case campaignNotification
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        campaignNotification = try container.decodeIfPresent(EmailCampaignBatchNotificationDto.self, forKey: .campaignNotification)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if campaignNotification != nil { try container.encode(campaignNotification, forKey: .campaignNotification) }
    }
}

public class GetEmailCampaignBatchNotificationsResponse : ResponseBase
{
    public var batchStatusHistory:[BatchStatusChangeEntryDto]?
    public var list:PaginatedResponse<EmailCampaignBatchNotificationDto>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case batchStatusHistory
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        batchStatusHistory = try container.decodeIfPresent([BatchStatusChangeEntryDto].self, forKey: .batchStatusHistory) ?? []
        list = try container.decodeIfPresent(PaginatedResponse<EmailCampaignBatchNotificationDto>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if batchStatusHistory != nil { try container.encode(batchStatusHistory, forKey: .batchStatusHistory) }
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetEmailCampaignStatisticsResponse : ResponseBase
{
    public var stats:CampaignStatsDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case stats
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        stats = try container.decodeIfPresent(CampaignStatsDto.self, forKey: .stats)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if stats != nil { try container.encode(stats, forKey: .stats) }
    }
}

public class PreviewEmailNotificationResponse : ResponseBase
{
    public var subject:String?
    public var body:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case subject
        case body
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        subject = try container.decodeIfPresent(String.self, forKey: .subject)
        body = try container.decodeIfPresent(String.self, forKey: .body)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if subject != nil { try container.encode(subject, forKey: .subject) }
        if body != nil { try container.encode(body, forKey: .body) }
    }
}

public class GetEmailCampaignMessageResponse : ResponseBase
{
    public var emailMessageEntity:EmailCampaignBatchNotificationDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case emailMessageEntity
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        emailMessageEntity = try container.decodeIfPresent(EmailCampaignBatchNotificationDto.self, forKey: .emailMessageEntity)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if emailMessageEntity != nil { try container.encode(emailMessageEntity, forKey: .emailMessageEntity) }
    }
}

public class GetEmailCampaignMessagesResponse : ResponseBase
{
    public var list:PaginatedResponse<EmailCampaignBatchNotificationDto>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<EmailCampaignBatchNotificationDto>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetPushTemplateResponse : ResponseBase
{
    public var item:PushTemplateDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(PushTemplateDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetPushTemplatesResponse : ResponseBase
{
    public var list:PaginatedResponse<PushTemplateListProjection>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<PushTemplateListProjection>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetPushMessageContentTokensResponse : ResponseBase
{
    public var tokens:[String:[String]]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case tokens
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tokens = try container.decodeIfPresent([String:[String]].self, forKey: .tokens) ?? [:]
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if tokens != nil { try container.encode(tokens, forKey: .tokens) }
    }
}

public class GetPushIntegrationResponse : ResponseBase
{
    public var item:PushIntegrationDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(PushIntegrationDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetPushIntegrationsResponse : ResponseBase
{
    public var defaultIntegrationId:String?
    public var list:PaginatedResponse<PushIntegrationListProjection>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case defaultIntegrationId
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        defaultIntegrationId = try container.decodeIfPresent(String.self, forKey: .defaultIntegrationId)
        list = try container.decodeIfPresent(PaginatedResponse<PushIntegrationListProjection>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if defaultIntegrationId != nil { try container.encode(defaultIntegrationId, forKey: .defaultIntegrationId) }
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetPaymentsTriggerResponse : GetTriggerResponse
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class GetPaymentsTriggersResponse : GetTriggersResponse
{
    public var list:PaginatedResponse<PaymentTriggerProjectionList>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<PaymentTriggerProjectionList>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetPaymentsIntegrationResponse : ResponseBase
{
    public var item:PaymentsIntegrationDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(PaymentsIntegrationDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetPaymentsIntegrationsResponse : ResponseBase
{
    public var list:PaginatedResponse<PaymentsIntegrationListProjection>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<PaymentsIntegrationListProjection>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

// @DataContract
public class TestPaymentsIntegrationResponse : ResponseBase
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

public class GetLoggingIntegrationResponse : ResponseBase
{
    public var item:LoggingIntegrationDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(LoggingIntegrationDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetLoggingIntegrationsResponse : ResponseBase
{
    public var list:PaginatedResponse<LoggingIntegrationListProjection>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<LoggingIntegrationListProjection>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

// @DataContract
public class TestLoggingIntegrationResponse : ResponseBase
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

public class GetLlmIntegrationResponse : ResponseBase
{
    public var item:LlmIntegrationDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(LlmIntegrationDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetLlmIntegrationsResponse : ResponseBase
{
    public var defaultIntegrationId:String?
    public var list:PaginatedResponse<LlmIntegrationListProjection>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case defaultIntegrationId
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        defaultIntegrationId = try container.decodeIfPresent(String.self, forKey: .defaultIntegrationId)
        list = try container.decodeIfPresent(PaginatedResponse<LlmIntegrationListProjection>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if defaultIntegrationId != nil { try container.encode(defaultIntegrationId, forKey: .defaultIntegrationId) }
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

// @DataContract
public class TestLlmIntegrationResponse : ResponseBase
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

public class GetMcpIntegrationResponse : ResponseBase
{
    public var item:McpIntegrationDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(McpIntegrationDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetMcpIntegrationsResponse : ResponseBase
{
    public var defaultIntegrationId:String?
    public var list:PaginatedResponse<McpIntegrationListProjection>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case defaultIntegrationId
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        defaultIntegrationId = try container.decodeIfPresent(String.self, forKey: .defaultIntegrationId)
        list = try container.decodeIfPresent(PaginatedResponse<McpIntegrationListProjection>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if defaultIntegrationId != nil { try container.encode(defaultIntegrationId, forKey: .defaultIntegrationId) }
        if list != nil { try container.encode(list, forKey: .list) }
    }
}

public class GetWebhookIntegrationResponse : ResponseBase
{
    public var item:WebhookIntegrationDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(WebhookIntegrationDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class RevealWebhookIntegrationSecretResponse : ResponseBase
{
    public var signingSecret:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case signingSecret
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        signingSecret = try container.decodeIfPresent(String.self, forKey: .signingSecret)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if signingSecret != nil { try container.encode(signingSecret, forKey: .signingSecret) }
    }
}

public class RotateWebhookIntegrationSecretResponse : ResponseBase
{
    public var signingSecret:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case signingSecret
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        signingSecret = try container.decodeIfPresent(String.self, forKey: .signingSecret)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if signingSecret != nil { try container.encode(signingSecret, forKey: .signingSecret) }
    }
}

public class SaveWebhookDestinationResponse : ResponseBase
{
    public var destinationId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case destinationId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        destinationId = try container.decodeIfPresent(String.self, forKey: .destinationId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if destinationId != nil { try container.encode(destinationId, forKey: .destinationId) }
    }
}

public class GetSchedulerTaskResponse : ResponseBase
{
    public var item:SchedulerTaskDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case item
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent(SchedulerTaskDto.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if item != nil { try container.encode(item, forKey: .item) }
    }
}

public class GetSchedulerTasksResponse : ResponseBase
{
    public var list:PaginatedResponse<SchedulerTaskListProjection>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case list
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        list = try container.decodeIfPresent(PaginatedResponse<SchedulerTaskListProjection>.self, forKey: .list)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if list != nil { try container.encode(list, forKey: .list) }
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

public class SmtpEmailIntegrationRequest : EmailIntegrationRequest
{
    public var domain:String?
    public var port:SmtpPorts?
    public var userName:String?
    public var password:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case domain
        case port
        case userName
        case password
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        domain = try container.decodeIfPresent(String.self, forKey: .domain)
        port = try container.decodeIfPresent(SmtpPorts.self, forKey: .port)
        userName = try container.decodeIfPresent(String.self, forKey: .userName)
        password = try container.decodeIfPresent(String.self, forKey: .password)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if domain != nil { try container.encode(domain, forKey: .domain) }
        if port != nil { try container.encode(port, forKey: .port) }
        if userName != nil { try container.encode(userName, forKey: .userName) }
        if password != nil { try container.encode(password, forKey: .password) }
    }
}

public class AwsSesEmailIntegrationRequest : EmailIntegrationRequest
{
    public var integrationType:AwsIntegrationType?
    public var awsRegion:String?
    public var emailIdentityArn:String?
    public var configurationSet:String?
    public var roleArn:String?
    public var externalId:String?
    public var accessKey:String?
    public var secretKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integrationType
        case awsRegion
        case emailIdentityArn
        case configurationSet
        case roleArn
        case externalId
        case accessKey
        case secretKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integrationType = try container.decodeIfPresent(AwsIntegrationType.self, forKey: .integrationType)
        awsRegion = try container.decodeIfPresent(String.self, forKey: .awsRegion)
        emailIdentityArn = try container.decodeIfPresent(String.self, forKey: .emailIdentityArn)
        configurationSet = try container.decodeIfPresent(String.self, forKey: .configurationSet)
        roleArn = try container.decodeIfPresent(String.self, forKey: .roleArn)
        externalId = try container.decodeIfPresent(String.self, forKey: .externalId)
        accessKey = try container.decodeIfPresent(String.self, forKey: .accessKey)
        secretKey = try container.decodeIfPresent(String.self, forKey: .secretKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integrationType != nil { try container.encode(integrationType, forKey: .integrationType) }
        if awsRegion != nil { try container.encode(awsRegion, forKey: .awsRegion) }
        if emailIdentityArn != nil { try container.encode(emailIdentityArn, forKey: .emailIdentityArn) }
        if configurationSet != nil { try container.encode(configurationSet, forKey: .configurationSet) }
        if roleArn != nil { try container.encode(roleArn, forKey: .roleArn) }
        if externalId != nil { try container.encode(externalId, forKey: .externalId) }
        if accessKey != nil { try container.encode(accessKey, forKey: .accessKey) }
        if secretKey != nil { try container.encode(secretKey, forKey: .secretKey) }
    }
}

public class SendGridEmailIntegrationRequest : EmailIntegrationRequest
{
    public var apiKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case apiKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
    }
}

public class MailGunEmailIntegrationRequest : EmailIntegrationRequest
{
    public var domain:String?
    public var apiKey:String?
    public var webhookSigningKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case domain
        case apiKey
        case webhookSigningKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        domain = try container.decodeIfPresent(String.self, forKey: .domain)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        webhookSigningKey = try container.decodeIfPresent(String.self, forKey: .webhookSigningKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if domain != nil { try container.encode(domain, forKey: .domain) }
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
        if webhookSigningKey != nil { try container.encode(webhookSigningKey, forKey: .webhookSigningKey) }
    }
}

public class EmailToAllUsersDeliverySettingsRequest : EmailCampaignRequest
{
    public var rolesNames:[String]?
    public var userTags:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case rolesNames
        case userTags
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rolesNames = try container.decodeIfPresent([String].self, forKey: .rolesNames) ?? []
        userTags = try container.decodeIfPresent([String].self, forKey: .userTags) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if rolesNames != nil { try container.encode(rolesNames, forKey: .rolesNames) }
        if userTags != nil { try container.encode(userTags, forKey: .userTags) }
    }
}

public class EmailToAccountUsersDeliverySettingsRequest : EmailCampaignRequest
{
    public var userRecipients:[String] = []
    public var userCc:[String]?
    public var userBcc:[String]?
    public var singleEmailStrategy:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case userRecipients
        case userCc
        case userBcc
        case singleEmailStrategy
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userRecipients = try container.decodeIfPresent([String].self, forKey: .userRecipients) ?? []
        userCc = try container.decodeIfPresent([String].self, forKey: .userCc) ?? []
        userBcc = try container.decodeIfPresent([String].self, forKey: .userBcc) ?? []
        singleEmailStrategy = try container.decodeIfPresent(Bool.self, forKey: .singleEmailStrategy)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if userRecipients.count > 0 { try container.encode(userRecipients, forKey: .userRecipients) }
        if userCc != nil { try container.encode(userCc, forKey: .userCc) }
        if userBcc != nil { try container.encode(userBcc, forKey: .userBcc) }
        if singleEmailStrategy != nil { try container.encode(singleEmailStrategy, forKey: .singleEmailStrategy) }
    }
}

public class EmailToCollectionRecordsDeliverySettingsRequest : EmailCampaignRequest
{
    public var fields:[String] = []
    public var schemaName:String?
    public var fieldType:CollectionEmailCampaignRecipientField?
    public var roleNames:[String]?
    public var languages:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case fields
        case schemaName
        case fieldType
        case roleNames
        case languages
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fields = try container.decodeIfPresent([String].self, forKey: .fields) ?? []
        schemaName = try container.decodeIfPresent(String.self, forKey: .schemaName)
        fieldType = try container.decodeIfPresent(CollectionEmailCampaignRecipientField.self, forKey: .fieldType)
        roleNames = try container.decodeIfPresent([String].self, forKey: .roleNames) ?? []
        languages = try container.decodeIfPresent([String].self, forKey: .languages) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if fields.count > 0 { try container.encode(fields, forKey: .fields) }
        if schemaName != nil { try container.encode(schemaName, forKey: .schemaName) }
        if fieldType != nil { try container.encode(fieldType, forKey: .fieldType) }
        if roleNames != nil { try container.encode(roleNames, forKey: .roleNames) }
        if languages != nil { try container.encode(languages, forKey: .languages) }
    }
}

public class EmailToEmailsDeliverySettingsRequest : EmailCampaignRequest
{
    public var recipients:[String] = []
    public var recipientsCc:[String]?
    public var recipientsBcc:[String]?
    public var singleEmailStrategy:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case recipients
        case recipientsCc
        case recipientsBcc
        case singleEmailStrategy
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        recipients = try container.decodeIfPresent([String].self, forKey: .recipients) ?? []
        recipientsCc = try container.decodeIfPresent([String].self, forKey: .recipientsCc) ?? []
        recipientsBcc = try container.decodeIfPresent([String].self, forKey: .recipientsBcc) ?? []
        singleEmailStrategy = try container.decodeIfPresent(Bool.self, forKey: .singleEmailStrategy)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if recipients.count > 0 { try container.encode(recipients, forKey: .recipients) }
        if recipientsCc != nil { try container.encode(recipientsCc, forKey: .recipientsCc) }
        if recipientsBcc != nil { try container.encode(recipientsBcc, forKey: .recipientsBcc) }
        if singleEmailStrategy != nil { try container.encode(singleEmailStrategy, forKey: .singleEmailStrategy) }
    }
}

public class EmailToUsersDeliverySettingsRequest : EmailCampaignRequest
{
    public var userRecipients:[String] = []
    public var userCc:[String]?
    public var userBcc:[String]?
    public var singleEmailStrategy:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case userRecipients
        case userCc
        case userBcc
        case singleEmailStrategy
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userRecipients = try container.decodeIfPresent([String].self, forKey: .userRecipients) ?? []
        userCc = try container.decodeIfPresent([String].self, forKey: .userCc) ?? []
        userBcc = try container.decodeIfPresent([String].self, forKey: .userBcc) ?? []
        singleEmailStrategy = try container.decodeIfPresent(Bool.self, forKey: .singleEmailStrategy)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if userRecipients.count > 0 { try container.encode(userRecipients, forKey: .userRecipients) }
        if userCc != nil { try container.encode(userCc, forKey: .userCc) }
        if userBcc != nil { try container.encode(userBcc, forKey: .userBcc) }
        if singleEmailStrategy != nil { try container.encode(singleEmailStrategy, forKey: .singleEmailStrategy) }
    }
}

public class MembershipTriggerRequest : SaveTriggerRequest
{
    public var when:MembershipTriggerType?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case when
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        when = try container.decodeIfPresent(MembershipTriggerType.self, forKey: .when)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if when != nil { try container.encode(when, forKey: .when) }
    }
}

public class SchemaTriggerRequest : SaveTriggerRequest
{
    public var schemaId:String?
    public var when:SchemaTriggerType?
    public var configurationCode:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case schemaId
        case when
        case configurationCode
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        schemaId = try container.decodeIfPresent(String.self, forKey: .schemaId)
        when = try container.decodeIfPresent(SchemaTriggerType.self, forKey: .when)
        configurationCode = try container.decodeIfPresent(String.self, forKey: .configurationCode)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if schemaId != nil { try container.encode(schemaId, forKey: .schemaId) }
        if when != nil { try container.encode(when, forKey: .when) }
        if configurationCode != nil { try container.encode(configurationCode, forKey: .configurationCode) }
    }
}

public class FilesTriggerRequest : SaveTriggerRequest
{
    public var when:FilesTriggerType?
    public var fileRef:FileResourceRefDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case when
        case fileRef
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        when = try container.decodeIfPresent(FilesTriggerType.self, forKey: .when)
        fileRef = try container.decodeIfPresent(FileResourceRefDto.self, forKey: .fileRef)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if when != nil { try container.encode(when, forKey: .when) }
        if fileRef != nil { try container.encode(fileRef, forKey: .fileRef) }
    }
}

public class PaymentTriggerRequest : SaveTriggerRequest
{
    public var when:PaymentTriggerType?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case when
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        when = try container.decodeIfPresent(PaymentTriggerType.self, forKey: .when)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if when != nil { try container.encode(when, forKey: .when) }
    }
}

public class MongoDbAtlasServerlessDatabaseIntegrationRequest : DatabaseIntegrationRequest
{
    public var databaseName:String?
    public var connectionString:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case databaseName
        case connectionString
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        databaseName = try container.decodeIfPresent(String.self, forKey: .databaseName)
        connectionString = try container.decodeIfPresent(String.self, forKey: .connectionString)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if databaseName != nil { try container.encode(databaseName, forKey: .databaseName) }
        if connectionString != nil { try container.encode(connectionString, forKey: .connectionString) }
    }
}

public class MongoDbAtlasClusterDatabaseIntegrationRequest : DatabaseIntegrationRequest
{
    public var databaseName:String?
    public var connectionString:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case databaseName
        case connectionString
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        databaseName = try container.decodeIfPresent(String.self, forKey: .databaseName)
        connectionString = try container.decodeIfPresent(String.self, forKey: .connectionString)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if databaseName != nil { try container.encode(databaseName, forKey: .databaseName) }
        if connectionString != nil { try container.encode(connectionString, forKey: .connectionString) }
    }
}

public class MongoDbConnectionStringDatabaseIntegrationRequest : DatabaseIntegrationRequest
{
    public var databaseName:String?
    public var connectionString:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case databaseName
        case connectionString
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        databaseName = try container.decodeIfPresent(String.self, forKey: .databaseName)
        connectionString = try container.decodeIfPresent(String.self, forKey: .connectionString)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if databaseName != nil { try container.encode(databaseName, forKey: .databaseName) }
        if connectionString != nil { try container.encode(connectionString, forKey: .connectionString) }
    }
}

public class GoogleDriveFilesIntegrationRequest : FilesIntegrationRequest
{
    public var rootFolderId:String?
    public var serviceAccountJsonKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case rootFolderId
        case serviceAccountJsonKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rootFolderId = try container.decodeIfPresent(String.self, forKey: .rootFolderId)
        serviceAccountJsonKey = try container.decodeIfPresent(String.self, forKey: .serviceAccountJsonKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if rootFolderId != nil { try container.encode(rootFolderId, forKey: .rootFolderId) }
        if serviceAccountJsonKey != nil { try container.encode(serviceAccountJsonKey, forKey: .serviceAccountJsonKey) }
    }
}

public class FtpFilesIntegrationRequest : FilesIntegrationRequest
{
    public var host:String?
    public var port:Int?
    public var rootPath:String?
    public var useSsl:Bool?
    public var username:String?
    public var password:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case host
        case port
        case rootPath
        case useSsl
        case username
        case password
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        host = try container.decodeIfPresent(String.self, forKey: .host)
        port = try container.decodeIfPresent(Int.self, forKey: .port)
        rootPath = try container.decodeIfPresent(String.self, forKey: .rootPath)
        useSsl = try container.decodeIfPresent(Bool.self, forKey: .useSsl)
        username = try container.decodeIfPresent(String.self, forKey: .username)
        password = try container.decodeIfPresent(String.self, forKey: .password)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if host != nil { try container.encode(host, forKey: .host) }
        if port != nil { try container.encode(port, forKey: .port) }
        if rootPath != nil { try container.encode(rootPath, forKey: .rootPath) }
        if useSsl != nil { try container.encode(useSsl, forKey: .useSsl) }
        if username != nil { try container.encode(username, forKey: .username) }
        if password != nil { try container.encode(password, forKey: .password) }
    }
}

public class DropBoxFilesIntegrationRequest : FilesIntegrationRequest
{
    public var rootPath:String?
    public var accessToken:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case rootPath
        case accessToken
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rootPath = try container.decodeIfPresent(String.self, forKey: .rootPath)
        accessToken = try container.decodeIfPresent(String.self, forKey: .accessToken)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if rootPath != nil { try container.encode(rootPath, forKey: .rootPath) }
        if accessToken != nil { try container.encode(accessToken, forKey: .accessToken) }
    }
}

public class AppleICloudFilesIntegrationRequest : FilesIntegrationRequest
{
    public var containerIdentifier:String?
    public var relativePath:String?
    public var keyId:String?
    public var teamId:String?
    public var bundleId:String?
    public var p8PrivateKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case containerIdentifier
        case relativePath
        case keyId
        case teamId
        case bundleId
        case p8PrivateKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        containerIdentifier = try container.decodeIfPresent(String.self, forKey: .containerIdentifier)
        relativePath = try container.decodeIfPresent(String.self, forKey: .relativePath)
        keyId = try container.decodeIfPresent(String.self, forKey: .keyId)
        teamId = try container.decodeIfPresent(String.self, forKey: .teamId)
        bundleId = try container.decodeIfPresent(String.self, forKey: .bundleId)
        p8PrivateKey = try container.decodeIfPresent(String.self, forKey: .p8PrivateKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if containerIdentifier != nil { try container.encode(containerIdentifier, forKey: .containerIdentifier) }
        if relativePath != nil { try container.encode(relativePath, forKey: .relativePath) }
        if keyId != nil { try container.encode(keyId, forKey: .keyId) }
        if teamId != nil { try container.encode(teamId, forKey: .teamId) }
        if bundleId != nil { try container.encode(bundleId, forKey: .bundleId) }
        if p8PrivateKey != nil { try container.encode(p8PrivateKey, forKey: .p8PrivateKey) }
    }
}

public class AwsS3FilesIntegrationRequest : FilesIntegrationRequest
{
    public var integrationType:AwsS3IntegrationType?
    public var bucketName:String?
    public var region:String?
    public var roleArn:String?
    public var externalId:String?
    public var accessKey:String?
    public var secretKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integrationType
        case bucketName
        case region
        case roleArn
        case externalId
        case accessKey
        case secretKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integrationType = try container.decodeIfPresent(AwsS3IntegrationType.self, forKey: .integrationType)
        bucketName = try container.decodeIfPresent(String.self, forKey: .bucketName)
        region = try container.decodeIfPresent(String.self, forKey: .region)
        roleArn = try container.decodeIfPresent(String.self, forKey: .roleArn)
        externalId = try container.decodeIfPresent(String.self, forKey: .externalId)
        accessKey = try container.decodeIfPresent(String.self, forKey: .accessKey)
        secretKey = try container.decodeIfPresent(String.self, forKey: .secretKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integrationType != nil { try container.encode(integrationType, forKey: .integrationType) }
        if bucketName != nil { try container.encode(bucketName, forKey: .bucketName) }
        if region != nil { try container.encode(region, forKey: .region) }
        if roleArn != nil { try container.encode(roleArn, forKey: .roleArn) }
        if externalId != nil { try container.encode(externalId, forKey: .externalId) }
        if accessKey != nil { try container.encode(accessKey, forKey: .accessKey) }
        if secretKey != nil { try container.encode(secretKey, forKey: .secretKey) }
    }
}

public class GoogleCloudFilesIntegrationRequest : FilesIntegrationRequest
{
    public var bucketName:String?
    public var serviceAccountJsonKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case bucketName
        case serviceAccountJsonKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        bucketName = try container.decodeIfPresent(String.self, forKey: .bucketName)
        serviceAccountJsonKey = try container.decodeIfPresent(String.self, forKey: .serviceAccountJsonKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if bucketName != nil { try container.encode(bucketName, forKey: .bucketName) }
        if serviceAccountJsonKey != nil { try container.encode(serviceAccountJsonKey, forKey: .serviceAccountJsonKey) }
    }
}

public class AzureBlobFilesIntegrationRequest : FilesIntegrationRequest
{
    public var blobName:String?
    public var connectionString:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case blobName
        case connectionString
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        blobName = try container.decodeIfPresent(String.self, forKey: .blobName)
        connectionString = try container.decodeIfPresent(String.self, forKey: .connectionString)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if blobName != nil { try container.encode(blobName, forKey: .blobName) }
        if connectionString != nil { try container.encode(connectionString, forKey: .connectionString) }
    }
}

public class LocalFilesIntegrationRequest : FilesIntegrationRequest
{
    public var rootPath:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case rootPath
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rootPath = try container.decodeIfPresent(String.self, forKey: .rootPath)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if rootPath != nil { try container.encode(rootPath, forKey: .rootPath) }
    }
}

public class AmqpLoggingIntegrationRequest : LoggingIntegrationRequest
{
    public var host:String?
    public var port:Int?
    public var virtualHost:String?
    public var exchange:String?
    public var routingKey:String?
    public var username:String?
    public var password:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case host
        case port
        case virtualHost
        case exchange
        case routingKey
        case username
        case password
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        host = try container.decodeIfPresent(String.self, forKey: .host)
        port = try container.decodeIfPresent(Int.self, forKey: .port)
        virtualHost = try container.decodeIfPresent(String.self, forKey: .virtualHost)
        exchange = try container.decodeIfPresent(String.self, forKey: .exchange)
        routingKey = try container.decodeIfPresent(String.self, forKey: .routingKey)
        username = try container.decodeIfPresent(String.self, forKey: .username)
        password = try container.decodeIfPresent(String.self, forKey: .password)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if host != nil { try container.encode(host, forKey: .host) }
        if port != nil { try container.encode(port, forKey: .port) }
        if virtualHost != nil { try container.encode(virtualHost, forKey: .virtualHost) }
        if exchange != nil { try container.encode(exchange, forKey: .exchange) }
        if routingKey != nil { try container.encode(routingKey, forKey: .routingKey) }
        if username != nil { try container.encode(username, forKey: .username) }
        if password != nil { try container.encode(password, forKey: .password) }
    }
}

public class AwsKinesisLoggingIntegrationRequest : LoggingIntegrationRequest
{
    public var streamName:String?
    public var region:String?
    public var accessKey:String?
    public var secretKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case streamName
        case region
        case accessKey
        case secretKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        streamName = try container.decodeIfPresent(String.self, forKey: .streamName)
        region = try container.decodeIfPresent(String.self, forKey: .region)
        accessKey = try container.decodeIfPresent(String.self, forKey: .accessKey)
        secretKey = try container.decodeIfPresent(String.self, forKey: .secretKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if streamName != nil { try container.encode(streamName, forKey: .streamName) }
        if region != nil { try container.encode(region, forKey: .region) }
        if accessKey != nil { try container.encode(accessKey, forKey: .accessKey) }
        if secretKey != nil { try container.encode(secretKey, forKey: .secretKey) }
    }
}

public class AwsS3LoggingIntegrationRequest : LoggingIntegrationRequest
{
    public var integrationType:AwsS3LoggingIntegrationType?
    public var bucketName:String?
    public var region:String?
    public var roleArn:String?
    public var externalId:String?
    public var accessKey:String?
    public var secretKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integrationType
        case bucketName
        case region
        case roleArn
        case externalId
        case accessKey
        case secretKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integrationType = try container.decodeIfPresent(AwsS3LoggingIntegrationType.self, forKey: .integrationType)
        bucketName = try container.decodeIfPresent(String.self, forKey: .bucketName)
        region = try container.decodeIfPresent(String.self, forKey: .region)
        roleArn = try container.decodeIfPresent(String.self, forKey: .roleArn)
        externalId = try container.decodeIfPresent(String.self, forKey: .externalId)
        accessKey = try container.decodeIfPresent(String.self, forKey: .accessKey)
        secretKey = try container.decodeIfPresent(String.self, forKey: .secretKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integrationType != nil { try container.encode(integrationType, forKey: .integrationType) }
        if bucketName != nil { try container.encode(bucketName, forKey: .bucketName) }
        if region != nil { try container.encode(region, forKey: .region) }
        if roleArn != nil { try container.encode(roleArn, forKey: .roleArn) }
        if externalId != nil { try container.encode(externalId, forKey: .externalId) }
        if accessKey != nil { try container.encode(accessKey, forKey: .accessKey) }
        if secretKey != nil { try container.encode(secretKey, forKey: .secretKey) }
    }
}

public class TelegramLoggingIntegrationRequest : LoggingIntegrationRequest
{
    public var chatId:String?
    public var botToken:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case chatId
        case botToken
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        chatId = try container.decodeIfPresent(String.self, forKey: .chatId)
        botToken = try container.decodeIfPresent(String.self, forKey: .botToken)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if chatId != nil { try container.encode(chatId, forKey: .chatId) }
        if botToken != nil { try container.encode(botToken, forKey: .botToken) }
    }
}

public class NewRelicLoggingIntegrationRequest : LoggingIntegrationRequest
{
    public var region:String?
    public var serviceName:String?
    public var apiKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case region
        case serviceName
        case apiKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        region = try container.decodeIfPresent(String.self, forKey: .region)
        serviceName = try container.decodeIfPresent(String.self, forKey: .serviceName)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if region != nil { try container.encode(region, forKey: .region) }
        if serviceName != nil { try container.encode(serviceName, forKey: .serviceName) }
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
    }
}

public class MicrosoftTeamsLoggingIntegrationRequest : LoggingIntegrationRequest
{
    public var channelName:String?
    public var webhookUrl:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case channelName
        case webhookUrl
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        channelName = try container.decodeIfPresent(String.self, forKey: .channelName)
        webhookUrl = try container.decodeIfPresent(String.self, forKey: .webhookUrl)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if channelName != nil { try container.encode(channelName, forKey: .channelName) }
        if webhookUrl != nil { try container.encode(webhookUrl, forKey: .webhookUrl) }
    }
}

public class MongoDbLoggingIntegrationRequest : LoggingIntegrationRequest
{
    public var databaseName:String?
    public var connectionString:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case databaseName
        case connectionString
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        databaseName = try container.decodeIfPresent(String.self, forKey: .databaseName)
        connectionString = try container.decodeIfPresent(String.self, forKey: .connectionString)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if databaseName != nil { try container.encode(databaseName, forKey: .databaseName) }
        if connectionString != nil { try container.encode(connectionString, forKey: .connectionString) }
    }
}

public class KafkaLoggingIntegrationRequest : LoggingIntegrationRequest
{
    public var bootstrapServers:String?
    public var topic:String?
    public var securityProtocol:String?
    public var saslUsername:String?
    public var saslPassword:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case bootstrapServers
        case topic
        case securityProtocol
        case saslUsername
        case saslPassword
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        bootstrapServers = try container.decodeIfPresent(String.self, forKey: .bootstrapServers)
        topic = try container.decodeIfPresent(String.self, forKey: .topic)
        securityProtocol = try container.decodeIfPresent(String.self, forKey: .securityProtocol)
        saslUsername = try container.decodeIfPresent(String.self, forKey: .saslUsername)
        saslPassword = try container.decodeIfPresent(String.self, forKey: .saslPassword)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if bootstrapServers != nil { try container.encode(bootstrapServers, forKey: .bootstrapServers) }
        if topic != nil { try container.encode(topic, forKey: .topic) }
        if securityProtocol != nil { try container.encode(securityProtocol, forKey: .securityProtocol) }
        if saslUsername != nil { try container.encode(saslUsername, forKey: .saslUsername) }
        if saslPassword != nil { try container.encode(saslPassword, forKey: .saslPassword) }
    }
}

public class PrometheusLoggingIntegrationRequest : LoggingIntegrationRequest
{
    public var endpointUrl:String?
    public var jobName:String?
    public var bearerToken:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case endpointUrl
        case jobName
        case bearerToken
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        endpointUrl = try container.decodeIfPresent(String.self, forKey: .endpointUrl)
        jobName = try container.decodeIfPresent(String.self, forKey: .jobName)
        bearerToken = try container.decodeIfPresent(String.self, forKey: .bearerToken)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if endpointUrl != nil { try container.encode(endpointUrl, forKey: .endpointUrl) }
        if jobName != nil { try container.encode(jobName, forKey: .jobName) }
        if bearerToken != nil { try container.encode(bearerToken, forKey: .bearerToken) }
    }
}

public class DataDogLoggingIntegrationRequest : LoggingIntegrationRequest
{
    public var site:String?
    public var serviceName:String?
    public var environment:String?
    public var apiKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case site
        case serviceName
        case environment
        case apiKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        site = try container.decodeIfPresent(String.self, forKey: .site)
        serviceName = try container.decodeIfPresent(String.self, forKey: .serviceName)
        environment = try container.decodeIfPresent(String.self, forKey: .environment)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if site != nil { try container.encode(site, forKey: .site) }
        if serviceName != nil { try container.encode(serviceName, forKey: .serviceName) }
        if environment != nil { try container.encode(environment, forKey: .environment) }
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
    }
}

public class InternalKafkaLoggingIntegrationRequest : LoggingIntegrationRequest
{
    public var bootstrapServers:String?
    public var topic:String?
    public var securityProtocol:String?
    public var saslUsername:String?
    public var saslPassword:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case bootstrapServers
        case topic
        case securityProtocol
        case saslUsername
        case saslPassword
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        bootstrapServers = try container.decodeIfPresent(String.self, forKey: .bootstrapServers)
        topic = try container.decodeIfPresent(String.self, forKey: .topic)
        securityProtocol = try container.decodeIfPresent(String.self, forKey: .securityProtocol)
        saslUsername = try container.decodeIfPresent(String.self, forKey: .saslUsername)
        saslPassword = try container.decodeIfPresent(String.self, forKey: .saslPassword)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if bootstrapServers != nil { try container.encode(bootstrapServers, forKey: .bootstrapServers) }
        if topic != nil { try container.encode(topic, forKey: .topic) }
        if securityProtocol != nil { try container.encode(securityProtocol, forKey: .securityProtocol) }
        if saslUsername != nil { try container.encode(saslUsername, forKey: .saslUsername) }
        if saslPassword != nil { try container.encode(saslPassword, forKey: .saslPassword) }
    }
}

public class ElasticSearchLoggingIntegrationRequest : LoggingIntegrationRequest
{
    public var uri:String?
    public var index:String?
    public var username:String?
    public var password:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case uri
        case index
        case username
        case password
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        uri = try container.decodeIfPresent(String.self, forKey: .uri)
        index = try container.decodeIfPresent(String.self, forKey: .index)
        username = try container.decodeIfPresent(String.self, forKey: .username)
        password = try container.decodeIfPresent(String.self, forKey: .password)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if uri != nil { try container.encode(uri, forKey: .uri) }
        if index != nil { try container.encode(index, forKey: .index) }
        if username != nil { try container.encode(username, forKey: .username) }
        if password != nil { try container.encode(password, forKey: .password) }
    }
}

public class ZabbixLoggingIntegrationRequest : LoggingIntegrationRequest
{
    public var apiUrl:String?
    public var hostName:String?
    public var apiToken:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case apiUrl
        case hostName
        case apiToken
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        apiUrl = try container.decodeIfPresent(String.self, forKey: .apiUrl)
        hostName = try container.decodeIfPresent(String.self, forKey: .hostName)
        apiToken = try container.decodeIfPresent(String.self, forKey: .apiToken)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if apiUrl != nil { try container.encode(apiUrl, forKey: .apiUrl) }
        if hostName != nil { try container.encode(hostName, forKey: .hostName) }
        if apiToken != nil { try container.encode(apiToken, forKey: .apiToken) }
    }
}

public class SplunkLoggingIntegrationRequest : LoggingIntegrationRequest
{
    public var hecEndpointUrl:String?
    public var index:String?
    public var hecToken:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case hecEndpointUrl
        case index
        case hecToken
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        hecEndpointUrl = try container.decodeIfPresent(String.self, forKey: .hecEndpointUrl)
        index = try container.decodeIfPresent(String.self, forKey: .index)
        hecToken = try container.decodeIfPresent(String.self, forKey: .hecToken)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if hecEndpointUrl != nil { try container.encode(hecEndpointUrl, forKey: .hecEndpointUrl) }
        if index != nil { try container.encode(index, forKey: .index) }
        if hecToken != nil { try container.encode(hecToken, forKey: .hecToken) }
    }
}

public class AzureOtelLoggingIntegrationRequest : LoggingIntegrationRequest
{
    public var endpointUrl:String?
    public var resourceName:String?
    public var connectionString:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case endpointUrl
        case resourceName
        case connectionString
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        endpointUrl = try container.decodeIfPresent(String.self, forKey: .endpointUrl)
        resourceName = try container.decodeIfPresent(String.self, forKey: .resourceName)
        connectionString = try container.decodeIfPresent(String.self, forKey: .connectionString)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if endpointUrl != nil { try container.encode(endpointUrl, forKey: .endpointUrl) }
        if resourceName != nil { try container.encode(resourceName, forKey: .resourceName) }
        if connectionString != nil { try container.encode(connectionString, forKey: .connectionString) }
    }
}

public class KibanaLoggingIntegrationRequest : LoggingIntegrationRequest
{
    public var uri:String?
    public var spaceId:String?
    public var apiKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case uri
        case spaceId
        case apiKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        uri = try container.decodeIfPresent(String.self, forKey: .uri)
        spaceId = try container.decodeIfPresent(String.self, forKey: .spaceId)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if uri != nil { try container.encode(uri, forKey: .uri) }
        if spaceId != nil { try container.encode(spaceId, forKey: .spaceId) }
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
    }
}

public class LocalFileLoggingIntegrationRequest : LoggingIntegrationRequest
{
    public var rootPath:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case rootPath
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rootPath = try container.decodeIfPresent(String.self, forKey: .rootPath)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if rootPath != nil { try container.encode(rootPath, forKey: .rootPath) }
    }
}

public class OktaMembershipIntegrationRequest : MembershipIntegrationRequest
{
    public var domain:String?
    public var clientId:String?
    public var clientSecret:String?
    public var oAuthModes:[OAuthModeConfig]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case domain
        case clientId
        case clientSecret
        case oAuthModes
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        domain = try container.decodeIfPresent(String.self, forKey: .domain)
        clientId = try container.decodeIfPresent(String.self, forKey: .clientId)
        clientSecret = try container.decodeIfPresent(String.self, forKey: .clientSecret)
        oAuthModes = try container.decodeIfPresent([OAuthModeConfig].self, forKey: .oAuthModes) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if domain != nil { try container.encode(domain, forKey: .domain) }
        if clientId != nil { try container.encode(clientId, forKey: .clientId) }
        if clientSecret != nil { try container.encode(clientSecret, forKey: .clientSecret) }
        if oAuthModes != nil { try container.encode(oAuthModes, forKey: .oAuthModes) }
    }
}

public class XMembershipIntegrationRequest : MembershipIntegrationRequest
{
    public var apiKey:String?
    public var apiSecretKey:String?
    public var oAuthModes:[OAuthModeConfig]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case apiKey
        case apiSecretKey
        case oAuthModes
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        apiSecretKey = try container.decodeIfPresent(String.self, forKey: .apiSecretKey)
        oAuthModes = try container.decodeIfPresent([OAuthModeConfig].self, forKey: .oAuthModes) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
        if apiSecretKey != nil { try container.encode(apiSecretKey, forKey: .apiSecretKey) }
        if oAuthModes != nil { try container.encode(oAuthModes, forKey: .oAuthModes) }
    }
}

public class GoogleMembershipIntegrationRequest : MembershipIntegrationRequest
{
    public var clientId:String?
    public var clientSecret:String?
    public var oAuthModes:[OAuthModeConfig]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case clientId
        case clientSecret
        case oAuthModes
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        clientId = try container.decodeIfPresent(String.self, forKey: .clientId)
        clientSecret = try container.decodeIfPresent(String.self, forKey: .clientSecret)
        oAuthModes = try container.decodeIfPresent([OAuthModeConfig].self, forKey: .oAuthModes) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if clientId != nil { try container.encode(clientId, forKey: .clientId) }
        if clientSecret != nil { try container.encode(clientSecret, forKey: .clientSecret) }
        if oAuthModes != nil { try container.encode(oAuthModes, forKey: .oAuthModes) }
    }
}

public class MicrosoftMembershipIntegrationRequest : MembershipIntegrationRequest
{
    public var tenantId:String?
    public var clientId:String?
    public var clientSecret:String?
    public var oAuthModes:[OAuthModeConfig]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case tenantId
        case clientId
        case clientSecret
        case oAuthModes
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tenantId = try container.decodeIfPresent(String.self, forKey: .tenantId)
        clientId = try container.decodeIfPresent(String.self, forKey: .clientId)
        clientSecret = try container.decodeIfPresent(String.self, forKey: .clientSecret)
        oAuthModes = try container.decodeIfPresent([OAuthModeConfig].self, forKey: .oAuthModes) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if tenantId != nil { try container.encode(tenantId, forKey: .tenantId) }
        if clientId != nil { try container.encode(clientId, forKey: .clientId) }
        if clientSecret != nil { try container.encode(clientSecret, forKey: .clientSecret) }
        if oAuthModes != nil { try container.encode(oAuthModes, forKey: .oAuthModes) }
    }
}

public class GitHubMembershipIntegrationRequest : MembershipIntegrationRequest
{
    public var clientId:String?
    public var clientSecret:String?
    public var oAuthModes:[OAuthModeConfig]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case clientId
        case clientSecret
        case oAuthModes
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        clientId = try container.decodeIfPresent(String.self, forKey: .clientId)
        clientSecret = try container.decodeIfPresent(String.self, forKey: .clientSecret)
        oAuthModes = try container.decodeIfPresent([OAuthModeConfig].self, forKey: .oAuthModes) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if clientId != nil { try container.encode(clientId, forKey: .clientId) }
        if clientSecret != nil { try container.encode(clientSecret, forKey: .clientSecret) }
        if oAuthModes != nil { try container.encode(oAuthModes, forKey: .oAuthModes) }
    }
}

public class MetaMembershipIntegrationRequest : MembershipIntegrationRequest
{
    public var appId:String?
    public var appSecret:String?
    public var oAuthModes:[OAuthModeConfig]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case appId
        case appSecret
        case oAuthModes
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        appId = try container.decodeIfPresent(String.self, forKey: .appId)
        appSecret = try container.decodeIfPresent(String.self, forKey: .appSecret)
        oAuthModes = try container.decodeIfPresent([OAuthModeConfig].self, forKey: .oAuthModes) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if appId != nil { try container.encode(appId, forKey: .appId) }
        if appSecret != nil { try container.encode(appSecret, forKey: .appSecret) }
        if oAuthModes != nil { try container.encode(oAuthModes, forKey: .oAuthModes) }
    }
}

public class AppleMembershipIntegrationRequest : MembershipIntegrationRequest
{
    public var teamId:String?
    public var appBundleId:String?
    public var serviceId:String?
    public var keyId:String?
    public var privateKey:String?
    public var isProduction:Bool?
    public var oAuthModes:[OAuthModeConfig]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case teamId
        case appBundleId
        case serviceId
        case keyId
        case privateKey
        case isProduction
        case oAuthModes
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        teamId = try container.decodeIfPresent(String.self, forKey: .teamId)
        appBundleId = try container.decodeIfPresent(String.self, forKey: .appBundleId)
        serviceId = try container.decodeIfPresent(String.self, forKey: .serviceId)
        keyId = try container.decodeIfPresent(String.self, forKey: .keyId)
        privateKey = try container.decodeIfPresent(String.self, forKey: .privateKey)
        isProduction = try container.decodeIfPresent(Bool.self, forKey: .isProduction)
        oAuthModes = try container.decodeIfPresent([OAuthModeConfig].self, forKey: .oAuthModes) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if teamId != nil { try container.encode(teamId, forKey: .teamId) }
        if appBundleId != nil { try container.encode(appBundleId, forKey: .appBundleId) }
        if serviceId != nil { try container.encode(serviceId, forKey: .serviceId) }
        if keyId != nil { try container.encode(keyId, forKey: .keyId) }
        if privateKey != nil { try container.encode(privateKey, forKey: .privateKey) }
        if isProduction != nil { try container.encode(isProduction, forKey: .isProduction) }
        if oAuthModes != nil { try container.encode(oAuthModes, forKey: .oAuthModes) }
    }
}

public class LemonSqueezyPaymentIntegrationRequest : PaymentIntegrationRequest
{
    public var storeId:String?
    public var apiKey:String?
    public var webhookSigningSecret:String?
    public var isTestMode:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case storeId
        case apiKey
        case webhookSigningSecret
        case isTestMode
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        storeId = try container.decodeIfPresent(String.self, forKey: .storeId)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        webhookSigningSecret = try container.decodeIfPresent(String.self, forKey: .webhookSigningSecret)
        isTestMode = try container.decodeIfPresent(Bool.self, forKey: .isTestMode)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if storeId != nil { try container.encode(storeId, forKey: .storeId) }
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
        if webhookSigningSecret != nil { try container.encode(webhookSigningSecret, forKey: .webhookSigningSecret) }
        if isTestMode != nil { try container.encode(isTestMode, forKey: .isTestMode) }
    }
}

public class AdyenPaymentIntegrationRequest : PaymentIntegrationRequest
{
    public var merchantAccount:String?
    public var apiKey:String?
    public var environment:String?
    public var webhookId:String?
    public var webhookHmacKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case merchantAccount
        case apiKey
        case environment
        case webhookId
        case webhookHmacKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        merchantAccount = try container.decodeIfPresent(String.self, forKey: .merchantAccount)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        environment = try container.decodeIfPresent(String.self, forKey: .environment)
        webhookId = try container.decodeIfPresent(String.self, forKey: .webhookId)
        webhookHmacKey = try container.decodeIfPresent(String.self, forKey: .webhookHmacKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if merchantAccount != nil { try container.encode(merchantAccount, forKey: .merchantAccount) }
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
        if environment != nil { try container.encode(environment, forKey: .environment) }
        if webhookId != nil { try container.encode(webhookId, forKey: .webhookId) }
        if webhookHmacKey != nil { try container.encode(webhookHmacKey, forKey: .webhookHmacKey) }
    }
}

public class MolliePaymentIntegrationRequest : PaymentIntegrationRequest
{
    public var profileId:String?
    public var apiKey:String?
    public var isTestMode:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case profileId
        case apiKey
        case isTestMode
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        profileId = try container.decodeIfPresent(String.self, forKey: .profileId)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        isTestMode = try container.decodeIfPresent(Bool.self, forKey: .isTestMode)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if profileId != nil { try container.encode(profileId, forKey: .profileId) }
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
        if isTestMode != nil { try container.encode(isTestMode, forKey: .isTestMode) }
    }
}

public class PaddlePaymentIntegrationRequest : PaymentIntegrationRequest
{
    public var apiKey:String?
    public var webhookEndpointSecretKey:String?
    public var environment:String?
    public var clientSideToken:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case apiKey
        case webhookEndpointSecretKey
        case environment
        case clientSideToken
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        webhookEndpointSecretKey = try container.decodeIfPresent(String.self, forKey: .webhookEndpointSecretKey)
        environment = try container.decodeIfPresent(String.self, forKey: .environment)
        clientSideToken = try container.decodeIfPresent(String.self, forKey: .clientSideToken)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
        if webhookEndpointSecretKey != nil { try container.encode(webhookEndpointSecretKey, forKey: .webhookEndpointSecretKey) }
        if environment != nil { try container.encode(environment, forKey: .environment) }
        if clientSideToken != nil { try container.encode(clientSideToken, forKey: .clientSideToken) }
    }
}

public class PayPalPaymentIntegrationRequest : PaymentIntegrationRequest
{
    public var clientId:String?
    public var clientSecret:String?
    public var environment:String?
    public var brandName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case clientId
        case clientSecret
        case environment
        case brandName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        clientId = try container.decodeIfPresent(String.self, forKey: .clientId)
        clientSecret = try container.decodeIfPresent(String.self, forKey: .clientSecret)
        environment = try container.decodeIfPresent(String.self, forKey: .environment)
        brandName = try container.decodeIfPresent(String.self, forKey: .brandName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if clientId != nil { try container.encode(clientId, forKey: .clientId) }
        if clientSecret != nil { try container.encode(clientSecret, forKey: .clientSecret) }
        if environment != nil { try container.encode(environment, forKey: .environment) }
        if brandName != nil { try container.encode(brandName, forKey: .brandName) }
    }
}

public class StripePaymentIntegrationRequest : PaymentIntegrationRequest
{
    public var publishableKey:String?
    public var secretKey:String?
    public var webhookSigningSecret:String?
    public var webhookEndpointId:String?
    public var defaultCurrency:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case publishableKey
        case secretKey
        case webhookSigningSecret
        case webhookEndpointId
        case defaultCurrency
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        publishableKey = try container.decodeIfPresent(String.self, forKey: .publishableKey)
        secretKey = try container.decodeIfPresent(String.self, forKey: .secretKey)
        webhookSigningSecret = try container.decodeIfPresent(String.self, forKey: .webhookSigningSecret)
        webhookEndpointId = try container.decodeIfPresent(String.self, forKey: .webhookEndpointId)
        defaultCurrency = try container.decodeIfPresent(String.self, forKey: .defaultCurrency)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if publishableKey != nil { try container.encode(publishableKey, forKey: .publishableKey) }
        if secretKey != nil { try container.encode(secretKey, forKey: .secretKey) }
        if webhookSigningSecret != nil { try container.encode(webhookSigningSecret, forKey: .webhookSigningSecret) }
        if webhookEndpointId != nil { try container.encode(webhookEndpointId, forKey: .webhookEndpointId) }
        if defaultCurrency != nil { try container.encode(defaultCurrency, forKey: .defaultCurrency) }
    }
}

public class AppleInAppPaymentIntegrationRequest : PaymentIntegrationRequest
{
    public var merchantIdentifier:String?
    public var merchantDomain:String?
    public var displayName:String?
    public var merchantIdentityCertificateP12Base64:String?
    public var merchantIdentityCertificatePassword:String?
    public var paymentProcessingCertificateP12Base64:String?
    public var paymentProcessingCertificatePassword:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case merchantIdentifier
        case merchantDomain
        case displayName
        case merchantIdentityCertificateP12Base64
        case merchantIdentityCertificatePassword
        case paymentProcessingCertificateP12Base64
        case paymentProcessingCertificatePassword
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        merchantIdentifier = try container.decodeIfPresent(String.self, forKey: .merchantIdentifier)
        merchantDomain = try container.decodeIfPresent(String.self, forKey: .merchantDomain)
        displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
        merchantIdentityCertificateP12Base64 = try container.decodeIfPresent(String.self, forKey: .merchantIdentityCertificateP12Base64)
        merchantIdentityCertificatePassword = try container.decodeIfPresent(String.self, forKey: .merchantIdentityCertificatePassword)
        paymentProcessingCertificateP12Base64 = try container.decodeIfPresent(String.self, forKey: .paymentProcessingCertificateP12Base64)
        paymentProcessingCertificatePassword = try container.decodeIfPresent(String.self, forKey: .paymentProcessingCertificatePassword)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if merchantIdentifier != nil { try container.encode(merchantIdentifier, forKey: .merchantIdentifier) }
        if merchantDomain != nil { try container.encode(merchantDomain, forKey: .merchantDomain) }
        if displayName != nil { try container.encode(displayName, forKey: .displayName) }
        if merchantIdentityCertificateP12Base64 != nil { try container.encode(merchantIdentityCertificateP12Base64, forKey: .merchantIdentityCertificateP12Base64) }
        if merchantIdentityCertificatePassword != nil { try container.encode(merchantIdentityCertificatePassword, forKey: .merchantIdentityCertificatePassword) }
        if paymentProcessingCertificateP12Base64 != nil { try container.encode(paymentProcessingCertificateP12Base64, forKey: .paymentProcessingCertificateP12Base64) }
        if paymentProcessingCertificatePassword != nil { try container.encode(paymentProcessingCertificatePassword, forKey: .paymentProcessingCertificatePassword) }
    }
}

public class GoogleInAppPaymentIntegrationRequest : PaymentIntegrationRequest
{
    public var merchantId:String?
    public var merchantName:String?
    public var gateway:String?
    public var privateKeyOrToken:String?
    public var gatewayMerchantId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case merchantId
        case merchantName
        case gateway
        case privateKeyOrToken
        case gatewayMerchantId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        merchantId = try container.decodeIfPresent(String.self, forKey: .merchantId)
        merchantName = try container.decodeIfPresent(String.self, forKey: .merchantName)
        gateway = try container.decodeIfPresent(String.self, forKey: .gateway)
        privateKeyOrToken = try container.decodeIfPresent(String.self, forKey: .privateKeyOrToken)
        gatewayMerchantId = try container.decodeIfPresent(String.self, forKey: .gatewayMerchantId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if merchantId != nil { try container.encode(merchantId, forKey: .merchantId) }
        if merchantName != nil { try container.encode(merchantName, forKey: .merchantName) }
        if gateway != nil { try container.encode(gateway, forKey: .gateway) }
        if privateKeyOrToken != nil { try container.encode(privateKeyOrToken, forKey: .privateKeyOrToken) }
        if gatewayMerchantId != nil { try container.encode(gatewayMerchantId, forKey: .gatewayMerchantId) }
    }
}

public class EdgeWebPushIntegrationRequest : PushIntegrationRequest
{
    public var vapidPublicKey:String?
    public var vapidPrivateKey:String?
    public var subject:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case vapidPublicKey
        case vapidPrivateKey
        case subject
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        vapidPublicKey = try container.decodeIfPresent(String.self, forKey: .vapidPublicKey)
        vapidPrivateKey = try container.decodeIfPresent(String.self, forKey: .vapidPrivateKey)
        subject = try container.decodeIfPresent(String.self, forKey: .subject)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if vapidPublicKey != nil { try container.encode(vapidPublicKey, forKey: .vapidPublicKey) }
        if vapidPrivateKey != nil { try container.encode(vapidPrivateKey, forKey: .vapidPrivateKey) }
        if subject != nil { try container.encode(subject, forKey: .subject) }
    }
}

public class ChromePluginPushIntegrationRequest : PushIntegrationRequest
{
    public var extensionId:String?
    public var vapidPublicKey:String?
    public var vapidPrivateKey:String?
    public var subject:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case extensionId
        case vapidPublicKey
        case vapidPrivateKey
        case subject
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        extensionId = try container.decodeIfPresent(String.self, forKey: .extensionId)
        vapidPublicKey = try container.decodeIfPresent(String.self, forKey: .vapidPublicKey)
        vapidPrivateKey = try container.decodeIfPresent(String.self, forKey: .vapidPrivateKey)
        subject = try container.decodeIfPresent(String.self, forKey: .subject)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if extensionId != nil { try container.encode(extensionId, forKey: .extensionId) }
        if vapidPublicKey != nil { try container.encode(vapidPublicKey, forKey: .vapidPublicKey) }
        if vapidPrivateKey != nil { try container.encode(vapidPrivateKey, forKey: .vapidPrivateKey) }
        if subject != nil { try container.encode(subject, forKey: .subject) }
    }
}

public class SafariPushIntegrationRequest : PushIntegrationRequest
{
    public var websitePushId:String?
    public var certificateP12Base64:String?
    public var certificatePassword:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case websitePushId
        case certificateP12Base64
        case certificatePassword
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        websitePushId = try container.decodeIfPresent(String.self, forKey: .websitePushId)
        certificateP12Base64 = try container.decodeIfPresent(String.self, forKey: .certificateP12Base64)
        certificatePassword = try container.decodeIfPresent(String.self, forKey: .certificatePassword)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if websitePushId != nil { try container.encode(websitePushId, forKey: .websitePushId) }
        if certificateP12Base64 != nil { try container.encode(certificateP12Base64, forKey: .certificateP12Base64) }
        if certificatePassword != nil { try container.encode(certificatePassword, forKey: .certificatePassword) }
    }
}

public class ChromeWebPushIntegrationRequest : PushIntegrationRequest
{
    public var vapidPublicKey:String?
    public var vapidPrivateKey:String?
    public var subject:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case vapidPublicKey
        case vapidPrivateKey
        case subject
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        vapidPublicKey = try container.decodeIfPresent(String.self, forKey: .vapidPublicKey)
        vapidPrivateKey = try container.decodeIfPresent(String.self, forKey: .vapidPrivateKey)
        subject = try container.decodeIfPresent(String.self, forKey: .subject)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if vapidPublicKey != nil { try container.encode(vapidPublicKey, forKey: .vapidPublicKey) }
        if vapidPrivateKey != nil { try container.encode(vapidPrivateKey, forKey: .vapidPrivateKey) }
        if subject != nil { try container.encode(subject, forKey: .subject) }
    }
}

public class FirefoxWebPushIntegrationRequest : PushIntegrationRequest
{
    public var vapidPublicKey:String?
    public var vapidPrivateKey:String?
    public var subject:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case vapidPublicKey
        case vapidPrivateKey
        case subject
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        vapidPublicKey = try container.decodeIfPresent(String.self, forKey: .vapidPublicKey)
        vapidPrivateKey = try container.decodeIfPresent(String.self, forKey: .vapidPrivateKey)
        subject = try container.decodeIfPresent(String.self, forKey: .subject)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if vapidPublicKey != nil { try container.encode(vapidPublicKey, forKey: .vapidPublicKey) }
        if vapidPrivateKey != nil { try container.encode(vapidPrivateKey, forKey: .vapidPrivateKey) }
        if subject != nil { try container.encode(subject, forKey: .subject) }
    }
}

public class AndroidFirebasePushIntegrationRequest : PushIntegrationRequest
{
    public var projectId:String?
    public var clientEmail:String?
    public var serviceAccountJson:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case projectId
        case clientEmail
        case serviceAccountJson
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        projectId = try container.decodeIfPresent(String.self, forKey: .projectId)
        clientEmail = try container.decodeIfPresent(String.self, forKey: .clientEmail)
        serviceAccountJson = try container.decodeIfPresent(String.self, forKey: .serviceAccountJson)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if projectId != nil { try container.encode(projectId, forKey: .projectId) }
        if clientEmail != nil { try container.encode(clientEmail, forKey: .clientEmail) }
        if serviceAccountJson != nil { try container.encode(serviceAccountJson, forKey: .serviceAccountJson) }
    }
}

public class AppleApnsPushIntegrationRequest : PushIntegrationRequest
{
    public var teamId:String?
    public var appBundleId:String?
    public var keyId:String?
    public var privateKey:String?
    public var isProduction:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case teamId
        case appBundleId
        case keyId
        case privateKey
        case isProduction
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        teamId = try container.decodeIfPresent(String.self, forKey: .teamId)
        appBundleId = try container.decodeIfPresent(String.self, forKey: .appBundleId)
        keyId = try container.decodeIfPresent(String.self, forKey: .keyId)
        privateKey = try container.decodeIfPresent(String.self, forKey: .privateKey)
        isProduction = try container.decodeIfPresent(Bool.self, forKey: .isProduction)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if teamId != nil { try container.encode(teamId, forKey: .teamId) }
        if appBundleId != nil { try container.encode(appBundleId, forKey: .appBundleId) }
        if keyId != nil { try container.encode(keyId, forKey: .keyId) }
        if privateKey != nil { try container.encode(privateKey, forKey: .privateKey) }
        if isProduction != nil { try container.encode(isProduction, forKey: .isProduction) }
    }
}

public class AwsLambdaCodeIntegrationRequest : CodeIntegrationRequest
{
    public var integrationType:AwsLambdaIntegrationType?
    public var region:String?
    public var roleArn:String?
    public var externalId:String?
    public var accessKey:String?
    public var secretKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case integrationType
        case region
        case roleArn
        case externalId
        case accessKey
        case secretKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        integrationType = try container.decodeIfPresent(AwsLambdaIntegrationType.self, forKey: .integrationType)
        region = try container.decodeIfPresent(String.self, forKey: .region)
        roleArn = try container.decodeIfPresent(String.self, forKey: .roleArn)
        externalId = try container.decodeIfPresent(String.self, forKey: .externalId)
        accessKey = try container.decodeIfPresent(String.self, forKey: .accessKey)
        secretKey = try container.decodeIfPresent(String.self, forKey: .secretKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if integrationType != nil { try container.encode(integrationType, forKey: .integrationType) }
        if region != nil { try container.encode(region, forKey: .region) }
        if roleArn != nil { try container.encode(roleArn, forKey: .roleArn) }
        if externalId != nil { try container.encode(externalId, forKey: .externalId) }
        if accessKey != nil { try container.encode(accessKey, forKey: .accessKey) }
        if secretKey != nil { try container.encode(secretKey, forKey: .secretKey) }
    }
}

public class AzureFunctionsCodeIntegrationRequest : CodeIntegrationRequest
{
    public var functionAppName:String?
    public var resourceGroup:String?
    public var connectionStringOrKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case functionAppName
        case resourceGroup
        case connectionStringOrKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        functionAppName = try container.decodeIfPresent(String.self, forKey: .functionAppName)
        resourceGroup = try container.decodeIfPresent(String.self, forKey: .resourceGroup)
        connectionStringOrKey = try container.decodeIfPresent(String.self, forKey: .connectionStringOrKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if functionAppName != nil { try container.encode(functionAppName, forKey: .functionAppName) }
        if resourceGroup != nil { try container.encode(resourceGroup, forKey: .resourceGroup) }
        if connectionStringOrKey != nil { try container.encode(connectionStringOrKey, forKey: .connectionStringOrKey) }
    }
}

public class GoogleCloudFunctionsCodeIntegrationRequest : CodeIntegrationRequest
{
    public var projectId:String?
    public var region:String?
    public var serviceAccountJsonKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case projectId
        case region
        case serviceAccountJsonKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        projectId = try container.decodeIfPresent(String.self, forKey: .projectId)
        region = try container.decodeIfPresent(String.self, forKey: .region)
        serviceAccountJsonKey = try container.decodeIfPresent(String.self, forKey: .serviceAccountJsonKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if projectId != nil { try container.encode(projectId, forKey: .projectId) }
        if region != nil { try container.encode(region, forKey: .region) }
        if serviceAccountJsonKey != nil { try container.encode(serviceAccountJsonKey, forKey: .serviceAccountJsonKey) }
    }
}

public class OllamaLlmIntegrationRequest : LlmIntegrationRequest
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class OpenRouterLlmIntegrationRequest : LlmIntegrationRequest, ILlmApiKeyRequest
{
    public var apiKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case apiKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
    }
}

public class MistralLlmIntegrationRequest : LlmIntegrationRequest, ILlmApiKeyRequest
{
    public var apiKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case apiKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
    }
}

public class GrokLlmIntegrationRequest : LlmIntegrationRequest, ILlmApiKeyRequest
{
    public var apiKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case apiKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
    }
}

public class GroqLlmIntegrationRequest : LlmIntegrationRequest, ILlmApiKeyRequest
{
    public var apiKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case apiKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
    }
}

public class GoogleLlmIntegrationRequest : LlmIntegrationRequest, ILlmApiKeyRequest
{
    public var apiKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case apiKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
    }
}

public class AnthropicLlmIntegrationRequest : LlmIntegrationRequest, ILlmApiKeyRequest
{
    public var apiKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case apiKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
    }
}

public class OpenAiLlmIntegrationRequest : LlmIntegrationRequest, ILlmApiKeyRequest
{
    public var apiKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case apiKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
    }
}

public class PlaywrightMcpIntegrationRequest : McpIntegrationRequest
{
    public var command:String?
    public var args:[String]?
    public var headless:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case command
        case args
        case headless
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        command = try container.decodeIfPresent(String.self, forKey: .command)
        args = try container.decodeIfPresent([String].self, forKey: .args) ?? []
        headless = try container.decodeIfPresent(String.self, forKey: .headless)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if command != nil { try container.encode(command, forKey: .command) }
        if args != nil { try container.encode(args, forKey: .args) }
        if headless != nil { try container.encode(headless, forKey: .headless) }
    }
}

public class MongoDbMcpIntegrationRequest : McpIntegrationRequest
{
    public var command:String?
    public var args:[String]?
    public var connectionString:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case command
        case args
        case connectionString
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        command = try container.decodeIfPresent(String.self, forKey: .command)
        args = try container.decodeIfPresent([String].self, forKey: .args) ?? []
        connectionString = try container.decodeIfPresent(String.self, forKey: .connectionString)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if command != nil { try container.encode(command, forKey: .command) }
        if args != nil { try container.encode(args, forKey: .args) }
        if connectionString != nil { try container.encode(connectionString, forKey: .connectionString) }
    }
}

public class GitHubMcpIntegrationRequest : McpIntegrationRequest
{
    public var serverUrl:String?
    public var accessToken:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case serverUrl
        case accessToken
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        serverUrl = try container.decodeIfPresent(String.self, forKey: .serverUrl)
        accessToken = try container.decodeIfPresent(String.self, forKey: .accessToken)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if serverUrl != nil { try container.encode(serverUrl, forKey: .serverUrl) }
        if accessToken != nil { try container.encode(accessToken, forKey: .accessToken) }
    }
}

public class StripeMcpIntegrationRequest : McpIntegrationRequest
{
    public var serverUrl:String?
    public var apiKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case serverUrl
        case apiKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        serverUrl = try container.decodeIfPresent(String.self, forKey: .serverUrl)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if serverUrl != nil { try container.encode(serverUrl, forKey: .serverUrl) }
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
    }
}

public class BraveSearchMcpIntegrationRequest : McpIntegrationRequest
{
    public var serverUrl:String?
    public var apiKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case serverUrl
        case apiKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        serverUrl = try container.decodeIfPresent(String.self, forKey: .serverUrl)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if serverUrl != nil { try container.encode(serverUrl, forKey: .serverUrl) }
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
    }
}

public class ObsidianMcpIntegrationRequest : McpIntegrationRequest
{
    public var command:String?
    public var args:[String]?
    public var environmentVariables:[String:String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case command
        case args
        case environmentVariables
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        command = try container.decodeIfPresent(String.self, forKey: .command)
        args = try container.decodeIfPresent([String].self, forKey: .args) ?? []
        environmentVariables = try container.decodeIfPresent([String:String].self, forKey: .environmentVariables) ?? [:]
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if command != nil { try container.encode(command, forKey: .command) }
        if args != nil { try container.encode(args, forKey: .args) }
        if environmentVariables != nil { try container.encode(environmentVariables, forKey: .environmentVariables) }
    }
}

// @DataContract
public class EmailTemplateDto : TemplateDto, IBindableContract
{
    // @DataMember
    public var translations:IReadOnlySet<EmailMessageTranslationDto>?

    // @DataMember
    public var staticAttachments:IReadOnlySet<FileResourceRefDto>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case translations
        case staticAttachments
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        translations = try container.decodeIfPresent(IReadOnlySet<EmailMessageTranslationDto>.self, forKey: .translations)
        staticAttachments = try container.decodeIfPresent(IReadOnlySet<FileResourceRefDto>.self, forKey: .staticAttachments)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if translations != nil { try container.encode(translations, forKey: .translations) }
        if staticAttachments != nil { try container.encode(staticAttachments, forKey: .staticAttachments) }
    }
}

// @DataContract
public class PushTemplateDto : TemplateDto, IHasRazorTemplateCode, IBindableContract
{
    // @DataMember
    public var translations:IReadOnlySet<PushMessageTranslationDto>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case translations
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        translations = try container.decodeIfPresent(IReadOnlySet<PushMessageTranslationDto>.self, forKey: .translations)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if translations != nil { try container.encode(translations, forKey: .translations) }
    }
}

// @DataContract
public class SmsTemplateDto : TemplateDto, IHasRazorTemplateCode, IBindableContract
{
    // @DataMember
    public var translations:IReadOnlySet<SmsMessageTranslationDto>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case translations
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        translations = try container.decodeIfPresent(IReadOnlySet<SmsMessageTranslationDto>.self, forKey: .translations)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if translations != nil { try container.encode(translations, forKey: .translations) }
    }
}

// @DataContract
public class SystemEmailTemplateDto : EmailTemplateDto, IHasDatabaseId
{
    // @DataMember
    public var imagePreview:String?

    // @DataMember
    public var theme:SystemEmailTemplateTheme?

    // @DataMember
    public var systemGroup:String?

    // @DataMember
    public var systemTags:[String]?

    // @DataMember
    public var forTrigger:TriggerType?

    // @DataMember
    public var hiddenSystemEmailTemplate:Bool?

    // @DataMember
    public var id:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case imagePreview
        case theme
        case systemGroup
        case systemTags
        case forTrigger
        case hiddenSystemEmailTemplate
        case id
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        imagePreview = try container.decodeIfPresent(String.self, forKey: .imagePreview)
        theme = try container.decodeIfPresent(SystemEmailTemplateTheme.self, forKey: .theme)
        systemGroup = try container.decodeIfPresent(String.self, forKey: .systemGroup)
        systemTags = try container.decodeIfPresent([String].self, forKey: .systemTags) ?? []
        forTrigger = try container.decodeIfPresent(TriggerType.self, forKey: .forTrigger)
        hiddenSystemEmailTemplate = try container.decodeIfPresent(Bool.self, forKey: .hiddenSystemEmailTemplate)
        id = try container.decodeIfPresent(String.self, forKey: .id)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if imagePreview != nil { try container.encode(imagePreview, forKey: .imagePreview) }
        if theme != nil { try container.encode(theme, forKey: .theme) }
        if systemGroup != nil { try container.encode(systemGroup, forKey: .systemGroup) }
        if systemTags != nil { try container.encode(systemTags, forKey: .systemTags) }
        if forTrigger != nil { try container.encode(forTrigger, forKey: .forTrigger) }
        if hiddenSystemEmailTemplate != nil { try container.encode(hiddenSystemEmailTemplate, forKey: .hiddenSystemEmailTemplate) }
        if id != nil { try container.encode(id, forKey: .id) }
    }
}

// @DataContract
public class TriggerActionEmailDto : TriggerActionDto
{
    // @DataMember
    public var templateId:String?

    // @DataMember
    public var deliverySettings:EmailCampaignDeliverySettingsDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case templateId
        case deliverySettings
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        templateId = try container.decodeIfPresent(String.self, forKey: .templateId)
        deliverySettings = try container.decodeIfPresent(EmailCampaignDeliverySettingsDto.self, forKey: .deliverySettings)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if templateId != nil { try container.encode(templateId, forKey: .templateId) }
        if deliverySettings != nil { try container.encode(deliverySettings, forKey: .deliverySettings) }
    }
}

// @DataContract
public class TriggerActionPushDto : TriggerActionDto
{
    // @DataMember
    public var templateId:String?

    // @DataMember
    public var deliverySettings:PushCampaignDeliverySettingsDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case templateId
        case deliverySettings
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        templateId = try container.decodeIfPresent(String.self, forKey: .templateId)
        deliverySettings = try container.decodeIfPresent(PushCampaignDeliverySettingsDto.self, forKey: .deliverySettings)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if templateId != nil { try container.encode(templateId, forKey: .templateId) }
        if deliverySettings != nil { try container.encode(deliverySettings, forKey: .deliverySettings) }
    }
}

// @DataContract
public class TriggerActionCodeDto : TriggerActionDto
{
    // @DataMember
    public var functionId:String?

    // @DataMember
    public var deliverySettings:CodeDeliverySettingsDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case functionId
        case deliverySettings
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        functionId = try container.decodeIfPresent(String.self, forKey: .functionId)
        deliverySettings = try container.decodeIfPresent(CodeDeliverySettingsDto.self, forKey: .deliverySettings)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if functionId != nil { try container.encode(functionId, forKey: .functionId) }
        if deliverySettings != nil { try container.encode(deliverySettings, forKey: .deliverySettings) }
    }
}

// @DataContract
public class TriggerActionWebhookDto : TriggerActionDto
{
    // @DataMember
    public var deliverySettings:WebhookDeliverySettingsDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case deliverySettings
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        deliverySettings = try container.decodeIfPresent(WebhookDeliverySettingsDto.self, forKey: .deliverySettings)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if deliverySettings != nil { try container.encode(deliverySettings, forKey: .deliverySettings) }
    }
}

// @DataContract
public class EmailToAllUsersDeliverySettingsDto : EmailCampaignDeliverySettingsDto
{
    // @DataMember
    public var rolesNames:IReadOnlySet<String>?

    // @DataMember
    public var userTags:IReadOnlySet<String>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case rolesNames
        case userTags
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rolesNames = try container.decodeIfPresent(IReadOnlySet<String>.self, forKey: .rolesNames)
        userTags = try container.decodeIfPresent(IReadOnlySet<String>.self, forKey: .userTags)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if rolesNames != nil { try container.encode(rolesNames, forKey: .rolesNames) }
        if userTags != nil { try container.encode(userTags, forKey: .userTags) }
    }
}

// @DataContract
public class EmailToAccountUsersDeliverySettingsDto : EmailCampaignDeliverySettingsDto
{
    // @DataMember
    public var userRecipients:IReadOnlySet<String>?

    // @DataMember
    public var userCc:IReadOnlySet<String>?

    // @DataMember
    public var userBcc:IReadOnlySet<String>?

    // @DataMember
    public var singleEmailStrategy:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case userRecipients
        case userCc
        case userBcc
        case singleEmailStrategy
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userRecipients = try container.decodeIfPresent(IReadOnlySet<String>.self, forKey: .userRecipients)
        userCc = try container.decodeIfPresent(IReadOnlySet<String>.self, forKey: .userCc)
        userBcc = try container.decodeIfPresent(IReadOnlySet<String>.self, forKey: .userBcc)
        singleEmailStrategy = try container.decodeIfPresent(Bool.self, forKey: .singleEmailStrategy)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if userRecipients != nil { try container.encode(userRecipients, forKey: .userRecipients) }
        if userCc != nil { try container.encode(userCc, forKey: .userCc) }
        if userBcc != nil { try container.encode(userBcc, forKey: .userBcc) }
        if singleEmailStrategy != nil { try container.encode(singleEmailStrategy, forKey: .singleEmailStrategy) }
    }
}

// @DataContract
public class EmailToUsersDeliverySettingsDto : EmailCampaignDeliverySettingsDto
{
    // @DataMember
    public var userRecipients:IReadOnlySet<String>?

    // @DataMember
    public var userCc:IReadOnlySet<String>?

    // @DataMember
    public var userBcc:IReadOnlySet<String>?

    // @DataMember
    public var singleEmailStrategy:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case userRecipients
        case userCc
        case userBcc
        case singleEmailStrategy
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userRecipients = try container.decodeIfPresent(IReadOnlySet<String>.self, forKey: .userRecipients)
        userCc = try container.decodeIfPresent(IReadOnlySet<String>.self, forKey: .userCc)
        userBcc = try container.decodeIfPresent(IReadOnlySet<String>.self, forKey: .userBcc)
        singleEmailStrategy = try container.decodeIfPresent(Bool.self, forKey: .singleEmailStrategy)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if userRecipients != nil { try container.encode(userRecipients, forKey: .userRecipients) }
        if userCc != nil { try container.encode(userCc, forKey: .userCc) }
        if userBcc != nil { try container.encode(userBcc, forKey: .userBcc) }
        if singleEmailStrategy != nil { try container.encode(singleEmailStrategy, forKey: .singleEmailStrategy) }
    }
}

// @DataContract
public class EmailToEmailAddressesDeliverySettingsDto : EmailCampaignDeliverySettingsDto
{
    // @DataMember
    public var recipients:IReadOnlySet<String>?

    // @DataMember
    public var recipientsCc:IReadOnlySet<String>?

    // @DataMember
    public var recipientsBcc:IReadOnlySet<String>?

    // @DataMember
    public var singleEmailStrategy:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case recipients
        case recipientsCc
        case recipientsBcc
        case singleEmailStrategy
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        recipients = try container.decodeIfPresent(IReadOnlySet<String>.self, forKey: .recipients)
        recipientsCc = try container.decodeIfPresent(IReadOnlySet<String>.self, forKey: .recipientsCc)
        recipientsBcc = try container.decodeIfPresent(IReadOnlySet<String>.self, forKey: .recipientsBcc)
        singleEmailStrategy = try container.decodeIfPresent(Bool.self, forKey: .singleEmailStrategy)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if recipients != nil { try container.encode(recipients, forKey: .recipients) }
        if recipientsCc != nil { try container.encode(recipientsCc, forKey: .recipientsCc) }
        if recipientsBcc != nil { try container.encode(recipientsBcc, forKey: .recipientsBcc) }
        if singleEmailStrategy != nil { try container.encode(singleEmailStrategy, forKey: .singleEmailStrategy) }
    }
}

// @DataContract
public class EmailToCollectionRecordsDeliverySettingsDto : EmailCampaignDeliverySettingsDto
{
    // @DataMember
    public var fields:IReadOnlySet<String>?

    // @DataMember
    public var schemaName:String?

    // @DataMember
    public var fieldType:CollectionEmailCampaignRecipientField?

    // @DataMember
    public var roleNames:IReadOnlySet<String>?

    // @DataMember
    public var languages:IReadOnlySet<String>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case fields
        case schemaName
        case fieldType
        case roleNames
        case languages
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fields = try container.decodeIfPresent(IReadOnlySet<String>.self, forKey: .fields)
        schemaName = try container.decodeIfPresent(String.self, forKey: .schemaName)
        fieldType = try container.decodeIfPresent(CollectionEmailCampaignRecipientField.self, forKey: .fieldType)
        roleNames = try container.decodeIfPresent(IReadOnlySet<String>.self, forKey: .roleNames)
        languages = try container.decodeIfPresent(IReadOnlySet<String>.self, forKey: .languages)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if fields != nil { try container.encode(fields, forKey: .fields) }
        if schemaName != nil { try container.encode(schemaName, forKey: .schemaName) }
        if fieldType != nil { try container.encode(fieldType, forKey: .fieldType) }
        if roleNames != nil { try container.encode(roleNames, forKey: .roleNames) }
        if languages != nil { try container.encode(languages, forKey: .languages) }
    }
}

// @DataContract
public class PushToAllUsersDeliverySettingsDto : PushCampaignDeliverySettingsDto
{
    // @DataMember
    public var rolesNames:[String]?

    // @DataMember
    public var userTags:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case rolesNames
        case userTags
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rolesNames = try container.decodeIfPresent([String].self, forKey: .rolesNames) ?? []
        userTags = try container.decodeIfPresent([String].self, forKey: .userTags) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if rolesNames != nil { try container.encode(rolesNames, forKey: .rolesNames) }
        if userTags != nil { try container.encode(userTags, forKey: .userTags) }
    }
}

// @DataContract
public class PushToUsersDeliverySettingsDto : PushCampaignDeliverySettingsDto
{
    // @DataMember
    public var recipients:[String] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case recipients
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        recipients = try container.decodeIfPresent([String].self, forKey: .recipients) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if recipients.count > 0 { try container.encode(recipients, forKey: .recipients) }
    }
}

// @DataContract
public class PushToCollectionRecordsDeliverySettingsDto : PushCampaignDeliverySettingsDto
{
    // @DataMember
    public var fields:[String] = []

    // @DataMember
    public var fieldType:CollectionEmailCampaignRecipientField?

    // @DataMember
    public var schemaName:String?

    // @DataMember
    public var roleNames:[String]?

    // @DataMember
    public var languages:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case fields
        case fieldType
        case schemaName
        case roleNames
        case languages
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fields = try container.decodeIfPresent([String].self, forKey: .fields) ?? []
        fieldType = try container.decodeIfPresent(CollectionEmailCampaignRecipientField.self, forKey: .fieldType)
        schemaName = try container.decodeIfPresent(String.self, forKey: .schemaName)
        roleNames = try container.decodeIfPresent([String].self, forKey: .roleNames) ?? []
        languages = try container.decodeIfPresent([String].self, forKey: .languages) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if fields.count > 0 { try container.encode(fields, forKey: .fields) }
        if fieldType != nil { try container.encode(fieldType, forKey: .fieldType) }
        if schemaName != nil { try container.encode(schemaName, forKey: .schemaName) }
        if roleNames != nil { try container.encode(roleNames, forKey: .roleNames) }
        if languages != nil { try container.encode(languages, forKey: .languages) }
    }
}

// @DataContract
public class PushToDevicesDeliverySettingsDto : PushCampaignDeliverySettingsDto
{
    // @DataMember
    public var devices:[PushDeviceDeliveryTokenDto] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case devices
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        devices = try container.decodeIfPresent([PushDeviceDeliveryTokenDto].self, forKey: .devices) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if devices.count > 0 { try container.encode(devices, forKey: .devices) }
    }
}

// @DataContract
public class SmsToAllUsersDeliverySettingsDto : SmsCampaignDeliverySettingsDto
{
    // @DataMember
    public var rolesNames:[String]?

    // @DataMember
    public var userTags:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case rolesNames
        case userTags
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rolesNames = try container.decodeIfPresent([String].self, forKey: .rolesNames) ?? []
        userTags = try container.decodeIfPresent([String].self, forKey: .userTags) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if rolesNames != nil { try container.encode(rolesNames, forKey: .rolesNames) }
        if userTags != nil { try container.encode(userTags, forKey: .userTags) }
    }
}

// @DataContract
public class SmsToUsersDeliverySettingsDto : SmsCampaignDeliverySettingsDto
{
    // @DataMember
    public var recipients:[String] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case recipients
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        recipients = try container.decodeIfPresent([String].self, forKey: .recipients) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if recipients.count > 0 { try container.encode(recipients, forKey: .recipients) }
    }
}

// @DataContract
public class SmsToCollectionRecordsDeliverySettingsDto : SmsCampaignDeliverySettingsDto
{
    // @DataMember
    public var fields:[String] = []

    // @DataMember
    public var fieldType:CollectionEmailCampaignRecipientField?

    // @DataMember
    public var schemaName:String?

    // @DataMember
    public var roleNames:[String]?

    // @DataMember
    public var languages:[String]?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case fields
        case fieldType
        case schemaName
        case roleNames
        case languages
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fields = try container.decodeIfPresent([String].self, forKey: .fields) ?? []
        fieldType = try container.decodeIfPresent(CollectionEmailCampaignRecipientField.self, forKey: .fieldType)
        schemaName = try container.decodeIfPresent(String.self, forKey: .schemaName)
        roleNames = try container.decodeIfPresent([String].self, forKey: .roleNames) ?? []
        languages = try container.decodeIfPresent([String].self, forKey: .languages) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if fields.count > 0 { try container.encode(fields, forKey: .fields) }
        if fieldType != nil { try container.encode(fieldType, forKey: .fieldType) }
        if schemaName != nil { try container.encode(schemaName, forKey: .schemaName) }
        if roleNames != nil { try container.encode(roleNames, forKey: .roleNames) }
        if languages != nil { try container.encode(languages, forKey: .languages) }
    }
}

// @DataContract
public class SmsToPhoneNumbersDeliverySettingsDto : SmsCampaignDeliverySettingsDto
{
    // @DataMember
    public var phoneNumbers:[String] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case phoneNumbers
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        phoneNumbers = try container.decodeIfPresent([String].self, forKey: .phoneNumbers) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if phoneNumbers.count > 0 { try container.encode(phoneNumbers, forKey: .phoneNumbers) }
    }
}

public class OpenAiLlmIntegrationDto : LlmIntegrationDto
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class AnthropicLlmIntegrationDto : LlmIntegrationDto
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class OllamaLlmIntegrationDto : LlmIntegrationDto
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class GroqLlmIntegrationDto : LlmIntegrationDto
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class GoogleLlmIntegrationDto : LlmIntegrationDto
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class MistralLlmIntegrationDto : LlmIntegrationDto
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class OpenRouterLlmIntegrationDto : LlmIntegrationDto
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class GrokLlmIntegrationDto : LlmIntegrationDto
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class DockerMcpIntegrationDto : McpIntegrationDto
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class GoogleCalendarMcpIntegrationDto : McpIntegrationDto
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class ObsidianMcpIntegrationDto : McpIntegrationDto
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class AwsLambdaCrossAccountRoleCodeIntegrationDto : CodeIntegrationDto
{
    public var region:String?
    public var roleArn:String?
    public var externalId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case region
        case roleArn
        case externalId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        region = try container.decodeIfPresent(String.self, forKey: .region)
        roleArn = try container.decodeIfPresent(String.self, forKey: .roleArn)
        externalId = try container.decodeIfPresent(String.self, forKey: .externalId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if region != nil { try container.encode(region, forKey: .region) }
        if roleArn != nil { try container.encode(roleArn, forKey: .roleArn) }
        if externalId != nil { try container.encode(externalId, forKey: .externalId) }
    }
}

public class AwsLambdaIamCodeIntegrationDto : CodeIntegrationDto
{
    public var region:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case region
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        region = try container.decodeIfPresent(String.self, forKey: .region)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if region != nil { try container.encode(region, forKey: .region) }
    }
}

public class AzureFunctionsCodeIntegrationDto : CodeIntegrationDto
{
    public var functionAppName:String?
    public var resourceGroup:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case functionAppName
        case resourceGroup
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        functionAppName = try container.decodeIfPresent(String.self, forKey: .functionAppName)
        resourceGroup = try container.decodeIfPresent(String.self, forKey: .resourceGroup)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if functionAppName != nil { try container.encode(functionAppName, forKey: .functionAppName) }
        if resourceGroup != nil { try container.encode(resourceGroup, forKey: .resourceGroup) }
    }
}

public class GoogleCloudFunctionsCodeIntegrationDto : CodeIntegrationDto
{
    public var projectId:String?
    public var region:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case projectId
        case region
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        projectId = try container.decodeIfPresent(String.self, forKey: .projectId)
        region = try container.decodeIfPresent(String.self, forKey: .region)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if projectId != nil { try container.encode(projectId, forKey: .projectId) }
        if region != nil { try container.encode(region, forKey: .region) }
    }
}

public class AdyenPaymentIntegrationDto : PaymentsIntegrationDto
{
    public var merchantAccount:String?
    public var environment:String?
    public var webhookId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case merchantAccount
        case environment
        case webhookId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        merchantAccount = try container.decodeIfPresent(String.self, forKey: .merchantAccount)
        environment = try container.decodeIfPresent(String.self, forKey: .environment)
        webhookId = try container.decodeIfPresent(String.self, forKey: .webhookId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if merchantAccount != nil { try container.encode(merchantAccount, forKey: .merchantAccount) }
        if environment != nil { try container.encode(environment, forKey: .environment) }
        if webhookId != nil { try container.encode(webhookId, forKey: .webhookId) }
    }
}

public class AppleInAppPaymentIntegrationDto : PaymentsIntegrationDto
{
    public var merchantIdentifier:String?
    public var merchantDomain:String?
    public var displayName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case merchantIdentifier
        case merchantDomain
        case displayName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        merchantIdentifier = try container.decodeIfPresent(String.self, forKey: .merchantIdentifier)
        merchantDomain = try container.decodeIfPresent(String.self, forKey: .merchantDomain)
        displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if merchantIdentifier != nil { try container.encode(merchantIdentifier, forKey: .merchantIdentifier) }
        if merchantDomain != nil { try container.encode(merchantDomain, forKey: .merchantDomain) }
        if displayName != nil { try container.encode(displayName, forKey: .displayName) }
    }
}

public class GoogleInAppPaymentIntegrationDto : PaymentsIntegrationDto
{
    public var merchantId:String?
    public var merchantName:String?
    public var gateway:String?
    public var gatewayMerchantId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case merchantId
        case merchantName
        case gateway
        case gatewayMerchantId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        merchantId = try container.decodeIfPresent(String.self, forKey: .merchantId)
        merchantName = try container.decodeIfPresent(String.self, forKey: .merchantName)
        gateway = try container.decodeIfPresent(String.self, forKey: .gateway)
        gatewayMerchantId = try container.decodeIfPresent(String.self, forKey: .gatewayMerchantId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if merchantId != nil { try container.encode(merchantId, forKey: .merchantId) }
        if merchantName != nil { try container.encode(merchantName, forKey: .merchantName) }
        if gateway != nil { try container.encode(gateway, forKey: .gateway) }
        if gatewayMerchantId != nil { try container.encode(gatewayMerchantId, forKey: .gatewayMerchantId) }
    }
}

public class LemonSqueezyPaymentIntegrationDto : PaymentsIntegrationDto
{
    public var storeId:String?
    public var isTestMode:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case storeId
        case isTestMode
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        storeId = try container.decodeIfPresent(String.self, forKey: .storeId)
        isTestMode = try container.decodeIfPresent(Bool.self, forKey: .isTestMode)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if storeId != nil { try container.encode(storeId, forKey: .storeId) }
        if isTestMode != nil { try container.encode(isTestMode, forKey: .isTestMode) }
    }
}

public class MolliePaymentIntegrationDto : PaymentsIntegrationDto
{
    public var profileId:String?
    public var isTestMode:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case profileId
        case isTestMode
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        profileId = try container.decodeIfPresent(String.self, forKey: .profileId)
        isTestMode = try container.decodeIfPresent(Bool.self, forKey: .isTestMode)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if profileId != nil { try container.encode(profileId, forKey: .profileId) }
        if isTestMode != nil { try container.encode(isTestMode, forKey: .isTestMode) }
    }
}

public class PaddlePaymentIntegrationDto : PaymentsIntegrationDto
{
    public var environment:String?
    public var clientSideToken:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case environment
        case clientSideToken
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        environment = try container.decodeIfPresent(String.self, forKey: .environment)
        clientSideToken = try container.decodeIfPresent(String.self, forKey: .clientSideToken)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if environment != nil { try container.encode(environment, forKey: .environment) }
        if clientSideToken != nil { try container.encode(clientSideToken, forKey: .clientSideToken) }
    }
}

public class PayPalPaymentIntegrationDto : PaymentsIntegrationDto
{
    public var clientId:String?
    public var environment:String?
    public var brandName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case clientId
        case environment
        case brandName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        clientId = try container.decodeIfPresent(String.self, forKey: .clientId)
        environment = try container.decodeIfPresent(String.self, forKey: .environment)
        brandName = try container.decodeIfPresent(String.self, forKey: .brandName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if clientId != nil { try container.encode(clientId, forKey: .clientId) }
        if environment != nil { try container.encode(environment, forKey: .environment) }
        if brandName != nil { try container.encode(brandName, forKey: .brandName) }
    }
}

public class StripePaymentIntegrationDto : PaymentsIntegrationDto
{
    public var publishableKey:String?
    public var webhookEndpointId:String?
    public var defaultCurrency:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case publishableKey
        case webhookEndpointId
        case defaultCurrency
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        publishableKey = try container.decodeIfPresent(String.self, forKey: .publishableKey)
        webhookEndpointId = try container.decodeIfPresent(String.self, forKey: .webhookEndpointId)
        defaultCurrency = try container.decodeIfPresent(String.self, forKey: .defaultCurrency)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if publishableKey != nil { try container.encode(publishableKey, forKey: .publishableKey) }
        if webhookEndpointId != nil { try container.encode(webhookEndpointId, forKey: .webhookEndpointId) }
        if defaultCurrency != nil { try container.encode(defaultCurrency, forKey: .defaultCurrency) }
    }
}

public class ShopifyPaymentIntegrationDto : PaymentsIntegrationDto
{
    public var shopDomain:String?
    public var webhookSecret:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case shopDomain
        case webhookSecret
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        shopDomain = try container.decodeIfPresent(String.self, forKey: .shopDomain)
        webhookSecret = try container.decodeIfPresent(String.self, forKey: .webhookSecret)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if shopDomain != nil { try container.encode(shopDomain, forKey: .shopDomain) }
        if webhookSecret != nil { try container.encode(webhookSecret, forKey: .webhookSecret) }
    }
}

public class WooCommercePaymentIntegrationDto : PaymentsIntegrationDto
{
    public var storeUrl:String?
    public var webhookSecret:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case storeUrl
        case webhookSecret
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        storeUrl = try container.decodeIfPresent(String.self, forKey: .storeUrl)
        webhookSecret = try container.decodeIfPresent(String.self, forKey: .webhookSecret)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if storeUrl != nil { try container.encode(storeUrl, forKey: .storeUrl) }
        if webhookSecret != nil { try container.encode(webhookSecret, forKey: .webhookSecret) }
    }
}

public class MagentoPaymentIntegrationDto : PaymentsIntegrationDto
{
    public var storeUrl:String?
    public var webhookSecret:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case storeUrl
        case webhookSecret
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        storeUrl = try container.decodeIfPresent(String.self, forKey: .storeUrl)
        webhookSecret = try container.decodeIfPresent(String.self, forKey: .webhookSecret)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if storeUrl != nil { try container.encode(storeUrl, forKey: .storeUrl) }
        if webhookSecret != nil { try container.encode(webhookSecret, forKey: .webhookSecret) }
    }
}

public class BraintreePaymentIntegrationDto : PaymentsIntegrationDto
{
    public var merchantId:String?
    public var environment:String?
    public var webhookSecret:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case merchantId
        case environment
        case webhookSecret
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        merchantId = try container.decodeIfPresent(String.self, forKey: .merchantId)
        environment = try container.decodeIfPresent(String.self, forKey: .environment)
        webhookSecret = try container.decodeIfPresent(String.self, forKey: .webhookSecret)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if merchantId != nil { try container.encode(merchantId, forKey: .merchantId) }
        if environment != nil { try container.encode(environment, forKey: .environment) }
        if webhookSecret != nil { try container.encode(webhookSecret, forKey: .webhookSecret) }
    }
}

public class AuthorizeNetPaymentIntegrationDto : PaymentsIntegrationDto
{
    public var merchantLoginId:String?
    public var environment:String?
    public var webhookSignatureKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case merchantLoginId
        case environment
        case webhookSignatureKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        merchantLoginId = try container.decodeIfPresent(String.self, forKey: .merchantLoginId)
        environment = try container.decodeIfPresent(String.self, forKey: .environment)
        webhookSignatureKey = try container.decodeIfPresent(String.self, forKey: .webhookSignatureKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if merchantLoginId != nil { try container.encode(merchantLoginId, forKey: .merchantLoginId) }
        if environment != nil { try container.encode(environment, forKey: .environment) }
        if webhookSignatureKey != nil { try container.encode(webhookSignatureKey, forKey: .webhookSignatureKey) }
    }
}

public class CheckOutComPaymentIntegrationDto : PaymentsIntegrationDto
{
    public var merchantAccount:String?
    public var environment:String?
    public var webhookSecret:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case merchantAccount
        case environment
        case webhookSecret
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        merchantAccount = try container.decodeIfPresent(String.self, forKey: .merchantAccount)
        environment = try container.decodeIfPresent(String.self, forKey: .environment)
        webhookSecret = try container.decodeIfPresent(String.self, forKey: .webhookSecret)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if merchantAccount != nil { try container.encode(merchantAccount, forKey: .merchantAccount) }
        if environment != nil { try container.encode(environment, forKey: .environment) }
        if webhookSecret != nil { try container.encode(webhookSecret, forKey: .webhookSecret) }
    }
}

public class WorldpayPaymentIntegrationDto : PaymentsIntegrationDto
{
    public var merchantCode:String?
    public var environment:String?
    public var webhookSecret:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case merchantCode
        case environment
        case webhookSecret
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        merchantCode = try container.decodeIfPresent(String.self, forKey: .merchantCode)
        environment = try container.decodeIfPresent(String.self, forKey: .environment)
        webhookSecret = try container.decodeIfPresent(String.self, forKey: .webhookSecret)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if merchantCode != nil { try container.encode(merchantCode, forKey: .merchantCode) }
        if environment != nil { try container.encode(environment, forKey: .environment) }
        if webhookSecret != nil { try container.encode(webhookSecret, forKey: .webhookSecret) }
    }
}

public class AppleSignInMembershipIntegrationDto : MembershipIntegrationDto
{
    public var teamId:String?
    public var appBundleId:String?
    public var serviceId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case teamId
        case appBundleId
        case serviceId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        teamId = try container.decodeIfPresent(String.self, forKey: .teamId)
        appBundleId = try container.decodeIfPresent(String.self, forKey: .appBundleId)
        serviceId = try container.decodeIfPresent(String.self, forKey: .serviceId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if teamId != nil { try container.encode(teamId, forKey: .teamId) }
        if appBundleId != nil { try container.encode(appBundleId, forKey: .appBundleId) }
        if serviceId != nil { try container.encode(serviceId, forKey: .serviceId) }
    }
}

public class GitHubMembershipIntegrationDto : MembershipIntegrationDto
{
    public var clientId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case clientId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        clientId = try container.decodeIfPresent(String.self, forKey: .clientId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if clientId != nil { try container.encode(clientId, forKey: .clientId) }
    }
}

public class GoogleMembershipIntegrationDto : MembershipIntegrationDto
{
    public var clientId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case clientId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        clientId = try container.decodeIfPresent(String.self, forKey: .clientId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if clientId != nil { try container.encode(clientId, forKey: .clientId) }
    }
}

public class MetaMembershipIntegrationDto : MembershipIntegrationDto
{
    public var appId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case appId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        appId = try container.decodeIfPresent(String.self, forKey: .appId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if appId != nil { try container.encode(appId, forKey: .appId) }
    }
}

public class MicrosoftMembershipIntegrationDto : MembershipIntegrationDto
{
    public var tenantId:String?
    public var clientId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case tenantId
        case clientId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tenantId = try container.decodeIfPresent(String.self, forKey: .tenantId)
        clientId = try container.decodeIfPresent(String.self, forKey: .clientId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if tenantId != nil { try container.encode(tenantId, forKey: .tenantId) }
        if clientId != nil { try container.encode(clientId, forKey: .clientId) }
    }
}

public class OktaMembershipIntegrationDto : MembershipIntegrationDto
{
    public var domain:String?
    public var clientId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case domain
        case clientId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        domain = try container.decodeIfPresent(String.self, forKey: .domain)
        clientId = try container.decodeIfPresent(String.self, forKey: .clientId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if domain != nil { try container.encode(domain, forKey: .domain) }
        if clientId != nil { try container.encode(clientId, forKey: .clientId) }
    }
}

public class XMembershipIntegrationDto : MembershipIntegrationDto
{
    public var apiKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case apiKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
    }
}

public class AmqpLoggingIntegrationDto : LoggingIntegrationDto
{
    public var host:String?
    public var port:Int?
    public var virtualHost:String?
    public var exchange:String?
    public var routingKey:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case host
        case port
        case virtualHost
        case exchange
        case routingKey
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        host = try container.decodeIfPresent(String.self, forKey: .host)
        port = try container.decodeIfPresent(Int.self, forKey: .port)
        virtualHost = try container.decodeIfPresent(String.self, forKey: .virtualHost)
        exchange = try container.decodeIfPresent(String.self, forKey: .exchange)
        routingKey = try container.decodeIfPresent(String.self, forKey: .routingKey)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if host != nil { try container.encode(host, forKey: .host) }
        if port != nil { try container.encode(port, forKey: .port) }
        if virtualHost != nil { try container.encode(virtualHost, forKey: .virtualHost) }
        if exchange != nil { try container.encode(exchange, forKey: .exchange) }
        if routingKey != nil { try container.encode(routingKey, forKey: .routingKey) }
    }
}

public class AwsKinesisLoggingIntegrationDto : LoggingIntegrationDto
{
    public var streamName:String?
    public var region:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case streamName
        case region
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        streamName = try container.decodeIfPresent(String.self, forKey: .streamName)
        region = try container.decodeIfPresent(String.self, forKey: .region)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if streamName != nil { try container.encode(streamName, forKey: .streamName) }
        if region != nil { try container.encode(region, forKey: .region) }
    }
}

public class AwsS3CrossAccountRoleLoggingIntegrationDto : LoggingIntegrationDto
{
    public var bucketName:String?
    public var region:String?
    public var roleArn:String?
    public var externalId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case bucketName
        case region
        case roleArn
        case externalId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        bucketName = try container.decodeIfPresent(String.self, forKey: .bucketName)
        region = try container.decodeIfPresent(String.self, forKey: .region)
        roleArn = try container.decodeIfPresent(String.self, forKey: .roleArn)
        externalId = try container.decodeIfPresent(String.self, forKey: .externalId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if bucketName != nil { try container.encode(bucketName, forKey: .bucketName) }
        if region != nil { try container.encode(region, forKey: .region) }
        if roleArn != nil { try container.encode(roleArn, forKey: .roleArn) }
        if externalId != nil { try container.encode(externalId, forKey: .externalId) }
    }
}

public class AwsS3IamLoggingIntegrationDto : LoggingIntegrationDto
{
    public var bucketName:String?
    public var region:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case bucketName
        case region
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        bucketName = try container.decodeIfPresent(String.self, forKey: .bucketName)
        region = try container.decodeIfPresent(String.self, forKey: .region)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if bucketName != nil { try container.encode(bucketName, forKey: .bucketName) }
        if region != nil { try container.encode(region, forKey: .region) }
    }
}

public class AzureOtelLoggingIntegrationDto : LoggingIntegrationDto
{
    public var endpointUrl:String?
    public var resourceName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case endpointUrl
        case resourceName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        endpointUrl = try container.decodeIfPresent(String.self, forKey: .endpointUrl)
        resourceName = try container.decodeIfPresent(String.self, forKey: .resourceName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if endpointUrl != nil { try container.encode(endpointUrl, forKey: .endpointUrl) }
        if resourceName != nil { try container.encode(resourceName, forKey: .resourceName) }
    }
}

public class DataDogLoggingIntegrationDto : LoggingIntegrationDto
{
    public var site:String?
    public var serviceName:String?
    public var environment:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case site
        case serviceName
        case environment
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        site = try container.decodeIfPresent(String.self, forKey: .site)
        serviceName = try container.decodeIfPresent(String.self, forKey: .serviceName)
        environment = try container.decodeIfPresent(String.self, forKey: .environment)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if site != nil { try container.encode(site, forKey: .site) }
        if serviceName != nil { try container.encode(serviceName, forKey: .serviceName) }
        if environment != nil { try container.encode(environment, forKey: .environment) }
    }
}

public class ElasticSearchLoggingIntegrationDto : LoggingIntegrationDto
{
    public var uri:String?
    public var index:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case uri
        case index
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        uri = try container.decodeIfPresent(String.self, forKey: .uri)
        index = try container.decodeIfPresent(String.self, forKey: .index)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if uri != nil { try container.encode(uri, forKey: .uri) }
        if index != nil { try container.encode(index, forKey: .index) }
    }
}

public class InternalKafkaLoggingIntegrationDto : LoggingIntegrationDto
{
    public var bootstrapServers:String?
    public var topic:String?
    public var securityProtocol:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case bootstrapServers
        case topic
        case securityProtocol
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        bootstrapServers = try container.decodeIfPresent(String.self, forKey: .bootstrapServers)
        topic = try container.decodeIfPresent(String.self, forKey: .topic)
        securityProtocol = try container.decodeIfPresent(String.self, forKey: .securityProtocol)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if bootstrapServers != nil { try container.encode(bootstrapServers, forKey: .bootstrapServers) }
        if topic != nil { try container.encode(topic, forKey: .topic) }
        if securityProtocol != nil { try container.encode(securityProtocol, forKey: .securityProtocol) }
    }
}

public class KafkaLoggingIntegrationDto : LoggingIntegrationDto
{
    public var bootstrapServers:String?
    public var topic:String?
    public var securityProtocol:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case bootstrapServers
        case topic
        case securityProtocol
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        bootstrapServers = try container.decodeIfPresent(String.self, forKey: .bootstrapServers)
        topic = try container.decodeIfPresent(String.self, forKey: .topic)
        securityProtocol = try container.decodeIfPresent(String.self, forKey: .securityProtocol)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if bootstrapServers != nil { try container.encode(bootstrapServers, forKey: .bootstrapServers) }
        if topic != nil { try container.encode(topic, forKey: .topic) }
        if securityProtocol != nil { try container.encode(securityProtocol, forKey: .securityProtocol) }
    }
}

public class KibanaLoggingIntegrationDto : LoggingIntegrationDto
{
    public var uri:String?
    public var spaceId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case uri
        case spaceId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        uri = try container.decodeIfPresent(String.self, forKey: .uri)
        spaceId = try container.decodeIfPresent(String.self, forKey: .spaceId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if uri != nil { try container.encode(uri, forKey: .uri) }
        if spaceId != nil { try container.encode(spaceId, forKey: .spaceId) }
    }
}

public class LocalFileLoggingIntegrationDto : LoggingIntegrationDto
{
    public var rootPath:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case rootPath
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rootPath = try container.decodeIfPresent(String.self, forKey: .rootPath)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if rootPath != nil { try container.encode(rootPath, forKey: .rootPath) }
    }
}

public class MicrosoftTeamsLoggingIntegrationDto : LoggingIntegrationDto
{
    public var channelName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case channelName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        channelName = try container.decodeIfPresent(String.self, forKey: .channelName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if channelName != nil { try container.encode(channelName, forKey: .channelName) }
    }
}

public class MongoDbLoggingIntegrationDto : LoggingIntegrationDto
{
    public var databaseName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case databaseName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        databaseName = try container.decodeIfPresent(String.self, forKey: .databaseName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if databaseName != nil { try container.encode(databaseName, forKey: .databaseName) }
    }
}

public class NewRelicLoggingIntegrationDto : LoggingIntegrationDto
{
    public var region:String?
    public var serviceName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case region
        case serviceName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        region = try container.decodeIfPresent(String.self, forKey: .region)
        serviceName = try container.decodeIfPresent(String.self, forKey: .serviceName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if region != nil { try container.encode(region, forKey: .region) }
        if serviceName != nil { try container.encode(serviceName, forKey: .serviceName) }
    }
}

public class PrometheusLoggingIntegrationDto : LoggingIntegrationDto
{
    public var endpointUrl:String?
    public var jobName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case endpointUrl
        case jobName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        endpointUrl = try container.decodeIfPresent(String.self, forKey: .endpointUrl)
        jobName = try container.decodeIfPresent(String.self, forKey: .jobName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if endpointUrl != nil { try container.encode(endpointUrl, forKey: .endpointUrl) }
        if jobName != nil { try container.encode(jobName, forKey: .jobName) }
    }
}

public class SplunkLoggingIntegrationDto : LoggingIntegrationDto
{
    public var hecEndpointUrl:String?
    public var index:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case hecEndpointUrl
        case index
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        hecEndpointUrl = try container.decodeIfPresent(String.self, forKey: .hecEndpointUrl)
        index = try container.decodeIfPresent(String.self, forKey: .index)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if hecEndpointUrl != nil { try container.encode(hecEndpointUrl, forKey: .hecEndpointUrl) }
        if index != nil { try container.encode(index, forKey: .index) }
    }
}

public class TelegramLoggingIntegrationDto : LoggingIntegrationDto
{
    public var chatId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case chatId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        chatId = try container.decodeIfPresent(String.self, forKey: .chatId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if chatId != nil { try container.encode(chatId, forKey: .chatId) }
    }
}

public class ZabbixLoggingIntegrationDto : LoggingIntegrationDto
{
    public var apiUrl:String?
    public var hostName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case apiUrl
        case hostName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        apiUrl = try container.decodeIfPresent(String.self, forKey: .apiUrl)
        hostName = try container.decodeIfPresent(String.self, forKey: .hostName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if apiUrl != nil { try container.encode(apiUrl, forKey: .apiUrl) }
        if hostName != nil { try container.encode(hostName, forKey: .hostName) }
    }
}

public class SlackLoggingIntegrationDto : LoggingIntegrationDto
{
    public var channelName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case channelName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        channelName = try container.decodeIfPresent(String.self, forKey: .channelName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if channelName != nil { try container.encode(channelName, forKey: .channelName) }
    }
}

public class AppleICloudFilesIntegrationDto : FilesIntegrationDto
{
    public var containerIdentifier:String?
    public var relativePath:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case containerIdentifier
        case relativePath
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        containerIdentifier = try container.decodeIfPresent(String.self, forKey: .containerIdentifier)
        relativePath = try container.decodeIfPresent(String.self, forKey: .relativePath)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if containerIdentifier != nil { try container.encode(containerIdentifier, forKey: .containerIdentifier) }
        if relativePath != nil { try container.encode(relativePath, forKey: .relativePath) }
    }
}

public class AwsS3CrossAccountRoleFilesIntegrationDto : FilesIntegrationDto
{
    public var bucketName:String?
    public var region:String?
    public var roleArn:String?
    public var externalId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case bucketName
        case region
        case roleArn
        case externalId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        bucketName = try container.decodeIfPresent(String.self, forKey: .bucketName)
        region = try container.decodeIfPresent(String.self, forKey: .region)
        roleArn = try container.decodeIfPresent(String.self, forKey: .roleArn)
        externalId = try container.decodeIfPresent(String.self, forKey: .externalId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if bucketName != nil { try container.encode(bucketName, forKey: .bucketName) }
        if region != nil { try container.encode(region, forKey: .region) }
        if roleArn != nil { try container.encode(roleArn, forKey: .roleArn) }
        if externalId != nil { try container.encode(externalId, forKey: .externalId) }
    }
}

public class AwsS3IamFilesIntegrationDto : FilesIntegrationDto
{
    public var bucketName:String?
    public var region:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case bucketName
        case region
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        bucketName = try container.decodeIfPresent(String.self, forKey: .bucketName)
        region = try container.decodeIfPresent(String.self, forKey: .region)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if bucketName != nil { try container.encode(bucketName, forKey: .bucketName) }
        if region != nil { try container.encode(region, forKey: .region) }
    }
}

public class AzureBlobFilesIntegrationDto : FilesIntegrationDto
{
    public var blobName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case blobName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        blobName = try container.decodeIfPresent(String.self, forKey: .blobName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if blobName != nil { try container.encode(blobName, forKey: .blobName) }
    }
}

public class DropBoxFilesIntegrationDto : FilesIntegrationDto
{
    public var rootPath:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case rootPath
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rootPath = try container.decodeIfPresent(String.self, forKey: .rootPath)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if rootPath != nil { try container.encode(rootPath, forKey: .rootPath) }
    }
}

public class FtpFilesIntegrationDto : FilesIntegrationDto
{
    public var host:String?
    public var port:Int?
    public var rootPath:String?
    public var useSsl:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case host
        case port
        case rootPath
        case useSsl
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        host = try container.decodeIfPresent(String.self, forKey: .host)
        port = try container.decodeIfPresent(Int.self, forKey: .port)
        rootPath = try container.decodeIfPresent(String.self, forKey: .rootPath)
        useSsl = try container.decodeIfPresent(Bool.self, forKey: .useSsl)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if host != nil { try container.encode(host, forKey: .host) }
        if port != nil { try container.encode(port, forKey: .port) }
        if rootPath != nil { try container.encode(rootPath, forKey: .rootPath) }
        if useSsl != nil { try container.encode(useSsl, forKey: .useSsl) }
    }
}

public class GoogleCloudFilesIntegrationDto : FilesIntegrationDto
{
    public var bucketName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case bucketName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        bucketName = try container.decodeIfPresent(String.self, forKey: .bucketName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if bucketName != nil { try container.encode(bucketName, forKey: .bucketName) }
    }
}

public class GoogleDriveFilesIntegrationDto : FilesIntegrationDto
{
    public var rootFolderId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case rootFolderId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rootFolderId = try container.decodeIfPresent(String.self, forKey: .rootFolderId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if rootFolderId != nil { try container.encode(rootFolderId, forKey: .rootFolderId) }
    }
}

public class LocalFilesIntegrationDto : FilesIntegrationDto
{
    public var rootPath:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case rootPath
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rootPath = try container.decodeIfPresent(String.self, forKey: .rootPath)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if rootPath != nil { try container.encode(rootPath, forKey: .rootPath) }
    }
}

public class MongoDbAtlasClusterIntegrationDto : DatabaseIntegrationDto
{
    public var databaseName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case databaseName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        databaseName = try container.decodeIfPresent(String.self, forKey: .databaseName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if databaseName != nil { try container.encode(databaseName, forKey: .databaseName) }
    }
}

public class MongoDbAtlasServerlessIntegrationDto : DatabaseIntegrationDto
{
    public var databaseName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case databaseName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        databaseName = try container.decodeIfPresent(String.self, forKey: .databaseName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if databaseName != nil { try container.encode(databaseName, forKey: .databaseName) }
    }
}

public class MongoDbConnectionStringIntegrationDto : DatabaseIntegrationDto
{
    public var databaseName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case databaseName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        databaseName = try container.decodeIfPresent(String.self, forKey: .databaseName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if databaseName != nil { try container.encode(databaseName, forKey: .databaseName) }
    }
}

public class BirdSmsIntegrationDto : SmsIntegrationDto
{
    public var originator:String?
    public var region:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case originator
        case region
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        originator = try container.decodeIfPresent(String.self, forKey: .originator)
        region = try container.decodeIfPresent(String.self, forKey: .region)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if originator != nil { try container.encode(originator, forKey: .originator) }
        if region != nil { try container.encode(region, forKey: .region) }
    }
}

public class PlivoSmsIntegrationDto : SmsIntegrationDto
{
    public var authId:String?
    public var fromPhoneNumber:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case authId
        case fromPhoneNumber
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        authId = try container.decodeIfPresent(String.self, forKey: .authId)
        fromPhoneNumber = try container.decodeIfPresent(String.self, forKey: .fromPhoneNumber)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if authId != nil { try container.encode(authId, forKey: .authId) }
        if fromPhoneNumber != nil { try container.encode(fromPhoneNumber, forKey: .fromPhoneNumber) }
    }
}

public class SinchSmsIntegrationDto : SmsIntegrationDto
{
    public var servicePlanId:String?
    public var fromPhoneNumber:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case servicePlanId
        case fromPhoneNumber
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        servicePlanId = try container.decodeIfPresent(String.self, forKey: .servicePlanId)
        fromPhoneNumber = try container.decodeIfPresent(String.self, forKey: .fromPhoneNumber)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if servicePlanId != nil { try container.encode(servicePlanId, forKey: .servicePlanId) }
        if fromPhoneNumber != nil { try container.encode(fromPhoneNumber, forKey: .fromPhoneNumber) }
    }
}

public class TelesignSmsIntegrationDto : SmsIntegrationDto
{
    public var customerId:String?
    public var fromSender:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case customerId
        case fromSender
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        customerId = try container.decodeIfPresent(String.self, forKey: .customerId)
        fromSender = try container.decodeIfPresent(String.self, forKey: .fromSender)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if customerId != nil { try container.encode(customerId, forKey: .customerId) }
        if fromSender != nil { try container.encode(fromSender, forKey: .fromSender) }
    }
}

public class TelnyxSmsIntegrationDto : SmsIntegrationDto
{
    public var messagingProfileId:String?
    public var fromPhoneNumber:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case messagingProfileId
        case fromPhoneNumber
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        messagingProfileId = try container.decodeIfPresent(String.self, forKey: .messagingProfileId)
        fromPhoneNumber = try container.decodeIfPresent(String.self, forKey: .fromPhoneNumber)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if messagingProfileId != nil { try container.encode(messagingProfileId, forKey: .messagingProfileId) }
        if fromPhoneNumber != nil { try container.encode(fromPhoneNumber, forKey: .fromPhoneNumber) }
    }
}

public class TwilioSmsIntegrationDto : SmsIntegrationDto
{
    public var accountSid:String?
    public var fromPhoneNumber:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case accountSid
        case fromPhoneNumber
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        accountSid = try container.decodeIfPresent(String.self, forKey: .accountSid)
        fromPhoneNumber = try container.decodeIfPresent(String.self, forKey: .fromPhoneNumber)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if accountSid != nil { try container.encode(accountSid, forKey: .accountSid) }
        if fromPhoneNumber != nil { try container.encode(fromPhoneNumber, forKey: .fromPhoneNumber) }
    }
}

public class VonageSmsIntegrationDto : SmsIntegrationDto
{
    public var apiKey:String?
    public var fromSender:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case apiKey
        case fromSender
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
        fromSender = try container.decodeIfPresent(String.self, forKey: .fromSender)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if apiKey != nil { try container.encode(apiKey, forKey: .apiKey) }
        if fromSender != nil { try container.encode(fromSender, forKey: .fromSender) }
    }
}

public class AndroidFirebasePushIntegrationDto : PushIntegrationDto
{
    public var projectId:String?
    public var clientEmail:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case projectId
        case clientEmail
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        projectId = try container.decodeIfPresent(String.self, forKey: .projectId)
        clientEmail = try container.decodeIfPresent(String.self, forKey: .clientEmail)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if projectId != nil { try container.encode(projectId, forKey: .projectId) }
        if clientEmail != nil { try container.encode(clientEmail, forKey: .clientEmail) }
    }
}

public class AppleApnsPushIntegrationDto : PushIntegrationDto
{
    public var teamId:String?
    public var appBundleId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case teamId
        case appBundleId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        teamId = try container.decodeIfPresent(String.self, forKey: .teamId)
        appBundleId = try container.decodeIfPresent(String.self, forKey: .appBundleId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if teamId != nil { try container.encode(teamId, forKey: .teamId) }
        if appBundleId != nil { try container.encode(appBundleId, forKey: .appBundleId) }
    }
}

public class ChromePluginPushIntegrationDto : PushIntegrationDto
{
    public var extensionId:String?
    public var vapidPublicKey:String?
    public var subject:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case extensionId
        case vapidPublicKey
        case subject
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        extensionId = try container.decodeIfPresent(String.self, forKey: .extensionId)
        vapidPublicKey = try container.decodeIfPresent(String.self, forKey: .vapidPublicKey)
        subject = try container.decodeIfPresent(String.self, forKey: .subject)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if extensionId != nil { try container.encode(extensionId, forKey: .extensionId) }
        if vapidPublicKey != nil { try container.encode(vapidPublicKey, forKey: .vapidPublicKey) }
        if subject != nil { try container.encode(subject, forKey: .subject) }
    }
}

public class ChromeWebPushIntegrationDto : PushIntegrationDto
{
    public var vapidPublicKey:String?
    public var subject:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case vapidPublicKey
        case subject
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        vapidPublicKey = try container.decodeIfPresent(String.self, forKey: .vapidPublicKey)
        subject = try container.decodeIfPresent(String.self, forKey: .subject)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if vapidPublicKey != nil { try container.encode(vapidPublicKey, forKey: .vapidPublicKey) }
        if subject != nil { try container.encode(subject, forKey: .subject) }
    }
}

public class EdgeWebPushIntegrationDto : PushIntegrationDto
{
    public var vapidPublicKey:String?
    public var subject:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case vapidPublicKey
        case subject
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        vapidPublicKey = try container.decodeIfPresent(String.self, forKey: .vapidPublicKey)
        subject = try container.decodeIfPresent(String.self, forKey: .subject)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if vapidPublicKey != nil { try container.encode(vapidPublicKey, forKey: .vapidPublicKey) }
        if subject != nil { try container.encode(subject, forKey: .subject) }
    }
}

public class FirefoxWebPushIntegrationDto : PushIntegrationDto
{
    public var vapidPublicKey:String?
    public var subject:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case vapidPublicKey
        case subject
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        vapidPublicKey = try container.decodeIfPresent(String.self, forKey: .vapidPublicKey)
        subject = try container.decodeIfPresent(String.self, forKey: .subject)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if vapidPublicKey != nil { try container.encode(vapidPublicKey, forKey: .vapidPublicKey) }
        if subject != nil { try container.encode(subject, forKey: .subject) }
    }
}

public class SafariPushIntegrationDto : PushIntegrationDto
{
    public var websitePushId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case websitePushId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        websitePushId = try container.decodeIfPresent(String.self, forKey: .websitePushId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if websitePushId != nil { try container.encode(websitePushId, forKey: .websitePushId) }
    }
}

public class AwsCrossAccountRoleEmailIntegrationDto : AwsSesEmailIntegrationDto
{
    public var roleArn:String?
    public var externalId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case roleArn
        case externalId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        roleArn = try container.decodeIfPresent(String.self, forKey: .roleArn)
        externalId = try container.decodeIfPresent(String.self, forKey: .externalId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if roleArn != nil { try container.encode(roleArn, forKey: .roleArn) }
        if externalId != nil { try container.encode(externalId, forKey: .externalId) }
    }
}

public class AwsIamEmailIntegrationDto : AwsSesEmailIntegrationDto
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class MailGunEmailIntegrationDto : EmailIntegrationDto
{
    public var domain:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case domain
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        domain = try container.decodeIfPresent(String.self, forKey: .domain)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if domain != nil { try container.encode(domain, forKey: .domain) }
    }
}

public class SendGridEmailIntegrationDto : EmailIntegrationDto
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class SmtpEmailIntegrationDto : EmailIntegrationDto
{
    public var hostName:String?
    public var port:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case hostName
        case port
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        hostName = try container.decodeIfPresent(String.self, forKey: .hostName)
        port = try container.decodeIfPresent(Int.self, forKey: .port)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if hostName != nil { try container.encode(hostName, forKey: .hostName) }
        if port != nil { try container.encode(port, forKey: .port) }
    }
}

public class WebhookIntegrationDto : IntegrationDto
{
    public var destinations:IReadOnlyList<WebhookDestinationDto>?
    public var extraHeaders:IReadOnlyDictionary<String, String>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case destinations
        case extraHeaders
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        destinations = try container.decodeIfPresent(IReadOnlyList<WebhookDestinationDto>.self, forKey: .destinations)
        extraHeaders = try container.decodeIfPresent(IReadOnlyDictionary<String, String>.self, forKey: .extraHeaders)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if destinations != nil { try container.encode(destinations, forKey: .destinations) }
        if extraHeaders != nil { try container.encode(extraHeaders, forKey: .extraHeaders) }
    }
}

// @DataContract
public class WebhookDestinationDto : Codable
{
    // @DataMember
    public var viewId:String?

    // @DataMember
    public var destinationName:String?

    // @DataMember
    public var endpointUrl:String?

    // @DataMember
    public var selectedEvents:IReadOnlyList<String>?

    // @DataMember
    public var extraHeaders:IReadOnlyDictionary<String, String>?

    // @DataMember
    public var isEnabled:Bool?

    required public init(){}
}

// @DataContract
public class SchedulerTaskDto : Codable
{
    // @DataMember
    public var projectId:String?

    // @DataMember
    public var taskId:String?

    // @DataMember
    public var name:String?

    // @DataMember
    public var Description:String?

    // @DataMember
    public var cron:String?

    // @DataMember
    public var type:SchedulerTaskType?

    // @DataMember
    public var payloadJson:String?

    // @DataMember
    public var initiatorId:String?

    // @DataMember
    public var isEnabled:Bool?

    // @DataMember
    public var stopOnError:Bool?

    // @DataMember
    public var createdAtUnix:Int?

    // @DataMember
    public var updatedAtUnix:Int?

    required public init(){}
}

public class MongoDbAggregateDto : IHasViewId, Codable
{
    // @DataMember
    public var viewId:String?

    // @DataMember
    public var displayName:String?

    // @DataMember
    public var Description:String?

    // @DataMember
    public var schemaViewId:String?

    // @DataMember
    public var pipeline:String?

    required public init(){}
}

// @DataContract
public class MarketplaceIntegrationDto : IntegrationDto
{
    // @DataMember
    public var listingViewId:String?

    // @DataMember
    public var transport:MarketplaceTransport?

    // @DataMember
    public var vendor:String?

    // @DataMember
    public var category:MarketplaceCategory?

    // @DataMember
    public var Description:String?

    // @DataMember
    public var config:IReadOnlyDictionary<String, String>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case listingViewId
        case transport
        case vendor
        case category
        case Description
        case config
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        listingViewId = try container.decodeIfPresent(String.self, forKey: .listingViewId)
        transport = try container.decodeIfPresent(MarketplaceTransport.self, forKey: .transport)
        vendor = try container.decodeIfPresent(String.self, forKey: .vendor)
        category = try container.decodeIfPresent(MarketplaceCategory.self, forKey: .category)
        Description = try container.decodeIfPresent(String.self, forKey: .Description)
        config = try container.decodeIfPresent(IReadOnlyDictionary<String, String>.self, forKey: .config)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if listingViewId != nil { try container.encode(listingViewId, forKey: .listingViewId) }
        if transport != nil { try container.encode(transport, forKey: .transport) }
        if vendor != nil { try container.encode(vendor, forKey: .vendor) }
        if category != nil { try container.encode(category, forKey: .category) }
        if Description != nil { try container.encode(Description, forKey: .Description) }
        if config != nil { try container.encode(config, forKey: .config) }
    }
}

// @DataContract
public class MarketplaceFunctionBindingDto : IHasViewId, Codable
{
    // @DataMember
    public var viewId:String?

    // @DataMember
    public var integrationViewId:String?

    // @DataMember
    public var functionKey:String?

    // @DataMember
    public var displayName:String?

    // @DataMember
    public var Description:String?

    // @DataMember
    public var isEnabled:Bool?

    // @DataMember
    public var mappings:IReadOnlyList<MarketplaceMappingDto>?

    required public init(){}
}

// @DataContract
public class MarketplaceListingDto : IHasViewId, Codable
{
    // @DataMember
    public var viewId:String?

    // @DataMember
    public var slug:String?

    // @DataMember
    public var displayName:String?

    // @DataMember
    public var vendor:String?

    // @DataMember
    public var category:MarketplaceCategory?

    // @DataMember
    public var transport:MarketplaceTransport?

    // @DataMember
    public var Description:String?

    // @DataMember
    public var iconUrl:String?

    // @DataMember
    public var documentationUrl:String?

    // @DataMember
    public var isOfficial:Bool?

    // @DataMember
    public var functions:IReadOnlyList<MarketplaceFunctionDefinitionDto>?

    required public init(){}
}

// @DataContract
public class MarketplaceFunctionDefinitionDto : Codable
{
    // @DataMember
    public var functionKey:String?

    // @DataMember
    public var displayName:String?

    // @DataMember
    public var Description:String?

    // @DataMember
    public var group:String?

    // @DataMember
    public var parameters:IReadOnlyList<MarketplaceFunctionParameterDto>?

    required public init(){}
}

// @DataContract
public class MarketplaceFunctionParameterDto : Codable
{
    // @DataMember
    public var name:String?

    // @DataMember
    public var type:String?

    // @DataMember
    public var Description:String?

    // @DataMember
    public var isRequired:Bool?

    // @DataMember
    public var defaultValue:String?

    required public init(){}
}

// @DataContract
public class MarketplaceMappingDto : Codable
{
    // @DataMember
    public var parameterName:String?

    // @DataMember
    public var source:MarketplaceMappingSource?

    // @DataMember
    public var defaultValue:String?

    // @DataMember
    public var resolver:TokenMappingResolverType?

    // @DataMember
    public var tokenKey:String?

    // @DataMember
    public var fromRequestPath:String?

    // @DataMember
    public var isRequired:Bool?

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

public enum SubscriptionType : String, Codable
{
    case ManagedService
    case License
}

public protocol IHasAccountId
{
    var accountId:String? { get set }

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

// @DataContract
public class GroupDefinitionDto : TagDefinitionBaseDto
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

// @DataContract
public class TagDefinitionDto : TagDefinitionBaseDto
{
    // @DataMember
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

public class DatabaseIntegrationRequest : Codable
{
    public var integrationId:String?
    public var provider:DatabaseProvider?
    public var integrationName:String?
    public var isEnabled:Bool?

    required public init(){}
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

public class PagingArgs : Codable
{
    public var cursorArgs:CursorArgs?
    public var pageSize:Int?
    public var startingAfter:String?
    public var endingBefore:String?

    required public init(){}
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

// @DataContract
public class TimeZone : Codable
{
    // @DataMember
    public var zoneId:String?

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

public enum TriggerType : String, Codable
{
    case Membership
    case Schema
    case Files
    case Payments
}

// @DataContract
public class DeleteTrigger : CodeMashRequestBase
{
    // @DataMember
    public var triggerId:String?

    // @DataMember
    public var triggerType:TriggerType?

    // @DataMember
    public var schemaId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case triggerId
        case triggerType
        case schemaId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        triggerId = try container.decodeIfPresent(String.self, forKey: .triggerId)
        triggerType = try container.decodeIfPresent(TriggerType.self, forKey: .triggerType)
        schemaId = try container.decodeIfPresent(String.self, forKey: .schemaId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if triggerId != nil { try container.encode(triggerId, forKey: .triggerId) }
        if triggerType != nil { try container.encode(triggerType, forKey: .triggerType) }
        if schemaId != nil { try container.encode(schemaId, forKey: .schemaId) }
    }
}

// @DataContract
public class DisableTrigger : CodeMashRequestBase
{
    // @DataMember
    public var triggerId:String?

    // @DataMember
    public var triggerType:TriggerType?

    // @DataMember
    public var schemaId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case triggerId
        case triggerType
        case schemaId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        triggerId = try container.decodeIfPresent(String.self, forKey: .triggerId)
        triggerType = try container.decodeIfPresent(TriggerType.self, forKey: .triggerType)
        schemaId = try container.decodeIfPresent(String.self, forKey: .schemaId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if triggerId != nil { try container.encode(triggerId, forKey: .triggerId) }
        if triggerType != nil { try container.encode(triggerType, forKey: .triggerType) }
        if schemaId != nil { try container.encode(schemaId, forKey: .schemaId) }
    }
}

// @DataContract
public class EnableTrigger : CodeMashRequestBase
{
    // @DataMember
    public var triggerId:String?

    // @DataMember
    public var triggerType:TriggerType?

    // @DataMember
    public var schemaId:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case triggerId
        case triggerType
        case schemaId
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        triggerId = try container.decodeIfPresent(String.self, forKey: .triggerId)
        triggerType = try container.decodeIfPresent(TriggerType.self, forKey: .triggerType)
        schemaId = try container.decodeIfPresent(String.self, forKey: .schemaId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if triggerId != nil { try container.encode(triggerId, forKey: .triggerId) }
        if triggerType != nil { try container.encode(triggerType, forKey: .triggerType) }
        if schemaId != nil { try container.encode(schemaId, forKey: .schemaId) }
    }
}

public class GetTrigger : CodeMashRequestBase
{
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

// @DataContract
public class GetTriggers : CodeMashListPaginationRequestBase
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class SaveTriggerRequest : Codable
{
    public var type:TriggerType?
    public var triggerId:String?
    public var name:String?
    public var Description:String?
    public var isEnabled:Bool?
    public var preExecuteCode:String?
    public var action:TriggerActionDto?

    required public init(){}
}

// @DataContract
public class SaveTrigger : CodeMashRequestBase
{
    // @DataMember
    public var trigger:SaveTriggerRequest?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case trigger
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        trigger = try container.decodeIfPresent(SaveTriggerRequest.self, forKey: .trigger)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if trigger != nil { try container.encode(trigger, forKey: .trigger) }
    }
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

public class MembershipIntegrationRequest : Codable
{
    public var integrationId:String?
    public var provider:MembershipProvider?
    public var integrationName:String?
    public var isEnabled:Bool?

    required public init(){}
}

public class MembershipIntegration : Integration
{
    public var provider:MembershipProvider?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(MembershipProvider.self, forKey: .provider)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
    }
}

public class RoleName : Codable
{
    public var name:String?
    public var displayName:String?
    // @Ignore()
    public var isAdministrator:Bool?

    // @Ignore()
    public var isAuthenticated:Bool?

    // @Ignore()
    public var isGuest:Bool?

    // @Ignore()
    public var isRootRole:Bool?

    // @Ignore()
    public var isCollaboratorRole:Bool?

    // @Ignore()
    public var isSystemRole:Bool?

    required public init(){}
}

public class MembershipPolicy : Codable
{
    public var id:PolicyId?
    public var name:DisplayName?
    public var Description:String?
    public var statements:[PolicyStatement] = []
    public var disabled:Bool?
    public var isSystem:Bool?

    required public init(){}
}

public class PolicyId : Codable
{
    public var template:String?
    public var tenancyScopeViewId:String?
    public var viewId:String?
    public var isSystem:Bool?

    required public init(){}
}

public class MembershipRole : Codable
{
    public var id:RoleId?
    public var name:DisplayName?
    public var Description:String?
    public var attachedPolicies:[PolicyId] = []
    public var disabled:Bool?
    public var isSystem:Bool?

    required public init(){}
}

public class RoleId : Codable
{
    public var template:String?
    public var tenancyScopeViewId:String?
    public var viewId:String?
    public var isSystem:Bool?

    required public init(){}
}

public class MembershipTrigger : Trigger
{
    public var when:MembershipTriggerType?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case when
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        when = try container.decodeIfPresent(MembershipTriggerType.self, forKey: .when)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if when != nil { try container.encode(when, forKey: .when) }
    }
}

public class TriggerId : AggregateId, IHasDomainEntityId
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class TriggerByIdEventBase : Codable
{
    public var triggerId:TriggerId?

    required public init(){}
}

public class SchemaSettingsDto : Codable
{
    // @DataMember
    public var softDelete:Bool?

    required public init(){}
}

public class MongoDbAggregate : Codable
{
    public var id:MongoDbAggregateId?
    public var displayName:DisplayName?
    public var Description:String?
    public var query:MongoDbAggregateQuery?
    public var schemaId:SchemaId?

    required public init(){}
}

public class SchemaId : AggregateId, IHasDomainEntityId
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class MongoDbAggregateId : AggregateId, IHasDomainEntityId
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class DatabaseIntegration : Integration
{
    public var provider:DatabaseProvider?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(DatabaseProvider.self, forKey: .provider)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
    }
}

public class Schema : IHasDomainEntityId, Codable
{
    public var schemaName:SchemaName?
    public var id:SchemaId?
    public var draft:SchemaDraft?
    public var publishedVersions:IReadOnlyList<PublishedSchemaVersion>?
    public var triggers:[Trigger]?
    public var settings:SchemaSettings?

    required public init(){}
}

public class SchemaDraft : Codable
{
    public var dataSchema:DataSchema?
    public var visualSchema:VisualSchema?
    public var updatedAt:Date?

    required public init(){}
}

public class PublishedSchemaVersion : Codable
{
    public var version:SchemaVersion?
    public var dataSchema:DataSchema?
    public var visualSchema:VisualSchema?
    public var metaSchemaVersion:MetaSchemaVersion?
    public var publishedAt:Date?

    required public init(){}
}

public class SchemaDiff : Codable
{
    public var addedFields:IReadOnlyList<String>?
    public var removedFields:IReadOnlyList<String>?
    public var typeChangedFields:IReadOnlyList<String>?
    public var validatorTightenedFields:IReadOnlyList<String>?
    public var isEmpty:Bool?

    required public init(){}
}

public class SchemaSettings : Codable
{
    public var softDelete:Bool?

    required public init(){}
}

public class SchemaName : Codable
{
    public var value:String?
    public var title:String?

    required public init(){}
}

public class Taxonomy : IHasDomainEntityId, Codable
{
    public var parentId:TaxonomyId?
    public var id:TaxonomyId?
    public var name:TaxonomyName?
    public var Description:String?
    public var termsMetaVisualSchema:VisualSchema?
    public var termsMetaDataSchema:DataSchema?
    public var dependencies:[TaxonomyId]?
    public var recordId:RecordId?

    required public init(){}
}

public class TaxonomyId : AggregateId, IHasDomainEntityId
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class SchemaTrigger : Trigger
{
    public var schemaId:SchemaId?
    public var when:SchemaTriggerType?
    public var configuration:TemplateCode?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case schemaId
        case when
        case configuration
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        schemaId = try container.decodeIfPresent(SchemaId.self, forKey: .schemaId)
        when = try container.decodeIfPresent(SchemaTriggerType.self, forKey: .when)
        configuration = try container.decodeIfPresent(TemplateCode.self, forKey: .configuration)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if schemaId != nil { try container.encode(schemaId, forKey: .schemaId) }
        if when != nil { try container.encode(when, forKey: .when) }
        if configuration != nil { try container.encode(configuration, forKey: .configuration) }
    }
}

public class FilesIntegrationRequest : Codable
{
    public var integrationId:String?
    public var provider:FileProvider?
    public var integrationName:String?
    public var isEnabled:Bool?

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

// @DataContract
public class EmailMessageTranslationDto : IHasRazorTemplateCode, Codable
{
    // @DataMember
    public var language:String?

    // @DataMember
    public var content:EmailMessageContentDto?

    // @DataMember
    public var staticAttachments:IReadOnlySet<FileResourceRefDto>?

    required public init(){}
}

public class SaveEmailTemplate : CodeMashRequestBase
{
    public var templateName:String?
    public var Description:String?
    public var communicationChannel:CommunicationChannel?
    public var tags:[String]?
    // @DataMember
    public var staticAttachments:[FileResourceRefDto]?

    public var translations:[EmailMessageTranslationDto] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case templateName
        case Description
        case communicationChannel
        case tags
        case staticAttachments
        case translations
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        templateName = try container.decodeIfPresent(String.self, forKey: .templateName)
        Description = try container.decodeIfPresent(String.self, forKey: .Description)
        communicationChannel = try container.decodeIfPresent(CommunicationChannel.self, forKey: .communicationChannel)
        tags = try container.decodeIfPresent([String].self, forKey: .tags) ?? []
        staticAttachments = try container.decodeIfPresent([FileResourceRefDto].self, forKey: .staticAttachments) ?? []
        translations = try container.decodeIfPresent([EmailMessageTranslationDto].self, forKey: .translations) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if templateName != nil { try container.encode(templateName, forKey: .templateName) }
        if Description != nil { try container.encode(Description, forKey: .Description) }
        if communicationChannel != nil { try container.encode(communicationChannel, forKey: .communicationChannel) }
        if tags != nil { try container.encode(tags, forKey: .tags) }
        if staticAttachments != nil { try container.encode(staticAttachments, forKey: .staticAttachments) }
        if translations.count > 0 { try container.encode(translations, forKey: .translations) }
    }
}

// @DataContract
public class TokenMappingDto : Codable
{
    // @DataMember
    public var key:String?

    // @DataMember
    public var value:String?

    // @DataMember
    public var resolver:TokenMappingResolverType?

    required public init(){}
}

// @DataContract
public class TranslationDto : Codable
{
    // @DataMember
    public var language:String?

    // @DataMember
    public var content:String?

    required public init(){}
}

public class EmailIntegrationRequest : Codable
{
    public var integrationId:String?
    public var provider:EmailProvider?
    public var integrationName:String?
    public var isEnabled:Bool?
    public var emailAddress:String?
    public var emailSenderName:String?

    required public init(){}
}

public class EmailCampaignRequest : Codable
{
    public var source:EmailCampaignRecipientsSourceTypes?
    public var templateId:String?
    public var integrationId:String?
    public var language:String?
    public var initiatorId:String?
    public var notes:String?
    // @DataMember
    public var mappedTokens:[TokenMappingDto]?

    // @DataMember
    public var campaignTime:Int?

    required public init(){}
}

public class EmailFooterId : Codable
{
    public var value:String?

    required public init(){}
}

// @DataContract
public class MessageTranslation<TContent : Codable> : Codable
{
    required public init(){}
}

public class EmailIntegration : Integration
{
    public var provider:EmailProvider?
    public var emailAddress:EmailAddress?
    public var emailSenderName:EmailSenderName?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
        case emailAddress
        case emailSenderName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(EmailProvider.self, forKey: .provider)
        emailAddress = try container.decodeIfPresent(EmailAddress.self, forKey: .emailAddress)
        emailSenderName = try container.decodeIfPresent(EmailSenderName.self, forKey: .emailSenderName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
        if emailAddress != nil { try container.encode(emailAddress, forKey: .emailAddress) }
        if emailSenderName != nil { try container.encode(emailSenderName, forKey: .emailSenderName) }
    }
}

public class EmailSignatureId : Codable
{
    public var value:String?

    required public init(){}
}

public class TemplateId : Codable
{
    public var value:String?

    required public init(){}
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

public class CodeIntegration : Integration
{
    public var provider:CodeProvider?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(CodeProvider.self, forKey: .provider)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
    }
}

public class MarketplaceIntegration : Integration
{
    public var listingViewId:String?
    public var transport:MarketplaceIntegrationTransport?
    public var vendor:String?
    public var category:MarketplaceIntegrationCategory?
    public var Description:String?
    public var config:IReadOnlyDictionary<String, String>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case capability
        case listingViewId
        case transport
        case vendor
        case category
        case Description
        case config
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        capability = try container.decodeIfPresent(String.self, forKey: .capability)
        listingViewId = try container.decodeIfPresent(String.self, forKey: .listingViewId)
        transport = try container.decodeIfPresent(MarketplaceIntegrationTransport.self, forKey: .transport)
        vendor = try container.decodeIfPresent(String.self, forKey: .vendor)
        category = try container.decodeIfPresent(MarketplaceIntegrationCategory.self, forKey: .category)
        Description = try container.decodeIfPresent(String.self, forKey: .Description)
        config = try container.decodeIfPresent(IReadOnlyDictionary<String, String>.self, forKey: .config)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if capability != nil { try container.encode(capability, forKey: .capability) }
        if listingViewId != nil { try container.encode(listingViewId, forKey: .listingViewId) }
        if transport != nil { try container.encode(transport, forKey: .transport) }
        if vendor != nil { try container.encode(vendor, forKey: .vendor) }
        if category != nil { try container.encode(category, forKey: .category) }
        if Description != nil { try container.encode(Description, forKey: .Description) }
        if config != nil { try container.encode(config, forKey: .config) }
    }
}

public class MarketplaceFunctionBinding : IHasDomainEntityId, Codable
{
    public var bindingId:String?
    public var integrationId:IntegrationId?
    public var functionKey:String?
    public var displayName:DisplayName?
    public var Description:String?
    public var isEnabled:Bool?
    public var mappings:IReadOnlyList<MarketplaceFunctionMapping>?
    public var viewId:String?

    required public init(){}
}

// @DataContract
public class PushMessageTranslationDto : IHasRazorTemplateCode, Codable
{
    // @DataMember
    public var language:String?

    // @DataMember
    public var content:PushMessageContentDto?

    required public init(){}
}

public class SavePushTemplate : CodeMashRequestBase
{
    public var templateName:String?
    public var Description:String?
    public var communicationChannel:CommunicationChannel?
    public var tags:[String]?
    public var translations:[PushMessageTranslationDto] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case templateName
        case Description
        case communicationChannel
        case tags
        case translations
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        templateName = try container.decodeIfPresent(String.self, forKey: .templateName)
        Description = try container.decodeIfPresent(String.self, forKey: .Description)
        communicationChannel = try container.decodeIfPresent(CommunicationChannel.self, forKey: .communicationChannel)
        tags = try container.decodeIfPresent([String].self, forKey: .tags) ?? []
        translations = try container.decodeIfPresent([PushMessageTranslationDto].self, forKey: .translations) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if templateName != nil { try container.encode(templateName, forKey: .templateName) }
        if Description != nil { try container.encode(Description, forKey: .Description) }
        if communicationChannel != nil { try container.encode(communicationChannel, forKey: .communicationChannel) }
        if tags != nil { try container.encode(tags, forKey: .tags) }
        if translations.count > 0 { try container.encode(translations, forKey: .translations) }
    }
}

public class PushIntegrationRequest : Codable
{
    public var integrationId:String?
    public var provider:PushProvider?
    public var integrationName:String?
    public var isEnabled:Bool?

    required public init(){}
}

public protocol IHasAccountId
{
    var accountId:String? { get set }

}

// @DataContract
public class PushDeviceDto : Codable
{
    // @DataMember
    public var deviceId:String?

    // @DataMember
    public var deviceOs:String?

    // @DataMember
    public var token:String?

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

public class PaymentIntegrationRequest : Codable
{
    public var integrationId:String?
    public var gatewayPlatform:PaymentGatewayPlatform?
    public var integrationName:String?
    public var isEnabled:Bool?

    required public init(){}
}

public class LoggingIntegrationRequest : Codable
{
    public var integrationId:String?
    public var provider:LoggingProvider?
    public var integrationName:String?
    public var isEnabled:Bool?

    required public init(){}
}

public class LoggingIntegration : Integration
{
    public var provider:LoggingProvider?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(LoggingProvider.self, forKey: .provider)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
    }
}

public class LlmIntegrationRequest : Codable
{
    public var integrationId:String?
    public var provider:LlmProvider?
    public var integrationName:String?
    public var isEnabled:Bool?
    public var endpoint:String?
    public var defaultModel:String?

    required public init(){}
}

public class McpIntegrationRequest : Codable
{
    public var integrationId:String?
    public var provider:McpProvider?
    public var transport:McpTransport?
    public var integrationName:String?
    public var isEnabled:Bool?
    public var name:String?
    public var category:String?
    public var Description:String?
    public var icon:String?

    required public init(){}
}

public class WebhookIntegration : Integration
{
    public var destinations:IReadOnlySet<WebhookDestination>?
    public var extraHeaders:IReadOnlyDictionary<String, String>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case capability
        case destinations
        case extraHeaders
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        capability = try container.decodeIfPresent(String.self, forKey: .capability)
        destinations = try container.decodeIfPresent(IReadOnlySet<WebhookDestination>.self, forKey: .destinations)
        extraHeaders = try container.decodeIfPresent(IReadOnlyDictionary<String, String>.self, forKey: .extraHeaders)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if capability != nil { try container.encode(capability, forKey: .capability) }
        if destinations != nil { try container.encode(destinations, forKey: .destinations) }
        if extraHeaders != nil { try container.encode(extraHeaders, forKey: .extraHeaders) }
    }
}

public class WebhookDestination : Codable
{
    public var destinationId:WebhookDestinationId?
    public var destinationName:DisplayName?
    public var endpointUrl:DomainUrl?
    public var selectedEvents:IReadOnlySet<TriggerEventName>?
    public var extraHeaders:IReadOnlyDictionary<String, String>?
    public var isEnabled:Bool?

    required public init(){}
}

public class WebhookDestinationId : AggregateId, IHasDomainEntityId
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public enum SchedulerTaskType : String, Codable
{
    case EmailCampaign
    case PushCampaign
    case SmsCampaign
    case CodeFunctionalCall
    case WebhookCall
}

public class SchedulerTaskRequest : Codable
{
    public var type:SchedulerTaskType?

    required public init(){}
}

public class SchedulerTask : IHasDomainEntityId, Codable
{
    public var id:TaskId?
    public var type:SchedulerTaskType?
    public var name:DisplayName?
    public var Description:String?
    public var cron:CronExpression?
    public var payloadJson:String?
    public var initiatorId:UserId?
    public var isEnabled:Bool?
    public var stopOnError:Bool?

    required public init(){}
}

public class TaskId : AggregateId
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

// @DataContract
public class AccountOwnerDto : Codable
{
    // @DataMember
    public var email:String?

    // @DataMember
    public var displayName:String?

    // @DataMember
    public var billingEmail:String?

    // @DataMember
    public var operationsEmail:String?

    // @DataMember
    public var securityEmail:String?

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

// @DataContract
public class AccountStatusDto : Codable
{
    // @DataMember
    public var accountId:String?

    // @DataMember
    public var accountIdAsGuid:String?

    // @DataMember
    public var userId:String?

    // @DataMember
    public var loggedInUserId:String?

    // @DataMember
    public var loggedInUserEmail:String?

    // @DataMember
    public var status:AccountStatus?

    // @DataMember
    public var projectCap:Int?

    // @DataMember
    public var permissions:[String] = []

    // @DataMember
    public var roles:[String] = []

    // @DataMember
    public var allowedProjects:[String]?

    // @DataMember
    public var trialWasIssued:Bool?

    required public init(){}
}

// @DataContract
public class ProjectDto : IHasViewId, IBindableContract, Codable
{
    // @DataMember
    public var accountViewId:String?

    // @DataMember
    public var projectStatus:ProjectStatus?

    // @DataMember
    public var isActive:Bool?

    // @DataMember
    public var viewId:String?

    // @DataMember
    public var name:String?

    // @DataMember
    public var uniqueName:String?

    // @DataMember
    public var hostLabel:String?

    // @DataMember
    public var apiHost:String?

    // @DataMember
    public var Description:String?

    // @DataMember
    public var marketingUrl:String?

    // @DataMember
    public var defaultLanguage:String?

    // @DataMember
    public var languages:[String] = []

    // @DataMember
    public var regions:[ProjectRegionDto]?

    // @DataMember
    public var brand:ProjectBrandDto?

    // @DataMember
    public var notificationSettings:NotificationSettingsDto?

    // @DataMember
    public var allowedOrigins:[String]?

    // @DataMember
    public var database:DatabaseDto?

    // @DataMember
    public var email:EmailDto?

    // @DataMember
    public var ai:AiDto?

    // @DataMember
    public var membership:MembershipDto?

    // @DataMember
    public var logging:LoggingDto?

    // @DataMember
    public var serverEvents:ServerEventsDto?

    // @DataMember
    public var push:PushDto?

    // @DataMember
    public var scheduler:SchedulerDto?

    // @DataMember
    public var code:CodeDto?

    // @DataMember
    public var files:FilesDto?

    // @DataMember
    public var payments:PaymentsDto?

    // @DataMember
    public var sms:SmsDto?

    // @DataMember
    public var databaseEnabled:Bool?

    // @DataMember
    public var emailEnabled:Bool?

    // @DataMember
    public var membershipEnabled:Bool?

    // @DataMember
    public var loggingEnabled:Bool?

    // @DataMember
    public var serverEventsEnabled:Bool?

    // @DataMember
    public var pushEnabled:Bool?

    // @DataMember
    public var schedulerEnabled:Bool?

    // @DataMember
    public var codeEnabled:Bool?

    // @DataMember
    public var filesEnabled:Bool?

    // @DataMember
    public var paymentsEnabled:Bool?

    // @DataMember
    public var smsEnabled:Bool?

    // @DataMember
    public var defaultFilesIntegrationViewId:String?

    // @DataMember
    public var defaultDatabaseIntegrationViewId:String?

    // @DataMember
    public var defaultEmailIntegrationViewId:String?

    // @DataMember
    public var defaultLlmIntegrationViewId:String?

    // @DataMember
    public var defaultPushIntegrationViewId:String?

    // @DataMember
    public var defaultSmsIntegrationViewId:String?

    // @DataMember
    public var connections:Int?

    required public init(){}
}

// @DataContract
public class ProjectListItemDto : Codable
{
    // @DataMember
    public var viewId:String?

    // @DataMember
    public var isActive:Bool?

    // @DataMember
    public var name:String?

    // @DataMember
    public var uniqueName:String?

    // @DataMember
    public var regions:[ProjectRegionDto]?

    required public init(){}
}

public class ProjectRegionDto : Codable
{
    public var id:String?
    public var continent:Continent?
    public var name:String?

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

public class LicenseDto : CodeMashSubscriptionDto
{
    public var isEnterprise:Bool?
    public var projectCap:Int?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case isEnterprise
        case projectCap
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        isEnterprise = try container.decodeIfPresent(Bool.self, forKey: .isEnterprise)
        projectCap = try container.decodeIfPresent(Int.self, forKey: .projectCap)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if isEnterprise != nil { try container.encode(isEnterprise, forKey: .isEnterprise) }
        if projectCap != nil { try container.encode(projectCap, forKey: .projectCap) }
    }
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

public class GetTriggerResponse : ResponseBase
{
    public var trigger:TriggerDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case trigger
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        trigger = try container.decodeIfPresent(TriggerDto.self, forKey: .trigger)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if trigger != nil { try container.encode(trigger, forKey: .trigger) }
    }
}

// @DataContract
public class MembershipTriggerProjectionList : TriggerProjectionList
{
    // @DataMember
    public var type:MembershipTriggerType?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case type
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(MembershipTriggerType.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if type != nil { try container.encode(type, forKey: .type) }
    }
}

// @DataContract
public class GetTriggersResponse : ResponseBase
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class RoleItemDto : Codable
{
    public var id:String?
    public var name:String?
    public var displayName:String?
    public var Description:String?
    public var isSystem:Bool?
    public var attachedPolicies:[String]?

    required public init(){}
}

public class RoleListProjectionDto : Codable
{
    public var viewId:String?
    public var name:String?
    public var displayName:String?
    public var isSystem:Bool?
    public var policyCount:Int?

    required public init(){}
}

public class PolicyItemDto : Codable
{
    public var id:String?
    public var name:String?
    public var Description:String?
    public var isSystem:Bool?
    public var statements:[PolicyStatementDto]?

    required public init(){}
}

public class MembershipIntegrationDto : IntegrationDto
{
    public var provider:MembershipProvider?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(MembershipProvider.self, forKey: .provider)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
    }
}

public class MembershipIntegrationListProjection : IntegrationListProjection
{
    // @DataMember
    public var provider:MembershipProvider?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(MembershipProvider.self, forKey: .provider)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
    }
}

// @DataContract
public class SchemaTriggerProjectionList : TriggerProjectionList
{
    // @DataMember
    public var type:SchemaTriggerType?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case type
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(SchemaTriggerType.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if type != nil { try container.encode(type, forKey: .type) }
    }
}

public class TaxonomyDto : IHasViewId, Codable
{
    // @DataMember
    public var viewId:String?

    // @DataMember
    public var name:String?

    // @DataMember
    public var slug:String?

    // @DataMember
    public var parentId:String?

    // @DataMember
    public var Description:String?

    // @DataMember
    public var termsMetaDataSchema:DataSchemaDto?

    // @DataMember
    public var termsMetaVisualSchema:VisualSchemaDto?

    // @DataMember
    public var dependencies:[String]?

    required public init(){}
}

public class TaxonomyListProjection : IHasViewId, Codable
{
    // @DataMember
    public var viewId:String?

    // @DataMember
    public var taxonomyName:String?

    // @DataMember
    public var taxonomySlug:String?

    // @DataMember
    public var parentId:String?

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

public class SchemaDraftDto : Codable
{
    // @DataMember
    public var dataSchema:DataSchemaDto?

    // @DataMember
    public var visualSchema:VisualSchemaDto?

    // @DataMember
    public var updatedAt:Date?

    required public init(){}
}

public class SchemaDiffDto : Codable
{
    // @DataMember
    public var fromVersion:Int?

    // @DataMember
    public var toVersion:Int?

    // @DataMember
    public var added:[String] = []

    // @DataMember
    public var removed:[String] = []

    // @DataMember
    public var typeChanged:[String] = []

    // @DataMember
    public var validatorTightened:[String] = []

    required public init(){}
}

public class SchemaVersionSummaryDto : Codable
{
    // @DataMember
    public var version:Int?

    // @DataMember
    public var metaSchemaVersion:Int?

    // @DataMember
    public var publishedAt:Date?

    required public init(){}
}

public class DatabaseIntegrationDto : IntegrationDto
{
    public var provider:DatabaseProvider?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(DatabaseProvider.self, forKey: .provider)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
    }
}

public class DatabaseIntegrationListProjection : IntegrationListProjection
{
    // @DataMember
    public var provider:DatabaseProvider?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(DatabaseProvider.self, forKey: .provider)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
    }
}

public class MongoDbAggregateListProjection : IHasViewId, Codable
{
    // @DataMember
    public var viewId:String?

    // @DataMember
    public var displayName:String?

    // @DataMember
    public var schemaViewId:String?

    required public init(){}
}

// @DataContract
public class FilesTriggerProjectionList : TriggerProjectionList
{
    // @DataMember
    public var type:FilesTriggerType?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case type
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(FilesTriggerType.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if type != nil { try container.encode(type, forKey: .type) }
    }
}

public class FilesIntegrationDto : IntegrationDto
{
    public var provider:FileProvider?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(FileProvider.self, forKey: .provider)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
    }
}

public class FilesIntegrationListProjection : IntegrationListProjection
{
    // @DataMember
    public var provider:FileProvider?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(FileProvider.self, forKey: .provider)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
    }
}

// @DataContract
public class TemplateListProjection : IHasViewId, Codable
{
    // @DataMember
    public var viewId:String?

    // @DataMember
    public var templateName:String?

    // @DataMember
    public var isActive:Bool?

    // @DataMember
    public var type:CommunicationChannel?

    // @DataMember
    public var tags:[String]?

    required public init(){}
}

// @DataContract
public class HtmlFromMjmlResponse : Codable
{
    // @DataMember(Name="html")
    public var html:String?

    // @DataMember(Name="errors")
    public var errors:[MjmlParseError] = []

    required public init(){}
}

public class SystemEmailTemplateListProjection : EmailTemplateListProjection
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
public class EmailSignatureDto : IHasViewId, Codable
{
    // @DataMember
    public var viewId:String?

    // @DataMember
    public var displayName:String?

    // @DataMember
    public var translations:[TranslationDto] = []

    required public init(){}
}

// @DataContract
public class ListItemWithTranslationsProjection : ListItemProjection
{
    // @DataMember
    public var translations:[String] = []

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case translations
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        translations = try container.decodeIfPresent([String].self, forKey: .translations) ?? []
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if translations.count > 0 { try container.encode(translations, forKey: .translations) }
    }
}

public class EmailSettings : IBindableContract, Codable
{
    public var signatures:IList<ListItemWithTranslationsProjection>?
    public var footers:IList<ListItemWithTranslationsProjection>?

    required public init(){}
}

public class EmailIntegrationDto : IntegrationDto
{
    public var provider:EmailProvider?
    public var emailAddress:String?
    public var emailSenderName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
        case emailAddress
        case emailSenderName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(EmailProvider.self, forKey: .provider)
        emailAddress = try container.decodeIfPresent(String.self, forKey: .emailAddress)
        emailSenderName = try container.decodeIfPresent(String.self, forKey: .emailSenderName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
        if emailAddress != nil { try container.encode(emailAddress, forKey: .emailAddress) }
        if emailSenderName != nil { try container.encode(emailSenderName, forKey: .emailSenderName) }
    }
}

public class EmailIntegrationListProjection : IntegrationListProjection
{
    public var emailProvider:EmailProvider?
    public var senderEmailAddress:String?
    public var senderDisplayName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case emailProvider
        case senderEmailAddress
        case senderDisplayName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        emailProvider = try container.decodeIfPresent(EmailProvider.self, forKey: .emailProvider)
        senderEmailAddress = try container.decodeIfPresent(String.self, forKey: .senderEmailAddress)
        senderDisplayName = try container.decodeIfPresent(String.self, forKey: .senderDisplayName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if emailProvider != nil { try container.encode(emailProvider, forKey: .emailProvider) }
        if senderEmailAddress != nil { try container.encode(senderEmailAddress, forKey: .senderEmailAddress) }
        if senderDisplayName != nil { try container.encode(senderDisplayName, forKey: .senderDisplayName) }
    }
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
public class EmailFooterDto : IHasViewId, Codable
{
    // @DataMember
    public var viewId:String?

    // @DataMember
    public var displayName:String?

    // @DataMember
    public var translations:[TranslationDto] = []

    required public init(){}
}

// @DataContract
public class EmailCampaignDto : CampaignDto
{
    // @DataMember
    public var deliverySettings:EmailCampaignDeliverySettingsDto?

    // @DataMember
    public var template:EmailTemplateDto?

    // @DataMember
    public var templateIsSystem:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case deliverySettings
        case template
        case templateIsSystem
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        deliverySettings = try container.decodeIfPresent(EmailCampaignDeliverySettingsDto.self, forKey: .deliverySettings)
        template = try container.decodeIfPresent(EmailTemplateDto.self, forKey: .template)
        templateIsSystem = try container.decodeIfPresent(Bool.self, forKey: .templateIsSystem)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if deliverySettings != nil { try container.encode(deliverySettings, forKey: .deliverySettings) }
        if template != nil { try container.encode(template, forKey: .template) }
        if templateIsSystem != nil { try container.encode(templateIsSystem, forKey: .templateIsSystem) }
    }
}

// @DataContract
public class EmailCampaignListProjection : Codable
{
    // @DataMember
    public var viewId:String?

    // @DataMember
    public var templateName:String?

    // @DataMember
    public var templateId:String?

    // @DataMember
    public var integrationId:String?

    // @DataMember
    public var language:String?

    // @DataMember
    public var strategy:String?

    // @DataMember
    public var latestStatus:CampaignStatus?

    // @DataMember
    public var createdOn:Date?

    required public init(){}
}

// @DataContract
public class EmailCampaignBatchDto : CampaignBatchDto
{
    // @DataMember
    public var recipients:EmailRecipientsDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case recipients
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        recipients = try container.decodeIfPresent(EmailRecipientsDto.self, forKey: .recipients)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if recipients != nil { try container.encode(recipients, forKey: .recipients) }
    }
}

// @DataContract
public class EmailCampaignBatchNotificationDto : CampaignBatchNotificationDto
{
    // @DataMember
    public var recipients:EmailRecipientsDto?

    // @DataMember
    public var content:EmailMessageContentDto?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case recipients
        case content
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        recipients = try container.decodeIfPresent(EmailRecipientsDto.self, forKey: .recipients)
        content = try container.decodeIfPresent(EmailMessageContentDto.self, forKey: .content)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if recipients != nil { try container.encode(recipients, forKey: .recipients) }
        if content != nil { try container.encode(content, forKey: .content) }
    }
}

public class BatchStatusChangeEntryDto : Codable
{
    public var time:Date?
    public var status:CampaignBatchStatus?
    public var errors:IReadOnlySet<ErrorDto>?

    required public init(){}
}

// @DataContract
public class CampaignStatsDto : Codable
{
    // @DataMember
    public var batches:Int?

    // @DataMember
    public var sent:Int?

    // @DataMember
    public var failed:Int?

    // @DataMember
    public var successRate:Double?

    required public init(){}
}

// @DataContract
public class PushTemplateListProjection : TemplateListProjection
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class PushIntegrationDto : IntegrationDto
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

public class PushIntegrationListProjection : IntegrationListProjection
{
    // @DataMember
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
public class PaymentTriggerProjectionList : TriggerProjectionList
{
    // @DataMember
    public var type:PaymentTriggerType?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case type
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(PaymentTriggerType.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if type != nil { try container.encode(type, forKey: .type) }
    }
}

public class PaymentsIntegrationDto : IntegrationDto
{
    public var gatewayPlatform:PaymentGatewayPlatform?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case gatewayPlatform
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        gatewayPlatform = try container.decodeIfPresent(PaymentGatewayPlatform.self, forKey: .gatewayPlatform)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if gatewayPlatform != nil { try container.encode(gatewayPlatform, forKey: .gatewayPlatform) }
    }
}

public class PaymentsIntegrationListProjection : IntegrationListProjection
{
    // @DataMember
    public var gatewayPlatform:PaymentGatewayPlatform?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case gatewayPlatform
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        gatewayPlatform = try container.decodeIfPresent(PaymentGatewayPlatform.self, forKey: .gatewayPlatform)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if gatewayPlatform != nil { try container.encode(gatewayPlatform, forKey: .gatewayPlatform) }
    }
}

public class LoggingIntegrationDto : IntegrationDto
{
    public var provider:LoggingProvider?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(LoggingProvider.self, forKey: .provider)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
    }
}

public class LoggingIntegrationListProjection : IntegrationListProjection
{
    // @DataMember
    public var provider:LoggingProvider?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(LoggingProvider.self, forKey: .provider)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
    }
}

public class LlmIntegrationDto : IntegrationDto
{
    public var provider:LlmProvider?
    public var baseUrl:String?
    public var defaultModel:String?
    public var isConfigured:Bool?
    public var isSystemOwned:Bool?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
        case baseUrl
        case defaultModel
        case isConfigured
        case isSystemOwned
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(LlmProvider.self, forKey: .provider)
        baseUrl = try container.decodeIfPresent(String.self, forKey: .baseUrl)
        defaultModel = try container.decodeIfPresent(String.self, forKey: .defaultModel)
        isConfigured = try container.decodeIfPresent(Bool.self, forKey: .isConfigured)
        isSystemOwned = try container.decodeIfPresent(Bool.self, forKey: .isSystemOwned)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
        if baseUrl != nil { try container.encode(baseUrl, forKey: .baseUrl) }
        if defaultModel != nil { try container.encode(defaultModel, forKey: .defaultModel) }
        if isConfigured != nil { try container.encode(isConfigured, forKey: .isConfigured) }
        if isSystemOwned != nil { try container.encode(isSystemOwned, forKey: .isSystemOwned) }
    }
}

public class LlmIntegrationListProjection : IntegrationListProjection
{
    public var llmProvider:LlmProvider?
    public var baseUrl:String?
    public var defaultModel:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case llmProvider
        case baseUrl
        case defaultModel
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        llmProvider = try container.decodeIfPresent(LlmProvider.self, forKey: .llmProvider)
        baseUrl = try container.decodeIfPresent(String.self, forKey: .baseUrl)
        defaultModel = try container.decodeIfPresent(String.self, forKey: .defaultModel)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if llmProvider != nil { try container.encode(llmProvider, forKey: .llmProvider) }
        if baseUrl != nil { try container.encode(baseUrl, forKey: .baseUrl) }
        if defaultModel != nil { try container.encode(defaultModel, forKey: .defaultModel) }
    }
}

public class McpIntegrationDto : IntegrationDto
{
    public var provider:McpProvider?
    public var transport:McpTransport?
    public var metadata:McpMetadata?
    public var isConfigured:Bool?
    public var isSystemOwned:Bool?
    public var command:String?
    public var args:[String]?
    public var serverUrl:String?
    public var auth:McpAuth?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
        case transport
        case metadata
        case isConfigured
        case isSystemOwned
        case command
        case args
        case serverUrl
        case auth
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(McpProvider.self, forKey: .provider)
        transport = try container.decodeIfPresent(McpTransport.self, forKey: .transport)
        metadata = try container.decodeIfPresent(McpMetadata.self, forKey: .metadata)
        isConfigured = try container.decodeIfPresent(Bool.self, forKey: .isConfigured)
        isSystemOwned = try container.decodeIfPresent(Bool.self, forKey: .isSystemOwned)
        command = try container.decodeIfPresent(String.self, forKey: .command)
        args = try container.decodeIfPresent([String].self, forKey: .args) ?? []
        serverUrl = try container.decodeIfPresent(String.self, forKey: .serverUrl)
        auth = try container.decodeIfPresent(McpAuth.self, forKey: .auth)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
        if transport != nil { try container.encode(transport, forKey: .transport) }
        if metadata != nil { try container.encode(metadata, forKey: .metadata) }
        if isConfigured != nil { try container.encode(isConfigured, forKey: .isConfigured) }
        if isSystemOwned != nil { try container.encode(isSystemOwned, forKey: .isSystemOwned) }
        if command != nil { try container.encode(command, forKey: .command) }
        if args != nil { try container.encode(args, forKey: .args) }
        if serverUrl != nil { try container.encode(serverUrl, forKey: .serverUrl) }
        if auth != nil { try container.encode(auth, forKey: .auth) }
    }
}

public class McpIntegrationListProjection : IntegrationListProjection
{
    public var mcpProvider:McpProvider?
    public var transport:McpTransport?
    public var category:String?
    public var Description:String?
    public var icon:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case mcpProvider
        case transport
        case category
        case Description
        case icon
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        mcpProvider = try container.decodeIfPresent(McpProvider.self, forKey: .mcpProvider)
        transport = try container.decodeIfPresent(McpTransport.self, forKey: .transport)
        category = try container.decodeIfPresent(String.self, forKey: .category)
        Description = try container.decodeIfPresent(String.self, forKey: .Description)
        icon = try container.decodeIfPresent(String.self, forKey: .icon)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if mcpProvider != nil { try container.encode(mcpProvider, forKey: .mcpProvider) }
        if transport != nil { try container.encode(transport, forKey: .transport) }
        if category != nil { try container.encode(category, forKey: .category) }
        if Description != nil { try container.encode(Description, forKey: .Description) }
        if icon != nil { try container.encode(icon, forKey: .icon) }
    }
}

// @DataContract
public class SchedulerTaskListProjection : IHasViewId, Codable
{
    // @DataMember
    public var taskId:String?

    // @DataMember
    public var name:String?

    // @DataMember
    public var cron:String?

    // @DataMember
    public var type:SchedulerTaskType?

    // @DataMember
    public var isEnabled:Bool?

    // @DataMember
    public var viewId:String?

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

public enum SmtpPorts : Int, Codable
{
    case Default = 25
    case Ssl = 465
    case Tls = 587
    case Fallback = 2525
}

public enum AwsIntegrationType : String, Codable
{
    case Iam
    case CrossAccountRole
}

public enum CollectionEmailCampaignRecipientField : String, Codable
{
    case User
    case Email
}

public enum MembershipTriggerType : String, Codable
{
    case OnRegistered
    case OnInvited
    case OnVerified
    case OnUpdated
    case OnDeleted
    case OnBlocked
    case OnReactivated
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

public enum SchemaTriggerType : String, Codable
{
    case OnInserted
    case OnDeleted
    case OnUpdated
}

public enum FilesTriggerType : String, Codable
{
    case OnFileUploaded
    case OnFileDeleted
}

public enum PaymentTriggerType : String, Codable
{
    case OnOrderCreated
    case OnOrderPaid
    case OnWebhookCallReceived
}

public enum AwsS3IntegrationType : String, Codable
{
    case Iam
    case CrossAccountRole
}

public enum AwsS3LoggingIntegrationType : String, Codable
{
    case Iam
    case CrossAccountRole
}

public class OAuthModeConfig : Codable
{
    public var name:DisplayName?
    public var callbackUrl:Uri?
    public var logoutUrl:Uri?
    public var failureRedirectUrl:Uri?
    public var roleName:RoleName?

    required public init(){}
}

public enum AwsLambdaIntegrationType : String, Codable
{
    case Iam
    case CrossAccountRole
}

public class CodeIntegrationRequest : Codable
{
    public var integrationId:String?
    public var provider:CodeProvider?
    public var integrationName:String?
    public var isEnabled:Bool?

    required public init(){}
}

public protocol ILlmApiKeyRequest
{
    var apiKey:String? { get set }

}

// @DataContract
public class TemplateDto : IHasViewId, Codable
{
    // @DataMember
    public var viewId:String?

    // @DataMember
    public var templateName:String?

    // @DataMember
    public var Description:String?

    // @DataMember
    public var communicationChannel:CommunicationChannel?

    // @DataMember
    public var isActive:Bool?

    // @DataMember
    public var tags:[String]?

    required public init(){}
}

public protocol IHasViewId
{
    var viewId:String? { get set }

}

public protocol IBindableContract
{
}

public protocol IHasRazorTemplateCode
{
}

// @DataContract
public class SmsMessageTranslationDto : IHasRazorTemplateCode, Codable
{
    // @DataMember
    public var language:String?

    // @DataMember
    public var content:SmsMessageContentDto?

    required public init(){}
}

public enum SystemEmailTemplateTheme : String, Codable
{
    case Text
    case Branded
    case Creative
}

public protocol IHasDatabaseId
{
    var id:String? { get set }

}

public class EmailCampaignDeliverySettingsDto : Codable
{
    // @DataMember
    public var recipientsSourceType:EmailCampaignRecipientsSourceTypes?

    // @DataMember
    public var mappedTokens:IReadOnlySet<TokenMappingDto>?

    // @DataMember
    public var campaignTime:Int?

    // @DataMember
    public var respectTimeZoneSettings:RespectTimeZoneSettings?

    required public init(){}
}

public enum TriggerActionType : String, Codable
{
    case Code
    case Push
    case Sms
    case Email
    case WebhookCall
}

// @DataContract
public class PushCampaignDeliverySettingsDto : Codable
{
    // @DataMember
    public var recipientsSourceType:PushCampaignRecipientsSourceTypes?

    // @DataMember
    public var mappedTokens:[TokenMappingDto]?

    // @DataMember
    public var campaignTime:Int?

    // @DataMember
    public var respectTimeZoneSettings:RespectTimeZoneSettings?

    required public init(){}
}

// @DataContract
public class CodeDeliverySettingsDto : Codable
{
    // @DataMember
    public var mappedTokens:[TokenMappingDto]?

    required public init(){}
}

// @DataContract
public class WebhookDeliverySettingsDto : Codable
{
    // @DataMember
    public var eventName:String?

    // @DataMember
    public var contentType:String?

    // @DataMember
    public var includeRawPayload:Bool?

    // @DataMember
    public var mappedTokens:IReadOnlySet<TokenMappingDto>?

    required public init(){}
}

public enum EmailCampaignRecipientsSourceTypes : String, Codable
{
    case AllUsers
    case SpecifiedUsers
    case AccountUsers
    case Email
    case Collection
}

// @Flags()
public enum RespectTimeZoneSettings : Int, Codable
{
    case RespectToLastLoginZone = 1
    case RespectToRegistrationZone = 2
    case RespectToRegistrationProjectZone = 4
}

public enum PushCampaignRecipientsSourceTypes : String, Codable
{
    case AllUsers
    case SpecifiedUsers
    case Collection
    case Devices
}

// @DataContract
public class PushDeviceDeliveryTokenDto : Codable
{
    required public init(){}
}

public enum SmsCampaignRecipientsSourceTypes : String, Codable
{
    case AllUsers
    case SpecifiedUsers
    case AccountUsers
    case PhoneNumbers
    case Collection
}

// @DataContract
public class SmsCampaignDeliverySettingsDto : Codable
{
    // @DataMember
    public var recipientsSourceType:SmsCampaignRecipientsSourceTypes?

    // @DataMember
    public var mappedTokens:[TokenMappingDto]?

    // @DataMember
    public var campaignTime:Int?

    // @DataMember
    public var respectTimeZoneSettings:RespectTimeZoneSettings?

    required public init(){}
}

public enum LlmProvider : String, Codable
{
    case OpenAI
    case Anthropic
    case Ollama
    case Groq
    case Google
    case Mistral
    case OpenRouter
    case Grok
}

public enum McpProvider : String, Codable
{
    case Docker
    case Obsidian
    case GoogleCalendar
}

public enum McpTransport : String, Codable
{
    case Sse
    case HttpStream
    case Stdio
}

public class McpMetadata : Codable
{
    public var name:String?
    public var category:String?
    public var Description:String?
    public var icon:String?

    required public init(){}
}

public enum McpAuth : String, Codable
{
    case OAuth2
    case ApiKey
    case None
}

public enum CodeProvider : String, Codable
{
    case AwsLambda
    case AzureFunctions
    case GoogleCloudFunctions
    case Pipedream
    case Zapier
    case CloudflareWorkers
    case Vercel
    case Netlify
    case SupabaseEdge
    case Modal
}

public class CodeIntegrationDto : IntegrationDto
{
    public var provider:CodeProvider?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(CodeProvider.self, forKey: .provider)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
    }
}

public enum PaymentGatewayPlatform : String, Codable
{
    case Stripe
    case Adyen
    case Paddle
    case LemonSqueezy
    case AppleInApp
    case GoogleInApp
    case Shopify
    case WooCommerce
    case Magento
    case PayPal
    case Braintree
    case AuthorizeNet
    case CheckOutCom
    case Mollie
    case Worldpay
}

public enum MembershipProvider : String, Codable
{
    case AppleSignIn
    case GoogleSignIn
    case Google
    case Facebook
    case X
    case GitHub
    case LinkedIn
    case Okta
    case Microsoft
}

public enum LoggingProvider : String, Codable
{
    case Console
    case DataDog
    case Kafka
    case Zabbix
    case MicrosoftTeams
    case Slack
    case Telegram
    case AMQP
    case NewRelic
    case Prometheus
    case AzureOTel
    case Splunk
    case ElasticSearch
    case Kibana
    case LocalFile
    case AWSS3
    case AWSKinesis
    case MongoDB
    case InternalKafka
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

public enum DatabaseProvider : String, Codable
{
    case CodeMashMongoDbAtlasCluster
    case CodeMashMongoDbAtlasServerless
    case MongoDbConnectionString
}

public enum SmsProvider : String, Codable
{
    case Twilio
    case Vonage
    case Plivo
    case Telnyx
    case Bird
    case Telesign
    case Sinch
}

public class SmsIntegrationDto : IntegrationDto
{
    public var provider:SmsProvider?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case provider
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decodeIfPresent(SmsProvider.self, forKey: .provider)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if provider != nil { try container.encode(provider, forKey: .provider) }
    }
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
}

// @DataContract
public enum EmailProvider : String, Codable
{
    case Smtp
    case SendGrid
    case MailGun
    case AwsSes
}

public class AwsSesEmailIntegrationDto : EmailIntegrationDto
{
    public var region:String?
    public var identityArn:String?
    public var configurationSetName:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case region
        case identityArn
        case configurationSetName
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        region = try container.decodeIfPresent(String.self, forKey: .region)
        identityArn = try container.decodeIfPresent(String.self, forKey: .identityArn)
        configurationSetName = try container.decodeIfPresent(String.self, forKey: .configurationSetName)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if region != nil { try container.encode(region, forKey: .region) }
        if identityArn != nil { try container.encode(identityArn, forKey: .identityArn) }
        if configurationSetName != nil { try container.encode(configurationSetName, forKey: .configurationSetName) }
    }
}

public class IntegrationDto : IHasViewId, Codable
{
    public var viewId:String?
    public var integrationName:String?
    public var isEnabled:Bool?
    public var lastIntegrationTestAtUtc:Date?
    public var lastIntegrationTestSucceeded:Bool?
    public var lastIntegrationTestErrors:IReadOnlyList<String>?
    public var humanDeliveryConfirmedAtUtc:Date?
    public var requiresHumanDeliveryConfirmation:Bool?

    required public init(){}
}

public enum MarketplaceTransport : String, Codable
{
    case Mcp
    case Rest
    case Code
}

public enum MarketplaceCategory : String, Codable
{
    case Other
    case Crm
    case Erp
    case Marketing
    case Communication
    case Productivity
    case Storage
    case Analytics
    case Identity
    case Payments
    case DevTools
    case Ai
    case Files
    case Database
    case Calendar
}

public enum MarketplaceMappingSource : String, Codable
{
    case Default
    case Resolver
    case FromRequest
}

public enum TokenMappingResolverType : String, Codable
{
    case NotSet
    case Custom
    case Project
    case ProjectSocials
    case Initiator
    case Recipient
    case SchemaRecord
    case TargetUser
    case TagDefinitions
    case EmailSignatures
    case Campaign
    case Template
    case EmailFooters
    case Old
    case New
}

// @DataContract
public class TagTranslationDto : Codable
{
    // @DataMember
    public var language:String?

    // @DataMember
    public var content:TagDescriptionDto?

    required public init(){}
}

// @DataContract
public class TagDefinitionBaseDto : Codable
{
    // @DataMember
    public var tag:String?

    // @DataMember
    public var translations:[TagTranslationDto] = []

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

public class CursorArgs : ICursorArgs, Codable
{
    public var field:String?
    public var order:Int?

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

public class Integration : IIntegrationIdentification, IHasDomainEntityId, Codable
{
    public var integrationId:IntegrationId?
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

public class PolicyStatement : Codable
{
    public var sid:String?
    public var effect:PermissionEffect?
    public var actions:[PermissionAction] = []
    public var resources:[ResourcePattern] = []

    required public init(){}
}

public class TriggerAction : Codable
{
    public var type:TriggerActionType?
    public var integrationId:IntegrationId?
    public var templateId:TemplateId?

    required public init(){}
}

// @DataContract
public class TemplateCode : Codable
{
    required public init(){}
}

public class Trigger : IHasDomainEntityId, Codable
{
    public var triggerId:TriggerId?
    public var name:DisplayName?
    public var triggerAction:TriggerAction?
    public var activationCode:TemplateCode?
    public var Description:String?
    public var isEnabled:Bool?
    public var integrationId:IntegrationId?
    public var type:TriggerType?

    required public init(){}
}

public class MongoDbAggregateQuery : Codable
{
    public var value:String?

    required public init(){}
}

public class DataSchema : Codable
{
    public var rawJson:String?
    public var fields:[JsonSchemaField] = []

    required public init(){}
}

public class VisualSchema : Codable
{
    public var rawJson:String?

    required public init(){}
}

public class SchemaVersion : Codable
{
    public var value:Int?

    required public init(){}
}

public class MetaSchemaVersion : Codable
{
    public var value:Int?

    required public init(){}
}

public class TaxonomyName : Codable
{
    public var value:String?
    public var title:String?

    required public init(){}
}

public class RecordId : Codable
{
    public var id:String?

    required public init(){}
}

// @DataContract
public class EmailMessageContentDto : IHasRazorTemplateCode, Codable
{
    // @DataMember
    public var subject:String?

    // @DataMember
    public var body:EmailBodyDto?

    // @DataMember
    public var staticAttachments:IReadOnlySet<FileResourceRefDto>?

    required public init(){}
}

// @DataContract
public class EmailSenderName : Codable
{
    required public init(){}
}

// @DataContract
public class EmailMessageContent : Codable
{
    // @DataMember(Order=1)
    public var subject:EmailSubject?

    // @DataMember(Order=2)
    public var body:EmailBody?

    // @DataMember(Order=3)
    public var staticAttachments:[FileResourceRef]?

    required public init(){}
}

public enum MarketplaceIntegrationTransport : String, Codable
{
    case Mcp
    case Rest
    case Code
}

public enum MarketplaceIntegrationCategory : String, Codable
{
    case Other
    case Crm
    case Erp
    case Marketing
    case Communication
    case Productivity
    case Storage
    case Analytics
    case Identity
    case Payments
    case DevTools
    case Ai
    case Files
    case Database
    case Calendar
}

public class MarketplaceFunctionMapping : Codable
{
    public var parameterName:String?
    public var source:MarketplaceMappingSourceKind?
    public var defaultValue:String?
    public var resolver:TokenMappingResolverType?
    public var tokenKey:String?
    public var fromRequestPath:String?
    public var isRequired:Bool?

    required public init(){}
}

// @DataContract
public class PushMessageContentDto : IHasRazorTemplateCode, Codable
{
    // @DataMember
    public var title:String?

    // @DataMember
    public var body:String?

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

public class TriggerEventName : Codable
{
    public var value:String?

    required public init(){}
}

public class CronExpression : Codable
{
    public var value:String?
    public var parsed:CronExpression?

    required public init(){}
}

public class UserId : IHasDomainEntityId, Codable
{
    public var value:String?

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

// @Flags()
public enum AccountStatus : Int, Codable
{
    case Registered = 1
    case PendingValidation = 2
    case Active = 8
    case InActive = 16
    case Blocked = 32
    case Unregistered = 64
}

public enum ProjectStatus : String, Codable
{
    case Active
    case Disabled
    case Removed
}

// @DataContract
public class ProjectBrandDto : Codable
{
    // @DataMember
    public var mainColor:String?

    // @DataMember
    public var accentColor:String?

    // @DataMember
    public var logo:FileResourceRefDto?

    // @DataMember
    public var icon:FileResourceRefDto?

    required public init(){}
}

public class NotificationSettingsDto : Codable
{
    public var channels:[NotificationSettingsChannelDto] = []
    public var allGroups:[GroupDefinitionDto] = []
    public var allTags:[TagDefinitionDto] = []

    required public init(){}
}

// @DataContract
public class DatabaseDto : Codable
{
    // @DataMember
    public var isEnabled:Bool?

    // @DataMember
    public var triggers:[SchemaTriggerDto]?

    // @DataMember
    public var defaultIntegrationViewId:String?

    required public init(){}
}

// @DataContract
public class EmailDto : Codable
{
    // @DataMember
    public var isEnabled:Bool?

    // @DataMember
    public var defaultIntegrationViewId:String?

    // @DataMember
    public var signatures:[EmailSignatureDto]?

    // @DataMember
    public var footers:[EmailFooterDto]?

    required public init(){}
}

// @DataContract
public class AiDto : Codable
{
    // @DataMember
    public var isEnabled:Bool?

    // @DataMember
    public var defaultIntegrationViewId:String?

    required public init(){}
}

// @DataContract
public class MembershipDto : Codable
{
    // @DataMember
    public var isEnabled:Bool?

    // @DataMember
    public var triggers:[MembershipTriggerDto]?

    // @DataMember
    public var customRoles:[RoleItemDto]?

    // @DataMember
    public var customPolicies:[PolicyItemDto]?

    // @DataMember
    public var authorization:AuthorizationDto?

    required public init(){}
}

// @DataContract
public class LoggingDto : Codable
{
    // @DataMember
    public var isEnabled:Bool?

    required public init(){}
}

// @DataContract
public class ServerEventsDto : Codable
{
    // @DataMember
    public var isEnabled:Bool?

    required public init(){}
}

// @DataContract
public class PushDto : Codable
{
    // @DataMember
    public var isEnabled:Bool?

    // @DataMember
    public var defaultIntegrationViewId:String?

    // @DataMember
    public var marketingTags:[TagDefinitionDto]?

    // @DataMember
    public var transactionalTags:[TagDefinitionDto]?

    required public init(){}
}

// @DataContract
public class SchedulerDto : Codable
{
    // @DataMember
    public var isEnabled:Bool?

    required public init(){}
}

// @DataContract
public class CodeDto : Codable
{
    // @DataMember
    public var isEnabled:Bool?

    required public init(){}
}

// @DataContract
public class FilesDto : Codable
{
    // @DataMember
    public var isEnabled:Bool?

    // @DataMember
    public var triggers:[FilesTriggerDto]?

    // @DataMember
    public var defaultIntegrationViewId:String?

    required public init(){}
}

// @DataContract
public class PaymentsDto : Codable
{
    // @DataMember
    public var isEnabled:Bool?

    // @DataMember
    public var triggers:[PaymentTriggerDto]?

    required public init(){}
}

// @DataContract
public class SmsDto : Codable
{
    // @DataMember
    public var isEnabled:Bool?

    // @DataMember
    public var defaultIntegrationViewId:String?

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

public class CodeMashSubscriptionDto : Codable
{
    public var viewId:String?
    public var domain:String?
    public var willExpireOn:Date?
    public var issuedOn:Date?
    public var isTrial:Bool?
    public var subscriptionRefId:String?

    required public init(){}
}

// @DataContract
public class TriggerProjectionList : IHasViewId, Codable
{
    // @DataMember
    public var viewId:String?

    // @DataMember
    public var name:String?

    // @DataMember
    public var actionType:TriggerActionType?

    // @DataMember
    public var hasPreExecuteCode:Bool?

    // @DataMember
    public var isEnabled:Bool?

    required public init(){}
}

public class PolicyStatementDto : Codable
{
    public var sid:String?
    public var effect:PermissionEffect?
    public var actions:[String] = []
    public var resources:[String] = []

    required public init(){}
}

public class IntegrationListProjection : IHasViewId, Codable
{
    public var viewId:String?
    public var integrationName:String?
    public var isEnabled:Bool?
    public var lastIntegrationTestAtUtc:Date?
    public var lastIntegrationTestSucceeded:Bool?
    public var lastIntegrationTestErrors:IReadOnlyList<String>?
    public var humanDeliveryConfirmedAtUtc:Date?
    public var requiresHumanDeliveryConfirmation:Bool?

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

// @DataContract
public class MjmlParseError : Codable
{
    // @DataMember(Name="line")
    public var line:Int?

    // @DataMember(Name="message")
    public var message:String?

    // @DataMember(Name="tagName")
    public var tagName:String?

    // @DataMember(Name="formattedMessage")
    public var formattedMessage:String?

    required public init(){}
}

public class EmailTemplateListProjection : TemplateListProjection
{
    public var hasAttachments:Bool?
    public var languages:IReadOnlySet<String>?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case hasAttachments
        case languages
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        hasAttachments = try container.decodeIfPresent(Bool.self, forKey: .hasAttachments)
        languages = try container.decodeIfPresent(IReadOnlySet<String>.self, forKey: .languages)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if hasAttachments != nil { try container.encode(hasAttachments, forKey: .hasAttachments) }
        if languages != nil { try container.encode(languages, forKey: .languages) }
    }
}

// @DataContract
public class ListItemProjection : IHasViewId, Codable
{
    // @DataMember
    public var viewId:String?

    // @DataMember
    public var displayName:String?

    required public init(){}
}

public class CampaignStatusChangeEntryDto : Codable
{
    public var time:Date?
    public var status:CampaignStatus?
    public var errors:IReadOnlySet<ErrorDto>?

    required public init(){}
}

// @DataContract
public class CampaignDto : IHasResponsibleUserId, IHasDatabaseId, Codable
{
    // @DataMember
    public var viewId:String?

    // @DataMember
    public var createdOn:Date?

    // @DataMember
    public var language:String?

    // @DataMember
    public var forceCampaignLanguage:Bool?

    // @DataMember
    public var campaignProcessingIntegrationId:String?

    // @DataMember
    public var statusHistory:IReadOnlySet<CampaignStatusChangeEntryDto>?

    // @DataMember
    public var status:CampaignStatusChangeEntryDto?

    // @DataMember
    public var tokenMappingValues:IReadOnlySet<TokenMappingDto>?

    // @DataMember
    public var notes:String?

    // @DataMember
    public var userId:String?

    // @DataMember
    public var id:String?

    required public init(){}
}

public protocol IHasResponsibleUserId
{
    var userId:String? { get set }

}

public enum CampaignStatus : String, Codable
{
    case Pending
    case Registered
    case Scheduled
    case Started
    case Stopped
    case Processing
    case Completed
    case Failed
}

// @DataContract
public class EmailRecipientsDto : Codable
{
    // @DataMember
    public var to:IReadOnlySet<EmailRecipientDto>?

    // @DataMember
    public var cc:IReadOnlySet<EmailRecipientDto>?

    // @DataMember
    public var bcc:IReadOnlySet<EmailRecipientDto>?

    // @DataMember
    public var startingAfter:String?

    // @DataMember
    public var hasMore:Bool?

    required public init(){}
}

// @DataContract
public class CampaignBatchDto : IHasDatabaseId, Codable
{
    // @DataMember
    public var campaignId:String?

    // @DataMember
    public var batchId:String?

    // @DataMember
    public var startAfter:String?

    // @DataMember
    public var statusHistory:[BatchStatusChangeEntryDto] = []

    // @DataMember
    public var id:String?

    required public init(){}
}

public class NotificationStatusChangeEntryDto : Codable
{
    public var time:Date?
    public var status:CampaignNotificationStatus?
    public var sourceId:String?
    public var errors:IReadOnlySet<ErrorDto>?
    public var tags:IReadOnlySet<String>?

    required public init(){}
}

// @DataContract
public class CampaignBatchNotificationDto : IHasDatabaseId, Codable
{
    // @DataMember
    public var campaignId:String?

    // @DataMember
    public var batchId:String?

    // @DataMember
    public var notificationId:String?

    // @DataMember
    public var refNotificationId:String?

    // @DataMember
    public var subject:String?

    // @DataMember
    public var body:String?

    // @DataMember
    public var model:[String:String]?

    // @DataMember
    public var statusHistory:IReadOnlySet<NotificationStatusChangeEntryDto>?

    // @DataMember
    public var id:String?

    required public init(){}
}

public enum CampaignBatchStatus : String, Codable
{
    case Registered
    case Processing
    case Completed
    case Failed
}

// @DataContract
public class SmsMessageContentDto : IHasRazorTemplateCode, Codable
{
    // @DataMember
    public var subject:String?

    // @DataMember
    public var body:String?

    required public init(){}
}

// @DataContract
public class TagDescriptionDto : Codable
{
    // @DataMember
    public var title:String?

    // @DataMember
    public var Description:String?

    required public init(){}
}

public protocol ICursorArgs
{
    var field:String? { get set }
    var order:Int? { get set }

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

public class TagDescription : Codable
{
    public var displayName:DisplayName?
    public var Description:String?

    required public init(){}
}

public enum PermissionEffect : String, Codable
{
    case Allow
    case Deny
}

public class PermissionAction : Codable
{
    public var module:ApplicationModule?
    public var operation:String?
    public var isModuleWildcard:Bool?
    public var isOperationWildcard:Bool?
    public var isConcrete:Bool?
    public var specificity:Int?

    required public init(){}
}

public class ResourcePattern : Codable
{
    public var account:AccountId?
    public var project:ProjectId?
    public var module:ApplicationModule?
    public var kind:ResourceKind?
    public var id:ResourceIdentifier?
    public var isAccountWildcard:Bool?
    public var isProjectWildcard:Bool?
    public var isModuleWildcard:Bool?
    public var isKindWildcard:Bool?
    public var isIdWildcard:Bool?
    public var isConcrete:Bool?
    public var isFullWildcard:Bool?
    public var specificity:Int?

    required public init(){}
}

public class FileTrigger : Trigger
{
    public var when:FilesTriggerType?
    public var fileResourceRef:FileResourceRef?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case when
        case fileResourceRef
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        when = try container.decodeIfPresent(FilesTriggerType.self, forKey: .when)
        fileResourceRef = try container.decodeIfPresent(FileResourceRef.self, forKey: .fileResourceRef)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if when != nil { try container.encode(when, forKey: .when) }
        if fileResourceRef != nil { try container.encode(fileResourceRef, forKey: .fileResourceRef) }
    }
}

public class PaymentTrigger : Trigger
{
    public var when:PaymentTriggerType?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case when
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        when = try container.decodeIfPresent(PaymentTriggerType.self, forKey: .when)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if when != nil { try container.encode(when, forKey: .when) }
    }
}

public class JsonSchemaField : Codable
{
    public var fieldName:JsonSchemaFieldName?

    required public init(){}
}

// @DataContract
public class EmailBodyDto : IHasRazorTemplateCode, Codable
{
    // @DataMember
    public var structure:String?

    // @DataMember
    public var code:String?

    // @DataMember
    public var templateEngine:EmailTemplateEngine?

    required public init(){}
}

// @DataContract
public class EmailSubject : Codable
{
    required public init(){}
}

// @DataContract
public class EmailBody : Codable
{
    // @DataMember
    public var code:TemplateCode?

    // @DataMember
    public var structure:String?

    // @DataMember
    public var emailTemplateEngine:EmailTemplateEngine?

    required public init(){}
}

public enum MarketplaceMappingSourceKind : String, Codable
{
    case Default
    case Resolver
    case FromRequest
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

public class CronExpression : Codable
{
    required public init(){}
}

public class NotificationSettingsChannelDto : Codable
{
    public var channel:CommunicationChannel?
    public var groups:[NotificationsSettingsGroupDto] = []

    required public init(){}
}

// @DataContract
public class SchemaTriggerDto : TriggerDto
{
    // @DataMember
    public var schemaId:String?

    // @DataMember
    public var when:SchemaTriggerType?

    // @DataMember
    public var configurationCode:String?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case schemaId
        case when
        case configurationCode
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        schemaId = try container.decodeIfPresent(String.self, forKey: .schemaId)
        when = try container.decodeIfPresent(SchemaTriggerType.self, forKey: .when)
        configurationCode = try container.decodeIfPresent(String.self, forKey: .configurationCode)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if schemaId != nil { try container.encode(schemaId, forKey: .schemaId) }
        if when != nil { try container.encode(when, forKey: .when) }
        if configurationCode != nil { try container.encode(configurationCode, forKey: .configurationCode) }
    }
}

// @DataContract
public class MembershipTriggerDto : TriggerDto
{
    // @DataMember
    public var when:MembershipTriggerType?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case when
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        when = try container.decodeIfPresent(MembershipTriggerType.self, forKey: .when)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if when != nil { try container.encode(when, forKey: .when) }
    }
}

// @DataContract
public class AuthorizationDto : Codable
{
    // @DataMember
    public var userRegistersAsRole:String?

    // @DataMember
    public var allowedRegisterRoles:[String]?

    // @DataMember
    public var allowedProviderRegisterRoles:[String]?

    required public init(){}
}

// @DataContract
public class FilesTriggerDto : TriggerDto
{
    // @DataMember
    public var when:FilesTriggerType?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case when
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        when = try container.decodeIfPresent(FilesTriggerType.self, forKey: .when)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if when != nil { try container.encode(when, forKey: .when) }
    }
}

// @DataContract
public class PaymentTriggerDto : TriggerDto
{
    // @DataMember
    public var when:PaymentTriggerType?

    required public init(){ super.init() }

    private enum CodingKeys : String, CodingKey {
        case when
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        when = try container.decodeIfPresent(PaymentTriggerType.self, forKey: .when)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if when != nil { try container.encode(when, forKey: .when) }
    }
}

public class AccessInformationDto : Codable
{
    public var ip:String?
    public var date:Date?
    public var timeZone:String?

    required public init(){}
}

public enum Gender : String, Codable
{
    case Male
    case Female
    case Other
}

public class JsonSchemaFieldDto : Codable
{
    // @DataMember
    public var fieldName:String?

    required public init(){}
}

// @DataContract
public class EmailRecipientDto : Codable
{
    // @DataMember
    public var emailAddress:String?

    // @DataMember
    public var language:String?

    // @DataMember
    public var timeZoneId:String?

    // @DataMember
    public var userTokenMappings:IReadOnlySet<TokenMappingDto>?

    required public init(){}
}

public enum CampaignNotificationStatus : String, Codable
{
    case Completed
    case BlockedByUserPreferenceBlockAll
    case BlockedByUserPreferenceBlockByTag
    case Failed
    case Viewed
    case Clicked
}

// @Flags()
public enum ApplicationModule : Int, Codable
{
    case Account = 0
    case Membership = 1
    case Database = 2
    case Files = 4
    case Code = 8
    case Email = 16
    case Push = 32
    case Payment = 64
    case Scheduler = 128
    case Logging = 256
    case ServerEvents = 512
    case Ai = 1024
    case Sms = 2048
}

public class ResourceKind : Codable
{
    public var name:String?

    required public init(){}
}

public class ResourceIdentifier : Codable
{
    public var value:String?

    required public init(){}
}

public class JsonSchemaFieldName : Codable
{
    public var fieldName:String?

    required public init(){}
}

public class StringField : JsonSchemaField
{
    public var format:String?
    public var pattern:String?
    public var minLength:Int?
    public var maxLength:Int?
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

public class DecimalField : JsonSchemaField
{
    public var minimum:Double?
    public var maximum:Double?
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

public class CurrencyField : JsonSchemaField
{
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

public class BooleanField : JsonSchemaField
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class DateField : JsonSchemaField
{
    public var minimum:Int?
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

public class IntegerField : JsonSchemaField
{
    public var minimum:Int?
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

public class GeolocationField : JsonSchemaField
{
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

public class TagsField : JsonSchemaField
{
    required public init(){ super.init() }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}

public class FileField : JsonSchemaField
{
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

public class TaxonomySelectionField : JsonSchemaField
{
    public var taxonomyId:String?
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

public class CollectionSelectionField : JsonSchemaField
{
    public var collectionId:String?
    public var displayField:String?
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

public class UserSelectionField : JsonSchemaField
{
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

public class RoleSelectionField : JsonSchemaField
{
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

public class EnumSelectionField : JsonSchemaField
{
    public var values:IReadOnlyList<String>?
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

public enum EmailTemplateEngine : String, Codable
{
    case NotSet
    case Handlebars
    case Mjml
    case Liquid
    case Razor
    case Mustache
}

public class NotificationsSettingsGroupDto : Codable
{
    public var tag:String?
    public var tags:[String] = []

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


