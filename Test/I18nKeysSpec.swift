import Foundation
import UIKit

import Quick
import Nimble
import Spry
import Spry_Nimble

@testable import NI18n
@testable import NI18nTestHelpers

class TestI18nKeysSpec: I18nKeysSpec {
    enum TestI18n: String, I18nKey {
        case forTest
    }

    enum TestI18n2: String, I18nKey {
        case forTest
        case forTest2
    }

    override func spec() {
        test(TestI18n.self,
             bundle: Bundle(for: TestI18nKeysSpec.self),
             fileName: "TestI18nCorrect",
             options: .correct)

        test(TestI18n.self,
             bundle: Bundle(for: TestI18nKeysSpec.self),
             fileName: "TestI18nEmpty",
             options: .emptyFile)

        test(TestI18n.self,
             bundle: Bundle(for: TestI18nKeysSpec.self),
             fileName: "TestI18nUnused",
             options: Options.correct.subtracting(.unusedFileKeys))

        test(TestI18n2.self,
             bundle: Bundle(for: TestI18nKeysSpec.self),
             fileName: "TestI18nUndefined",
             options: Options.correct.subtracting(.unusedAppKeys))
    }
}
