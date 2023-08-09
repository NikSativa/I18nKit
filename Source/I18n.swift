import Foundation

public class I18n<Key: I18nKey> {
    private let bundle: Bundle
    private let table: String?

    public init(bundle: Bundle = .main, table: String? = nil) {
        self.bundle = bundle
        self.table = table
    }

    public func t(_ key: Key) -> String {
        return t(key, with: [])
    }

    public func t(_ key: Key, with parameters: CVarArg...) -> String {
        return t(key, with: parameters)
    }

    public func t(_ key: Key, with parameters: [CVarArg]) -> String {
        let key = key.rawValue
        let formatString = bundle.localizedString(forKey: key, value: key, table: table)

        let locale: Locale?
        if let localization = bundle.preferredLocalizations.first {
            locale = Locale(identifier: localization)
        } else {
            locale = nil
        }

        return String(format: formatString, locale: locale, arguments: parameters)
    }
}
