import Foundation
import UIKit

import Nimble
import NSpry
import Quick

@testable import NI18n
@testable import NI18nTestHelpers

#if SWIFT_PACKAGE
@testable import NI18nExtraTestHelpers
#endif

final class TestI18nKeysSpec: QuickSpec {
    enum TestI18n: String, I18nKey, CaseIterable {
        case forTest
    }

    enum TestI18n2: String, I18nKey, CaseIterable {
        case forTest
        case forTest2
    }

    override func spec() {
        let bundle = Bundle.module
        let tester = I18nKeysTester()

        tester.test(TestI18n.self,
                    bundle: bundle,
                    fileName: "TestI18nCorrect",
                    options: .correct)

        tester.test(keys: [],
                    bundle: bundle,
                    fileName: "TestI18nEmpty",
                    options: .emptyFile)

        tester.test(TestI18n.self,
                    bundle: bundle,
                    fileName: "TestI18nUnused",
                    options: .correct.subtracting(.unusedFileKeys))

        tester.test(TestI18n2.self,
                    bundle: bundle,
                    fileName: "TestI18nUndefined",
                    options: .correct.subtracting(.unusedAppKeys))
    }
}
