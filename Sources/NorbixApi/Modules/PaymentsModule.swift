import Foundation
import NorbixCore

// MARK: - Models

/// One line of a new payment order: what is sold, how many, and the price of
/// one unit in minor units (cents). Mirrors the gateway `PaymentOrderLineInput`.
public struct PaymentOrderLineInput: Codable, Sendable, Equatable {
    /// Your own product code, e.g. `star-day`.
    public let sku: String?
    /// What the buyer sees, e.g. `Star × day`.
    public let title: String?
    /// How many units.
    public let quantity: Int
    /// Price of one unit in minor units (cents), e.g. `30`.
    public let unitAmountMinor: Int

    public init(sku: String? = nil, title: String? = nil, quantity: Int, unitAmountMinor: Int) {
        self.sku = sku
        self.title = title
        self.quantity = quantity
        self.unitAmountMinor = unitAmountMinor
    }

    /// The JSON shape the gateway reads.
    var wireValue: [String: Any] {
        var out: [String: Any] = ["quantity": quantity, "unitAmountMinor": unitAmountMinor]
        if let sku { out["sku"] = sku }
        if let title { out["title"] = title }
        return out
    }
}

/// One stored line of a payment order. Mirrors the gateway `PaymentOrderLineDto`.
public struct PaymentOrderLine: Codable, Sendable, Equatable {
    public let sku: String?
    public let title: String?
    public let quantity: Int
    public let unitAmountMinor: Int
    /// `quantity × unitAmountMinor`, computed by the gateway.
    public let amountMinor: Int

    public init(
        sku: String? = nil,
        title: String? = nil,
        quantity: Int,
        unitAmountMinor: Int,
        amountMinor: Int
    ) {
        self.sku = sku
        self.title = title
        self.quantity = quantity
        self.unitAmountMinor = unitAmountMinor
        self.amountMinor = amountMinor
    }
}

/// One provider checkout started for an order. Mirrors the gateway
/// `PaymentOrderCheckoutDto`.
public struct PaymentOrderCheckout: Codable, Sendable, Equatable {
    /// 1 for the first checkout of the order, 2 for the next, …
    public let attempt: Int?
    /// The payments integration the checkout runs on.
    public let integrationId: String?
    /// The provider, e.g. `Montonio`.
    public let provider: String?
    /// The provider's own order id.
    public let providerOrderId: String?
    /// The reference the provider shows the buyer.
    public let providerReference: String?
    /// Send the buyer here to pay.
    public let paymentUrl: String?
    /// The payment method, e.g. `paymentInitiation`.
    public let method: String?
    public let startedOnUtc: Date?
    public let expiresAtUtc: Date?

    public init(
        attempt: Int? = nil,
        integrationId: String? = nil,
        provider: String? = nil,
        providerOrderId: String? = nil,
        providerReference: String? = nil,
        paymentUrl: String? = nil,
        method: String? = nil,
        startedOnUtc: Date? = nil,
        expiresAtUtc: Date? = nil
    ) {
        self.attempt = attempt
        self.integrationId = integrationId
        self.provider = provider
        self.providerOrderId = providerOrderId
        self.providerReference = providerReference
        self.paymentUrl = paymentUrl
        self.method = method
        self.startedOnUtc = startedOnUtc
        self.expiresAtUtc = expiresAtUtc
    }
}

/// A stored payment order. Mirrors the gateway `PaymentOrderDto`.
///
/// Amounts are minor units (cents). `status` is the order's state, e.g.
/// `Created`, `CheckoutStarted`, `Paid`, `PartiallyRefunded`, `Refunded`,
/// `Reversed`, `Expired`.
public struct PaymentOrder: Codable, Sendable, Equatable {
    /// Order id, e.g. `ord_2ToIiRM03X63TZaJ2dJdv2`.
    public let id: String
    public let env: String?
    public let buyerUserId: String?
    public let merchantReference: String?
    public let currency: String?
    public let priceVersion: String?
    public let lines: [PaymentOrderLine]
    public let totalMinor: Int?
    public let metadata: [String: String]
    public let status: String?
    public let createdOnUtc: Date?
    public let updatedOnUtc: Date?
    public let checkouts: [PaymentOrderCheckout]
    /// What the provider settled; `nil` until the order is paid.
    public let settledMinor: Int?
    public let refundedMinor: Int?
    public let paidOnUtc: Date?
    public let providerPaymentId: String?
    /// What did not match between the order and the provider's payment
    /// (amount, currency, …). Empty when everything matched.
    public let mismatches: [String]

