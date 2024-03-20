// swift-tools-version:5.8
// swiftformat:disable all
import PackageDescription

let package = Package(
    name: "NI18n",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "NI18n", targets: ["NI18n"]),
        .library(name: "NI18nTestHelpers", targets: ["NI18nTestHelpers"]),
        .library(name: "NI18nExtraTestHelpers", targets: ["NI18nExtraTestHelpers"])
    ],
    dependencies: [
        .package(url: "https://github.com/NikSativa/NSpry.git", .upToNextMinor(from: "2.1.4"))
    ],
    targets: [
        .target(name: "NI18n",
                dependencies: [],
                path: "Source",
                resources: [
                    .copy("../PrivacyInfo.xcprivacy")
                ]),
        .target(name: "NI18nTestHelpers",
                dependencies: [
                    "NI18n",
                    "NSpry"
                ],
                path: "TestHelpers/Core",
                resources: [
                    .copy("../../PrivacyInfo.xcprivacy")
                ]),
        .target(name: "NI18nExtraTestHelpers",
                dependencies: [
                    "NI18n",
                    "NSpry"
                ],
                path: "TestHelpers/Extra",
                resources: [
                    .copy("../../PrivacyInfo.xcprivacy")
                ]),
        .testTarget(name: "NI18nTests",
                    dependencies: [
                        "NI18n",
                        "NI18nTestHelpers",
                        "NI18nExtraTestHelpers",
                        "NSpry"
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
