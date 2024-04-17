// swift-tools-version:5.10

import PackageDescription

var platforms: [SupportedPlatform] = [
    .macOS(.v10_13),
    .watchOS("6.2"),
    .tvOS(.v11),
    .iOS(.v11)
]

// Add additional platform support if using Swift compiler 5.9 or greater
#if compiler(>=5.9)
platforms += [.visionOS(.v1)]
#endif

let package = Package(
    name: "RevenueCat",
    defaultLocalization: "en",
    platforms: platforms,
    products: [.library(name: "RevenueCat", targets: ["RevenueCat", "_RevenueCatStub"])],
    targets: [
        .binaryTarget(
            name: "RevenueCat",
            url: "https://github.com/RevenueCat/purchases-ios/releases/download/4.40.1/RevenueCat.xcframework.zip",
            checksum: "abbf53ded5fae7af82e3521b76bdec41e6ddd1099e12b6c1f4264e397c6f31fa"
        ),

        // Without at least one regular (non-binary) target, this package doesn't show up
        // in Xcode under "Frameworks, Libraries, and Embedded Content". That prevents
        // RevenueCat from being embedded in the app product, causing the app to crash when
        // ran on a physical device. As a workaround, we can include a stub target
        // with at least one source file.
        // https://github.com/apple/swift-package-manager/issues/6069
        .target(name: "_RevenueCatStub"),
    ]
)