    public init(
        id: String,
        env: String? = nil,
        buyerUserId: String? = nil,
        merchantReference: String? = nil,
        currency: String? = nil,
        priceVersion: String? = nil,
        lines: [PaymentOrderLine] = [],
        totalMinor: Int? = nil,
        metadata: [String: String] = [:],
        status: String? = nil,
        createdOnUtc: Date? = nil,
        updatedOnUtc: Date? = nil,
        checkouts: [PaymentOrderCheckout] = [],
        settledMinor: Int? = nil,
        refundedMinor: Int? = nil,
        paidOnUtc: Date? = nil,
        providerPaymentId: String? = nil,
        mismatches: [String] = []
    ) {
        self.id = id
        self.env = env
        self.buyerUserId = buyerUserId
        self.merchantReference = merchantReference
        self.currency = currency
        self.priceVersion = priceVersion
        self.lines = lines
        self.totalMinor = totalMinor
        self.metadata = metadata
        self.status = status
        self.createdOnUtc = createdOnUtc
        self.updatedOnUtc = updatedOnUtc
        self.checkouts = checkouts
        self.settledMinor = settledMinor
        self.refundedMinor = refundedMinor
        self.paidOnUtc = paidOnUtc
        self.providerPaymentId = providerPaymentId
        self.mismatches = mismatches
    }

    private enum CodingKeys: String, CodingKey {
        case id, env, buyerUserId, merchantReference, currency, priceVersion, lines
        case totalMinor, metadata, status, createdOnUtc, updatedOnUtc, checkouts
        case settledMinor, refundedMinor, paidOnUtc, providerPaymentId, mismatches
    }

    public init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try c.decode(String.self, forKey: .id)
        self.env = try c.decodeIfPresent(String.self, forKey: .env)
        self.buyerUserId = try c.decodeIfPresent(String.self, forKey: .buyerUserId)
        self.merchantReference = try c.decodeIfPresent(String.self, forKey: .merchantReference)
        self.currency = try c.decodeIfPresent(String.self, forKey: .currency)
        self.priceVersion = try c.decodeIfPresent(String.self, forKey: .priceVersion)
        self.lines = try c.decodeIfPresent([PaymentOrderLine].self, forKey: .lines) ?? []
        self.totalMinor = try c.decodeIfPresent(Int.self, forKey: .totalMinor)
        self.metadata = try c.decodeIfPresent([String: String].self, forKey: .metadata) ?? [:]
        self.status = try c.decodeIfPresent(String.self, forKey: .status)
        self.createdOnUtc = try c.decodeIfPresent(Date.self, forKey: .createdOnUtc)
        self.updatedOnUtc = try c.decodeIfPresent(Date.self, forKey: .updatedOnUtc)
        self.checkouts = try c.decodeIfPresent([PaymentOrderCheckout].self, forKey: .checkouts) ?? []
        self.settledMinor = try c.decodeIfPresent(Int.self, forKey: .settledMinor)
        self.refundedMinor = try c.decodeIfPresent(Int.self, forKey: .refundedMinor)
        self.paidOnUtc = try c.decodeIfPresent(Date.self, forKey: .paidOnUtc)
        self.providerPaymentId = try c.decodeIfPresent(String.self, forKey: .providerPaymentId)
        self.mismatches = try c.decodeIfPresent([String].self, forKey: .mismatches) ?? []
    }
}

