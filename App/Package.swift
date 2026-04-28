// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ScanNowCore",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "ScanNowCore",
            type: .dynamic,
            targets: ["ScanNowCore"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.19.2"),
    ],
    targets: [
        .target(
            name: "ScanNowCore",
            dependencies: [],
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
            ],
            path: "Tests/ScanNowCoreTests",
            exclude: ["Info.plist"]
        ),
    ]
)
