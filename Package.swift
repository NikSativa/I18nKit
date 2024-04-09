// swift-tools-version:5.8
// swiftformat:disable all
import PackageDescription

let package = Package(
    name: "I18nKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "I18nKit", targets: ["I18nKit"]),
        .library(name: "I18nKitTestHelpers", targets: ["I18nKitTestHelpers"]),
        .library(name: "I18nKitExtraTestHelpers", targets: ["I18nKitExtraTestHelpers"])
    ],
    dependencies: [
        .package(url: "https://github.com/NikSativa/SpryKit.git", .upToNextMinor(from: "2.2.0"))
    ],
    targets: [
        .target(name: "I18nKit",
                dependencies: [],
                path: "Source",
                resources: [
                    .copy("../PrivacyInfo.xcprivacy")
                ]),
        .target(name: "I18nKitTestHelpers",
                dependencies: [
                    "I18nKit",
                    "SpryKit"
                ],
                path: "TestHelpers/Core",
                resources: [
                    .copy("../../PrivacyInfo.xcprivacy")
                ]),
        .target(name: "I18nKitExtraTestHelpers",
                dependencies: [
                    "I18nKit",
                    "SpryKit"
                ],
                path: "TestHelpers/Extra",
                resources: [
                    .copy("../../PrivacyInfo.xcprivacy")
                ]),
        .testTarget(name: "I18nKitTests",
                    dependencies: [
                        "I18nKit",
                        "I18nKitTestHelpers",
                        "I18nKitExtraTestHelpers",
                        "SpryKit"
                    ],
                    path: "Tests",
                    resources: [
                        .process("TestI18nCorrect.strings"),
                        .process("TestI18nEmpty.strings"),
                        .process("TestI18nUndefined.strings"),
                        .process("TestI18nUnused.strings")
                    ])
    ]
)
