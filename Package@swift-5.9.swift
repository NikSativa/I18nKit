// swift-tools-version:5.9
// swiftformat:disable all
import PackageDescription

let package = Package(
    name: "I18nKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "I18nKit", targets: ["I18nKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/NikSativa/SpryKit.git", from: "3.0.4")
    ],
    targets: [
        .target(name: "I18nKit",
                dependencies: [],
                path: "Source",
                resources: [
                    .process("PrivacyInfo.xcprivacy")
                ]),
        .testTarget(name: "I18nKitTests",
                    dependencies: [
                        "I18nKit",
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
