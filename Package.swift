// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NI18n",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "NI18n", targets: ["NI18n"]),
        .library(name: "NI18nTestHelpers", targets: ["NI18nTestHelpers"])
    ],
    dependencies: [
        .package(url: "https://github.com/NikSativa/NSpry.git", .upToNextMajor(from: "1.0.1")),
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "9.2.0"))
    ],
    targets: [
        .target(name: "NI18n",
                dependencies: [],
                path: "Source"),
        .target(name: "NI18nTestHelpers",
                dependencies: ["NI18n",
                               "NSpry",
                               "Nimble",
                               "Quick"],
                path: "TestHelpers"),
        .testTarget(name: "NI18nTests",
                    dependencies: ["NI18n",
                                   "NI18nTestHelpers",
                                   "NSpry",
                                   "Nimble",
                                   "Quick"],
                    path: "Tests/Specs",
                    resources: [.process("TestI18nCorrect.strings"),
                                .process("TestI18nEmpty.strings"),
                                .process("TestI18nUndefined.strings"),
                                .process("TestI18nUnused.strings")]
        )
    ],
    swiftLanguageVersions: [.v5]
)
