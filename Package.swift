// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "Datez",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
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