/// One page of payment orders.
public struct PaymentOrderPage: Sendable {
    public let orders: [PaymentOrder]
    /// `true` when more orders can be fetched with `nextCursor`.
    public let hasMore: Bool
    /// Cursor to pass back as `startingAfter` to fetch the next page.
    public let nextCursor: String?

    public init(orders: [PaymentOrder] = [], hasMore: Bool = false, nextCursor: String? = nil) {
        self.orders = orders
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

extension PaymentOrderPage: Decodable {
    private enum CodingKeys: String, CodingKey {
        case list
    }

    /// Mirrors the gateway `PaginatedResponse<PaymentOrderDto>` block.
    private struct ListBlock: Decodable {
        let items: [PaymentOrder]?
        let hasMore: Bool?
        let startingAfter: String?
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let block = try container.decodeIfPresent(ListBlock.self, forKey: .list)
        self.orders = block?.items ?? []
        self.hasMore = block?.hasMore ?? false
        self.nextCursor = block?.startingAfter
    }
}

/// Answer of `startPaymentCheckout(...)`. Mirrors the gateway
/// `StartPaymentCheckoutResponse`.
public struct PaymentCheckoutStart: Decodable, Sendable, Equatable {
    /// The checkout to send the buyer to (`checkout?.paymentUrl`).
    public let checkout: PaymentOrderCheckout?
    /// `true` when a still-open checkout of the order was handed back
    /// instead of starting a new one.
    public let reused: Bool
    /// The order after the checkout started.
    public let order: PaymentOrder?

    public init(checkout: PaymentOrderCheckout?, reused: Bool = false, order: PaymentOrder? = nil) {
        self.checkout = checkout
        self.reused = reused
        self.order = order
    }

    private enum CodingKeys: String, CodingKey {
        case checkout, reused, order
    }

    public init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        self.checkout = try c.decodeIfPresent(PaymentOrderCheckout.self, forKey: .checkout)
        self.reused = try c.decodeIfPresent(Bool.self, forKey: .reused) ?? false
        self.order = try c.decodeIfPresent(PaymentOrder.self, forKey: .order)
    }
}

/// Decodes the `{ "id": ... }` envelope of `IdResponse`.
private struct PaymentIdEnvelope: Decodable {
    let id: String?
}

/// Decodes the `{ "item": ... }` envelope of `GetPaymentOrderResponse`.
private struct PaymentOrderEnvelope: Decodable {
    let item: PaymentOrder?
}

// MARK: - Module

/// Payment orders on the API plane: create an order for a buyer, read it back,
/// and start a provider checkout (e.g. Montonio) for it.
///
/// ```swift
/// let id = try await client.payments.createPaymentOrder(
///     buyerUserId: userId,
///     merchantReference: "ad-1042-promo-1",
///     currency: "EUR",
///     priceVersion: "v1",
///     lines: [PaymentOrderLineInput(sku: "star-day", quantity: 21, unitAmountMinor: 30)],
///     idempotencyKey: "ad-1042-promo-1"
/// )
/// let started = try await client.payments.startPaymentCheckout(
///     id: id, integrationId: "int_montonio", returnUrl: "https://shop.example/return"
/// )
/// // send the buyer to started.checkout?.paymentUrl
/// ```
///
/// When the provider confirms the payment, the project's webhook destinations
/// get `payments.order.paid`.
public final class PaymentsModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    // MARK: - Orders

