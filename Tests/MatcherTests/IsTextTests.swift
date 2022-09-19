//
//  IsTextTests.swift
//  
//
//  Created by Jesse Seidman on 8/23/22.
//

import XCTest
import Swoop
@testable import Matchers

final class IsTextTests: XCTestCase {

  func testMatchText() {
    let string = "ahab"
    Assertion(
      message: "must match text",
      test: IsText(string: string),
      matcher: Matches(TextOf(string))
    ).affirm()
  }

  func testMismatchText() {
    Assertion(
      message: "doesn't match text that isn't the same",
      test: IsText(string: "xy"),
      matcher: Mismatches(TextOf("kdfjl"))
    ).affirm()
  }
}
