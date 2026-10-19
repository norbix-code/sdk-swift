# API · Payments

Payment orders: create an order for a buyer, read it back, and start a
provider checkout (e.g. Montonio) for it. Amounts are minor units (cents).

| Method | Verb | Path | Scope |
| --- | --- | --- | --- |
| `createPaymentOrder` | `POST` | `/{version}/payments/orders` | `project` |
| `getPaymentOrder` | `GET` | `/{version}/payments/orders/{Id}` | `project` |
| `getPaymentOrders` | `GET` | `/{version}/payments/orders` | `project` |
| `startPaymentCheckout` | `POST` | `/{version}/payments/orders/{Id}/checkout` | `project` |

## Creating an order

`createPaymentOrder(buyerUserId:merchantReference:currency:priceVersion:lines:idempotencyKey:metadata:)`
answers the order id (`ord_…`). The same body sent again with the same
`idempotencyKey` answers the **same** id — a retry never makes a second order.

```swift
let id = try await client.payments.createPaymentOrder(
    buyerUserId: userId,
    merchantReference: "ad-1042-promo-1",
    currency: "EUR",
    priceVersion: "v1",
    lines: [PaymentOrderLineInput(sku: "star-day", title: "Star × day", quantity: 21, unitAmountMinor: 30)],
    idempotencyKey: "ad-1042-promo-1"
)
```

## Reading orders

`getPaymentOrder(id:)` answers a `PaymentOrder` (lines, `totalMinor`, `status`,
`checkouts`, `settledMinor`, `refundedMinor`, `mismatches`).
`getPaymentOrders(buyerUserId:merchantReference:status:pageSize:startingAfter:)`
answers a `PaymentOrderPage` (`orders`, `hasMore`, `nextCursor`).

## Checkout

`startPaymentCheckout(id:integrationId:returnUrl:method:preferredCountry:preferredProvider:)`
answers a `PaymentCheckoutStart`: send the buyer to `checkout?.paymentUrl`.
`reused` is `true` when a still-open checkout of the order was handed back.

```swift
let started = try await client.payments.startPaymentCheckout(
    id: id, integrationId: "int_montonio", returnUrl: "https://shop.example/return"
)
```

When the provider confirms the payment, the project's webhook destinations get
`payments.order.paid` — de-duplicate it on `orderEventId`.
