import XCTest
import Swoop
@testable import Matchers

final class AssertionTests: XCTestCase {

  func testAffirmIfResultMatches() {
    let expect = "abc123"
    Assertion(
      message: "must affirm the assertion if the test's result is as expected",
      test: TextOf(expect),
      matcher: IsText(expect)
    ).affirm()
  }
}
