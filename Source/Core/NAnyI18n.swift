import Foundation

class AnyI18n<T: I18nKeys> {
    func t(_ key: T, with parameters: CVarArg...) -> String {
        return key.t(with: parameters)
    }

    func t(_ key: T, with parameters: [CVarArg]) -> String {
        return key.t(with: parameters)
    }
}
