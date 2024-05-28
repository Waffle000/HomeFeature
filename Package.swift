// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HomeFeature",
    platforms: [
        .iOS(.v17), .macOS(.v14)
    ],
    products: [
        .library(
            name: "HomeFeature",
            targets: ["HomeFeature"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Waffle000/ProfileFeature.git", branch: "main"),
        .package(url: "https://github.com/Waffle000/FavoriteFeature.git", branch: "main")
    ],
    targets: [
        .target(
            name: "HomeFeature",
            dependencies: ["ProfileFeature", "FavoriteFeature"]
        ),
        .testTarget(
            name: "HomeFeatureTests",
            dependencies: ["HomeFeature"]
        ),
    ]
)

