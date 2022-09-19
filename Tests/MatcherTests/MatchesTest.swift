//
//  MatchesTest.swift
//  
//
//  Created by Jesse Seidman on 9/9/22.
//

import XCTest
import Swoop
@testable import Matchers

final class MatchesTest: XCTestCase {

  func testMatches() {
    Assertion(
      message: "Matcher IsText(abc) gives positive result for Text(abc)",
      test: IsText(string: "abc"),
      matcher: Matches(TextOf("abc"))
    ).affirm()
  }

  func testMatches2() {
    Assertion(
      message: "Matcher TextIs(abc) gives positive result for Text(abc)",
      test: Matches(TextOf("abc")),
      matcher: Matches(IsText(string: "abc"))
    ).affirm()
  }

  func testMismatches() {
    Assertion(
      message: "Matcher IsText(abc) gives negative result for Text(def)",
      test: Matches(TextOf("def")),
      matcher: Mismatches(IsText(string: "abc"))
    ).affirm()
  }
}
