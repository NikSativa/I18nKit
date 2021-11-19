#if os(iOS)
import Foundation
import UIKit

public struct I18nValue: Equatable {
    public let localizedString: String

    init(_ value: String) {
        self.localizedString = value
    }

    public func apply<T: UIButton>(to view: T, state: UIControl.State = .normal) {
        view.setTitle(localizedString, for: state)
    }

    public func apply<T: UILabel>(to view: T) {
        view.text = localizedString
    }

    public func apply<T: UITextField>(to view: T) {
        view.text = localizedString
    }

    public func applyPlaceholder<T: UITextField>(to view: T) {
        view.placeholder = localizedString
    }

    public func apply<T: UITextView>(to view: T) {
        view.text = localizedString
    }
}
#endif
