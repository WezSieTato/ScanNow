// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ScanNowCore",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "ScanNowCore",
            type: .dynamic,
            targets: ["ScanNowCore"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.19.1"),
        .package(url: "https://github.com/fetch-rewards/swift-mocking.git", from: "0.2.2"),
    ],
    targets: [
        .target(
            name: "ScanNowCore",
            dependencies: [
                .product(name: "Mocking", package: "swift-mocking"),
            ],
            path: "Sources/ScanNowCore",
            resources: [
                .process("Assets.xcassets"),
                .process("localizable"),
            ]
        ),
        .testTarget(
            name: "ScanNowCoreTests",
            dependencies: [
                "ScanNowCore",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
                .product(name: "Mocking", package: "swift-mocking"),
            ],
            path: "Tests/ScanNowCoreTests",
            exclude: ["Info.plist"]
        ),
    ]
)
