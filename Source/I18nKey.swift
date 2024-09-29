import Foundation

#if swift(>=6.0)
public protocol I18nKey: Equatable, RawRepresentable where RawValue == String {}
#else
public protocol I18nKey: Equatable, Sendable, RawRepresentable where RawValue == String {}
#endif
