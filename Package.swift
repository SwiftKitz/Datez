// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Datez",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_12),
        .tvOS(.v9),
        .watchOS(.v4),
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
            dependencies: []),
        .testTarget(
            name: "DatezTests",
            dependencies: ["Datez"]),
    ]
)
