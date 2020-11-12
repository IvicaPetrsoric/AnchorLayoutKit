// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AnchorLayoutKit",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "AnchorLayoutKit",
            targets: ["AnchorLayoutKit"]),
    ],
    targets: [
        .target(
            name: "AnchorLayoutKit",
            dependencies: []),
        .testTarget(
            name: "AnchorLayoutKitTests",
            dependencies: ["AnchorLayoutKit"]),
    ],
    swiftLanguageVersions: [.v5]

)
