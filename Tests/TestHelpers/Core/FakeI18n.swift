import Foundation
import SpryKit
@testable import I18nKit

final class FakeI18n<Key: I18nKey>: I18n<Key>, Spryable, @unchecked Sendable
where Key: SpryEquatable {
    enum ClassFunction: String, StringRepresentable {
        case empty
    }

    enum Function: String, StringRepresentable {
        case t = "t(_:)"
        case tWith = "t(_:with:)"
    }

    init() {
        super.init()
    }

    override func t(_ key: Key) -> String {
        return spryify(arguments: key)
    }

    /// helper to make stubbing like
    /// `i18n.stub(.tWith).with(key, "one parameter").andReturn("result")`
    /// instead of
    /// `i18n.stub(.tWith).with(key, ["one parameter"]).andReturn("result")`
    private func prepare(_ parameters: [CVarArg]) -> Any {
        if parameters.count == 1 {
            return parameters[0]
        }
        return parameters
    }

    override func t(_ key: Key, with parameters: CVarArg...) -> String {
        return spryify(arguments: key, prepare(parameters))
    }

    override func t(_ key: Key, with parameters: [CVarArg]) -> String {
        return spryify(arguments: key, prepare(parameters))
    }
}
