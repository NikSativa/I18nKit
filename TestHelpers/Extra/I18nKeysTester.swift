import Foundation
import NSpry
import XCTest

@testable import NI18n

// MARK: - I18nKeysTester.Options

public extension I18nKeysTester {
    struct Options: OptionSet {
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

public enum I18nKeysTester {
    public static func test<T: I18nKey>(_ all: T.Type...,
                                        bundle: Bundle = .main,
                                        fileName: String,
                                        localization localizationName: String? = nil,
                                        options: Options = .correct)
    where T: CaseIterable {
        test(keys: all.reduce([]) { $0 + $1.allCases.map(\.rawValue) },
             bundle: bundle,
             fileName: fileName,
             localization: localizationName,
             options: options)
    }

    public static func test(keys allKeys: [String],
                            bundle: Bundle = .main,
                            fileName: String,
                            localization localizationName: String? = nil,
                            options: Options = .correct) {
        var fromFile: [String: String]!

        if let url = bundle.url(forResource: fileName, withExtension: "strings", subdirectory: nil, localization: localizationName) {
            fromFile = (NSDictionary(contentsOf: url) as? [String: String]) ?? [:]
        } else {
            fromFile = [:]
        }

        if options.contains(.emptyFile) {
            XCTAssertTrue(fromFile.keys.isEmpty, "should be empty")
        } else {
            XCTAssertFalse(fromFile.keys.isEmpty, "should not be empty")
        }

        let uniqueAllKeys = Set(allKeys)
        XCTAssertEqual(uniqueAllKeys.count, allKeys.count, "should not contain duplicates in app keys")

        let fromFileKeys = Set(fromFile.keys)
        XCTAssertEqual(fromFileKeys.count, fromFile.count, "should not contain duplicates in file keys")

        if options.contains(.unusedFileKeys) {
            var filtered = fromFile
            allKeys.forEach { filtered?.removeValue(forKey: $0) }

            let parts = [
                "FileName: ",
                fileName,
                ", ",
                "unused keys: ",
                String(describing: filtered)
            ]

            XCTAssertTrue(filtered?.isEmpty == true, "should not contain unused strings in file. " + parts.joined())
        }

        if options.contains(.unusedAppKeys) {
            let filtered = allKeys.filter {
                fromFile[$0] == nil
            }
            let parts = [
                "FileName: ",
                fileName,
                ", ",
                "unused keys: ",
                String(describing: filtered)
            ]
            XCTAssertTrue(filtered.isEmpty == true, "should not contain unused strings in app. " + parts.joined())
        }
    }
}
