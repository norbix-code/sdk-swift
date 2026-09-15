// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Norbix",
    platforms: [
        .iOS(.v14),
        .macOS(.v12),
        .tvOS(.v14),
        .watchOS(.v7),
        .visionOS(.v1)
    ],
    products: [
        // Two library products — one per gateway. Consumers import only the
        // surface they need so an iOS app that uses the Api gateway doesn't
        // pay binary-size cost for the Hub gateway. NorbixCore is an
        // internal target both depend on (not exposed as a library product);
        // shared types (errors, config) are re-exported from both Api and
        // Hub via public typealiases. This matches the Stripe iOS pattern.
        // Project-scoped data plane (https://api.norbix.ai by default).
        .library(name: "NorbixApi", targets: ["NorbixApi"]),
        // Project / account configuration plane (https://hub.norbix.ai by default).
        .library(name: "NorbixHub", targets: ["NorbixHub"])
    ],
    targets: [
        .target(
            name: "NorbixCore",
            path: "Sources/NorbixCore"
        ),
        .target(
            name: "NorbixApi",
            dependencies: ["NorbixCore"],
            path: "Sources/NorbixApi"
        ),
        .target(
            name: "NorbixHub",
            dependencies: ["NorbixCore"],
            path: "Sources/NorbixHub"
        ),
        .testTarget(
            name: "NorbixCoreTests",
            dependencies: ["NorbixCore"],
            path: "Tests/NorbixCoreTests"
        ),
        .testTarget(
            name: "NorbixApiTests",
            dependencies: ["NorbixApi", "NorbixCore"],
            path: "Tests/NorbixApiTests"
        ),
        .testTarget(
            name: "NorbixHubTests",
            dependencies: ["NorbixHub", "NorbixCore"],
            path: "Tests/NorbixHubTests"
        )
    ]
)
