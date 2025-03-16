// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ScanNow",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "ScanNowCore",
            type: .dynamic,
            targets: ["ScanNowCore"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.15.4"),
        .package(url: "https://github.com/WezSieTato/DataDrivenTesting.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "ScanNowCore",
            dependencies: [],
            path: "Sources/ScanNowCore",
            resources: [
                .process("Assets.xcassets"),
                .process("localizable"),
            ],
            swiftSettings: [
                .define("DEBUG", .when(configuration: .debug)),
                .define("RELEASE", .when(configuration: .release))
            ]
        ),
        .testTarget(
            name: "ScanNowTests",
            dependencies: [
                "ScanNowCore",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
                .product(name: "DataDrivenTesting", package: "DataDrivenTesting")
            ],
            path: "Tests/ScanNowCoreTests",
            exclude: ["Info.plist", "__Snapshots__"],
            resources: [
                .copy("__Snapshots__")
            ]
        ),
        .testTarget(
            name: "AppStoreSnapshots",
            dependencies: [
                "ScanNowCore"
            ],
            path: "Tests/AppStoreSnapshots",
            resources: [
                .copy("__Snapshots__")
            ]
        )
    ]
)
