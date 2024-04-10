# I18nKit

Simple and lightweight library that provides a convenient way to manage and use localized strings in iOS apps.
Localization keys are represented as Swift enums, which makes it easier to manage and use them in the code.

### Example

'I18nKeys.Auth.strings' file in main bundle:
```
"logIn" = "Log In";
"forgotPassword" = "Forgot your password?";
"selectCredentials" = "Select credentials";
```

'I18nKeys.Auth.swift' file app target:
```swift
extension I18nKeys {
    enum Auth: String, I18nKey {
        case logIn
        case forgotPassword
        case selectCredentials
    }
}
```

usage in the code:
```swift
let i18n: I18n<I18nKeys.Auth> = .init()
let logIn = i18n.t(.logIn)
ptint(logIn) // "Log In"
```

### I18nKeysTester
Helper tool that allows you to test the existence of the localization keys in the project.

```swift
I18nKeysTester.test(TestI18n.self,
                    bundle: bundle,
                    fileName: "TestI18nCorrect",
                    options: .correct)
```
