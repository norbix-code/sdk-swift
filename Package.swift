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
        // One library product per gateway, so an app that uses only the Api
        // gateway does not pay binary-size cost for the Hub gateway.
        // Project-scoped data plane (https://api.norbix.ai by default).
        .library(name: "NorbixApi", targets: ["NorbixApi"]),
        // Project / account configuration plane (https://hub.norbix.ai by default).
        .library(name: "NorbixHub", targets: ["NorbixHub"]),
        // Shared types both clients use (LoginCredentials, NorbixError,
        // HTTPExecuting, Page, JSONValue, ...). Add it next to NorbixApi /
        // NorbixHub to `import NorbixCore` in an app.
        .library(name: "NorbixCore", targets: ["NorbixCore"])
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
