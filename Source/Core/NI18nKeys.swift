import Foundation
import UIKit

protocol I18nKeys: RawRepresentable {
    static var bundle: Bundle { get }
    static var table: String? { get }
    func t(with parameters: CVarArg...) -> String
    func t(with parameters: [CVarArg]) -> String
}

extension I18nKeys where RawValue == String {
    static var bundle: Bundle {
        return Bundle.main
    }

    static var table: String? {
        return nil
    }

    func t(with parameters: CVarArg...) -> String {
        return t(with: parameters)
    }

    func t(with parameters: [CVarArg]) -> String {
        let key = rawValue
        let formatString = Self.bundle.localizedString(forKey: key, value: key, table: Self.table)

        let locale: Locale?
        if let localization = Self.bundle.preferredLocalizations.first  {
            locale = Locale(identifier: localization)
        }
        else {
            locale = nil
        }

        return String(format: formatString, locale: locale, arguments: parameters)
    }

    func apply<T: UIButton>(to view: T, state: UIControl.State = .normal, with parameters: CVarArg...) {
        let text = t(with: parameters)
        view.setTitle(text, for: state)
    }

    func apply<T: UILabel>(to view: T, with parameters: CVarArg...) {
        let text = t(with: parameters)
        view.text = text
    }

    func apply<T: UITextField>(to view: T, with parameters: CVarArg...) {
        let text = t(with: parameters)
        view.text = text
    }

    func applyPlaceholder<T: UITextField>(to view: T, with parameters: CVarArg...) {
        let text = t(with: parameters)
        view.placeholder = text
    }

    func apply<T: UITextView>(to view: T, with parameters: CVarArg...) {
        let text = t(with: parameters)
        view.text = text
    }
}
