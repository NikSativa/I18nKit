// swift-tools-version:5.3

import PackageDescription

// swiftformat:disable all
let package = Package(
    name: "NI18n",
    platforms: [.iOS(.v11), .macOS(.v10_12)],
    products: [
        .library(name: "NI18n", targets: ["NI18n"]),
        .library(name: "NI18nTestHelpers", targets: ["NI18nTestHelpers"]),
        .library(name: "NI18nExtraTestHelpers", targets: ["NI18nExtraTestHelpers"])
    ],
    dependencies: [
        .package(url: "https://github.com/NikSativa/NSpry.git", .upToNextMajor(from: "1.2.9")),
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "5.0.1")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "10.0.0"))
    ],
    targets: [
        .target(name: "NI18n",
                dependencies: [],
                path: "Source"),
        .target(name: "NI18nTestHelpers",
                dependencies: [
                    "NI18n",
                    "NSpry"
                ],
                path: "TestHelpers/Core"),
        .target(name: "NI18nExtraTestHelpers",
                dependencies: [
                    "NI18n",
                    "NSpry",
                    "Nimble",
                    "Quick"
                ],
                path: "TestHelpers/Extra"),
        .testTarget(name: "NI18nTests",
                    dependencies: [
                        "NI18n",
                        "NI18nTestHelpers",
                        "NI18nExtraTestHelpers",
                        "NSpry",
                        .product(name: "NSpry_Nimble", package: "NSpry"),
                        "Nimble",
                        "Quick"
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
