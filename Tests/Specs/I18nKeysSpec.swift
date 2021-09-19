import Foundation
import UIKit

import Nimble
import NSpry
import Quick

@testable import NI18n
@testable import NI18nTestHelpers

class TestI18nKeysSpec: I18nKeysSpec {
    enum TestI18n: String, I18nKey, CaseIterable {
        case forTest
    }

    enum TestI18n2: String, I18nKey, CaseIterable {
        case forTest
        case forTest2
    }

    override func spec() {
        let bundle = Bundle.module

        test(TestI18n.self,
             bundle: bundle,
             fileName: "TestI18nCorrect",
             options: .correct)

        test(keys: [],
             bundle: bundle,
             fileName: "TestI18nEmpty",
             options: .emptyFile)

        test(TestI18n.self,
             bundle: bundle,
             fileName: "TestI18nUnused",
             options: Options.correct.subtracting(.unusedFileKeys))

        test(TestI18n2.self,
             bundle: bundle,
             fileName: "TestI18nUndefined",
             options: Options.correct.subtracting(.unusedAppKeys))
    }
}
