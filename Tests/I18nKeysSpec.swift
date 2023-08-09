import Foundation
import NSpry
import XCTest

@testable import NI18n
@testable import NI18nExtraTestHelpers
@testable import NI18nTestHelpers

final class TestI18nKeysSpec: XCTestCase {
    enum TestI18n: String, I18nKey, CaseIterable {
        case forTest
    }

    enum TestI18n2: String, I18nKey, CaseIterable {
        case forTest
        case forTest2
    }

    func test_tester() {
        let bundle = Bundle.module

        I18nKeysTester.test(TestI18n.self,
                            bundle: bundle,
                            fileName: "TestI18nCorrect",
                            options: .correct)

        I18nKeysTester.test(keys: [],
                            bundle: bundle,
                            fileName: "TestI18nEmpty",
                            options: .emptyFile)

        I18nKeysTester.test(TestI18n.self,
                            bundle: bundle,
                            fileName: "TestI18nUnused",
                            options: .correct.subtracting(.unusedFileKeys))

        I18nKeysTester.test(TestI18n2.self,
                            bundle: bundle,
                            fileName: "TestI18nUndefined",
                            options: .correct.subtracting(.unusedAppKeys))
    }
}
