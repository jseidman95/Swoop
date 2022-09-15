import Swoop
import XCTest

public class Assertion<T> {

  private let message: String
  private let test: T
  private let matcher: any Matcher<T>

  public init(message: String, test: T, matcher: any Matcher<T>) {
    self.message = message
    self.test = test
    self.matcher = matcher
  }

  public func affirm(file: StaticString = #file, line: UInt = #line) {
    if !matcher.matches(item: test) {
      let text =
          "\n" +
          message
          + "\n"
          + "Expected: \(matcher.description())"
          + "\n"
          + "but got: "
          + matcher.mismatchDescription(item: test)

      XCTFail(text, file: file, line: line)
    }
  }
}
