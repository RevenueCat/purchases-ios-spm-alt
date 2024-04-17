// swift-tools-version:5.9

import PackageDescription

// See https://github.com/RevenueCat/purchases-ios/pull/2989
// #if os(visionOS) can't really be used in Xcode 13, so we use this instead.
let visionOSSetting: SwiftSetting = .define("VISION_OS", .when(platforms: [.visionOS]))

let package = Package(
    name: "RevenueCat",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v10_13),
        .watchOS("6.2"),
        .tvOS(.v11),
        .iOS(.v11),
        .visionOS(.v1)
    ],
    products: [.library(name: "RevenueCat", targets: ["RevenueCat", "_RevenueCatStub"])],
    targets: [
        .binaryTarget(
            name: "RevenueCat",
            url: "https://github.com/RevenueCat/purchases-ios/releases/download/4.40.1/RevenueCat.xcframework.zip",
            checksum: "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
            swiftSettings: [visionOSSetting]
        )
    ]
)