    /// Create a payment order for a buyer. Answers the order id (`ord_…`).
    ///
    /// The same body sent again with the same `idempotencyKey` answers the
    /// same id — no second order is made.
    ///
    /// - Parameters:
    ///   - buyerUserId: The project user who pays.
    ///   - merchantReference: Your own reference for the order.
    ///   - currency: ISO currency code, e.g. `EUR`.
    ///   - priceVersion: The price list the amounts come from.
    ///   - lines: What is sold; amounts in minor units (cents).
    ///   - idempotencyKey: Makes a retry safe (8 characters or more).
    ///   - metadata: Your own string values stored on the order.
    public func createPaymentOrder(
        buyerUserId: String,
        merchantReference: String,
        currency: String,
        priceVersion: String,
        lines: [PaymentOrderLineInput],
        idempotencyKey: String? = nil,
        metadata: [String: String]? = nil,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> String {
        var req: [String: Any] = [
            "buyerUserId": buyerUserId,
            "merchantReference": merchantReference,
            "currency": currency,
            "priceVersion": priceVersion,
            "lines": lines.map(\.wireValue),
        ]
        if let idempotencyKey { req["idempotencyKey"] = idempotencyKey }
        if let metadata { req["metadata"] = metadata }
        let envelope = try await transport.send(
            path: "/{version}/payments/orders",
            method: "POST",
            request: req,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            as: PaymentIdEnvelope.self
        )
        guard let id = envelope.id, !id.isEmpty else {
            throw NorbixError(
                message: "The gateway response did not contain an order id.",
                code: "NORBIX_EMPTY_RESPONSE"
            )
        }
        return id
    }

    /// Read one payment order by its `ord_…` id. An unknown id is a `404`.
    public func getPaymentOrder(
        id: String,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> PaymentOrder {
        let envelope = try await transport.send(
            path: "/{version}/payments/orders/{id}",
            method: "GET",
            request: ["id": id],
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            as: PaymentOrderEnvelope.self
        )
        guard let item = envelope.item else {
            throw NorbixError(
                message: "The gateway response did not contain the order.",
                code: "NORBIX_EMPTY_RESPONSE"
            )
        }
        return item
    }

    /// List payment orders, optionally filtered by buyer, merchant reference
    /// or status.
    ///
    /// - Parameters:
    ///   - pageSize: Number of orders per page.
    ///   - startingAfter: Cursor from a previous page's `nextCursor`.
    ///   - query: Extra raw query parameters for advanced callers.
    public func getPaymentOrders(
        buyerUserId: String? = nil,
        merchantReference: String? = nil,
        status: String? = nil,
        pageSize: Int? = nil,
        startingAfter: String? = nil,
        query: [String: Any] = [:],
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> PaymentOrderPage {
        var req = query
        if let buyerUserId { req["buyerUserId"] = buyerUserId }
        if let merchantReference { req["merchantReference"] = merchantReference }
        if let status { req["status"] = status }
        if let pageSize { req["pageSize"] = pageSize }
        if let startingAfter { req["startingAfter"] = startingAfter }
        return try await transport.send(
            path: "/{version}/payments/orders",
            method: "GET",
            request: req,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            as: PaymentOrderPage.self
        )
    }

    // MARK: - Checkout

    /// Start (or reuse) a provider checkout for the order. Send the buyer to
    /// the answer's `checkout?.paymentUrl`; `reused` is `true` when a
    /// still-open checkout was handed back.
    ///
    /// - Parameters:
    ///   - id: The order id (`ord_…`).
    ///   - integrationId: The payments integration to pay through.
    ///   - returnUrl: Where the provider sends the buyer afterwards.
    ///   - method: Payment method, e.g. `paymentInitiation`.
    ///   - preferredCountry: Country to preselect, e.g. `LT`.
    ///   - preferredProvider: Bank / provider to preselect.
    public func startPaymentCheckout(
        id: String,
        integrationId: String,
        returnUrl: String,
        method: String? = nil,
        preferredCountry: String? = nil,
        preferredProvider: String? = nil,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> PaymentCheckoutStart {
        var req: [String: Any] = [
            "id": id,
            "integrationId": integrationId,
            "returnUrl": returnUrl,
        ]
        if let method { req["method"] = method }
        if let preferredCountry { req["preferredCountry"] = preferredCountry }
        if let preferredProvider { req["preferredProvider"] = preferredProvider }
        return try await transport.send(
            path: "/{version}/payments/orders/{id}/checkout",
            method: "POST",
            request: req,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            as: PaymentCheckoutStart.self
        )
    }
}
