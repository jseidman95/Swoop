//
//  EndsWithTests.swift
//  
//
//  Created by Jesse Seidman on 9/6/22.
//

import Foundation

import XCTest
import Swoop
@testable import Matchers

final class EndsWithTests: XCTestCase {

  func testMatch() {
    Assertion(
      message: "matches validates arguments",
      test: EndsWith(string: "the dew"),
      matcher: Matches(TextOf("Roll away the dew"))
    ).affirm()
  }

  func testMismatch() {
    Assertion(
      message: "doesn't match invalid args",
      test: EndsWith(string: "Roll away"),
      matcher: Mismatches(TextOf("Roll away the dew"))
    ).affirm()
  }
}
