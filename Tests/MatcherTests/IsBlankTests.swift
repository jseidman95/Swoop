//
//  IsBlankTests.swift
//  
//
//  Created by Jesse Seidman on 9/9/22.
//

import XCTest
import Swoop
@testable import Matchers

final class IsBlankTests: XCTestCase {

  func testMatches() {
    Assertion(
      message: "confirm empty string",
      test: IsBlank(),
      matcher: Matches(TextOf(""))
    ).affirm()
  }

  func testMismatches() {
    Assertion(
      message: "confirm not empty string",
      test: IsBlank(),
      matcher: Mismatches(TextOf("hi"))
    ).affirm()
  }
}
