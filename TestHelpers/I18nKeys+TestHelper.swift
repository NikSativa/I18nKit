import Foundation
import Quick
import Nimble
import Spry
import Spry_Nimble

@testable import NI18n

extension I18nKeysSpec {
    public struct Options: OptionSet {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        public static let emptyFile = Options(rawValue: 1 << 0)
        public static let unusedAppKeys = Options(rawValue: 1 << 1)
        public static let unusedFileKeys = Options(rawValue: 1 << 2)

        public static let correct: Options = [.unusedAppKeys, .unusedFileKeys]
    }
}

open class I18nKeysSpec: QuickSpec {
    public func test<T: I18nKey>(_ all: T.Type..., bundle: Bundle = .main, fileName: String, localization localizationName: String? = nil, options: Options = .correct) {
        test(keys: all.reduce([], { $0 + $1.allCases.map({ $0.rawValue }) }),
             bundle: bundle,
             fileName: fileName,
             localization: localizationName,
             options: options)
    }

    public func test(keys allKeys: [String], bundle: Bundle = .main, fileName: String, localization localizationName: String? = nil, options: Options = .correct) {
        describe([localizationName, fileName].compactMap({ $0 }).joined(separator: " ")) {
            var fromFile: [String: String]!

            beforeEach {
                if let url = bundle.url(forResource: fileName, withExtension: "strings", subdirectory: nil, localization: localizationName) {
                    fromFile = (NSDictionary(contentsOf: url) as? [String: String]) ?? [:]
                } else {
                    fromFile = [:]
                }
            }

            if options.contains(.emptyFile) {
                it("should be empty") {
                    expect(fromFile.keys).to(beEmpty())
                }
            } else {
                it("should not be empty") {
                    expect(fromFile.keys).toNot(beEmpty())
                }
            }

            it("should not contain duplicates in app keys") {
                let unique = Set(allKeys)
                expect(unique.count).to(equal(allKeys.count))
            }

            it("should not contain duplicates in file keys") {
                let unique = Set(fromFile.keys)
                expect(unique.count).to(equal(fromFile.count))
            }

            if options.contains(.unusedFileKeys) {
                it("should not contain unused strings in file") {
                    var filtered = fromFile
                    allKeys.forEach { filtered?.removeValue(forKey: $0) }

                    let parts = ["FileName: ",
                                 fileName,
                                 ", ",
                                 "unused keys: ",
                                 String(describing: filtered)]
                    expect(filtered).to(beEmpty(), description: parts.joined())
                }
            }

            if options.contains(.unusedAppKeys) {
                it("should not contain unused strings in app") {
                    let filtered = allKeys.filter {
                        fromFile[$0] == nil
                    }
                    let parts = ["FileName: ",
                                 fileName,
                                 ", ",
                                 "unused keys: ",
                                 String(describing: filtered)]
                    expect(filtered).to(beEmpty(), description: parts.joined())
                }
            }
        }
    }
}
