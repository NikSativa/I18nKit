import Foundation
import UIKit

import Quick
import Nimble
import Spry
import Spry_Nimble

@testable import NI18n
@testable import NI18nTestHelpers

class I18nValueSpec: QuickSpec {
    override func spec() {
        describe("I18nValue") {
            var text: String!
            var value: I18nValue!

            beforeEach {
                text = "111"
                value = .testMake(value: text)
            }

            describe("UIButton; noraml state") {
                var view: UIButton!

                beforeEach {
                    view = .init()
                }

                context("when state is noraml") {
                    beforeEach {
                        value.apply(to: view)
                    }

                    it("should apply localized string to corresponding property of UI component") {
                        expect(view.title(for: .normal)).to(equal(text))
                    }
                }

                context("when state is highlighted") {
                    beforeEach {
                        value.apply(to: view, state: .highlighted)
                    }

                    it("should apply localized string to corresponding property of UI component") {
                        expect(view.title(for: .highlighted)).to(equal(text))
                    }
                }
            }

            describe("UILabel") {
                var view: UILabel!

                beforeEach {
                    view = .init()
                    value.apply(to: view)
                }

                it("should apply localized string to corresponding property of UI component") {
                    expect(view.text).to(equal(text))
                }
            }

            describe("UITextView") {
                var view: UITextView!

                beforeEach {
                    view = .init()
                    value.apply(to: view)
                }

                it("should apply localized string to corresponding property of UI component") {
                    expect(view.text).to(equal(text))
                }
            }

            describe("UITextField") {
                var view: UITextField!

                beforeEach {
                    view = .init()
                    value.apply(to: view)
                }

                it("should apply localized string to corresponding property of UI component") {
                    expect(view.text).to(equal(text))
                }
            }

            describe("UITextField placeholder") {
                var view: UITextField!

                beforeEach {
                    view = .init()
                    value.applyPlaceholder(to: view)
                }

                it("should apply localized string to corresponding property of UI component") {
                    expect(view.placeholder).to(equal(text))
                }
            }
        }
    }
}