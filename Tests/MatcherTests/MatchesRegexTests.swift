//
//  MatchesRegexTests.swift
//  
//
//  Created by Jesse Seidman on 9/9/22.
//

import XCTest
import Swoop
@testable import Matchers

final class MatchesRegexTests: XCTestCase {

  func testMatches() {
    Assertion(
      message: "matches text that satisfies regex",
      test: MatchesRegex(regex: "\\w+\\d\\d\\d\\w+"),
      matcher: Matches(TextOf("abc456def"))
    ).affirm()
  }

  func testMismatches() {
    Assertion(
      message: "matches text that satisfies regex",
      test: MatchesRegex(regex: "\\w+\\d\\d\\d\\w+"),
      matcher: Mismatches(TextOf("abc46def"))
    ).affirm()
  }
}
