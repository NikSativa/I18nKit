import Foundation
import Spry

extension I18nValue: SpryEquatable {
    static func testMake(value: String = "") -> I18nValue {
        return I18nValue(value)
    }
}
