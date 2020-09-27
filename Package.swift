// swift-tools-version:5.3
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
        .package(url: "https://github.com/NikSativa/Spry.git", .upToNextMajor(from: "3.0.0")),
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "3.0.0")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "8.0.1"))
    ],
    targets: [
        .target(name: "NI18n",
                dependencies: [],
                path: "Source"),
        .target(name: "NI18nTestHelpers",
                dependencies: ["NI18n",
                               "Spry",
                               .product(name: "Spry_Nimble", package: "Spry"),
                               "Nimble",
                               "Quick"],
                path: "TestHelpers"),
        .testTarget(name: "NI18nTests",
                    dependencies: ["NI18n",
                                   "NI18nTestHelpers",
                                   "Spry",
                                   .product(name: "Spry_Nimble", package: "Spry"),
                                   "Nimble",
                                   "Quick"],
                    path: "Tests/Specs",
                    resources: [.copy("TestI18nCorrect.strings"),
                                .copy("TestI18nEmpty.strings"),
                                .copy("TestI18nUndefined.strings"),
                                .copy("TestI18nUnused.strings")]
        )
    ],
    swiftLanguageVersions: [.v5]
)
