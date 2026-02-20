// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "Datez",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .tvOS(.v15),
        .watchOS(.v8),
    ],
    products: [
        .library(
            name: "Datez",
            targets: ["Datez"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Datez",
            dependencies: [],
            swiftSettings: [
                .swiftLanguageMode(.v6),
            ]),
        .testTarget(
            name: "DatezTests",
            dependencies: ["Datez"],
            swiftSettings: [
                .swiftLanguageMode(.v6),
            ]),
    ]
)
