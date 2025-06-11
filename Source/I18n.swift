import Foundation

open class I18n<Key: I18nKey> {
    private let bundle: Bundle
    private let table: String?

    public init(bundle: Bundle = .main, table: String? = nil) {
        self.bundle = bundle
        self.table = table
    }

    open func t(_ key: Key) -> String {
        return t(key, with: [])
    }

    open func t(_ key: Key, with parameters: CVarArg...) -> String {
        return t(key, with: parameters)
    }

    open func t(_ key: Key, with parameters: [CVarArg]) -> String {
        let key = key.rawValue
        let formatString = bundle.localizedString(forKey: key, value: key, table: table)

        let locale: Locale? =
            if let localization = bundle.preferredLocalizations.first {
                Locale(identifier: localization)
            } else {
                nil
            }

        return String(format: formatString, locale: locale, arguments: parameters)
    }
}

#if swift(>=6.0)
extension I18n: @unchecked Sendable {}
#endif
