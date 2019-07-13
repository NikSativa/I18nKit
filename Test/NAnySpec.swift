import Foundation
import UIKit

import Quick
import Nimble
import Spry
import Spry_Nimble

class NAnySpec: QuickSpec {
    override func spec() {
        describe("Any") {
            it("should be a real test") {
                expect(true).to(beTrue())
            }
        }
    }
}
