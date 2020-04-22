import Foundation
import UIKit
import Spry

@testable import NI18n

class FakeI18n<Key: I18nKey>: I18n<Key>, Spryable where Key: SpryEquatable {
    enum ClassFunction: String, StringRepresentable {
        case empty
    }

    enum Function: String, StringRepresentable {
        case t = "t(_:)"
        case tWith = "t(_:with:)"
        case v = "v(_:)"
        case vWith = "v(_:with:)"
    }

    init() {
        super.init()
    }

    override func t(_ key: Key) -> String {
        return spryify(arguments: key)
    }

    override func t(_ key: Key, with parameters: CVarArg...) -> String {
        return spryify(arguments: key, parameters)
    }

    override func t(_ key: Key, with parameters: [CVarArg]) -> String {
        return spryify(arguments: key, parameters)
    }

    override func v(_ key: Key) -> I18nValue {
        return spryify(arguments: key)
    }

    override func v(_ key: Key, with parameters: CVarArg...) -> I18nValue {
        return spryify(arguments: key, parameters)
    }

    override func v(_ key: Key, with parameters: [CVarArg]) -> I18nValue {
        return spryify(arguments: key, parameters)
    }
}
