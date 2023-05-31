//
//  IsBlankTests.swift
//
//
//  Created by Jesse Seidman on 5/31/23.
//

import XCTest
import Matchers
@testable import Swoop

class IsBlankTests: XCTestCase {
  
  func testEvaluatesEmpty() throws {
    Assertion(
      message: "Returns true for empty",
      test: IsBlank(TextOf("")),
      matcher: HasValue(true)
    ).affirm()
  }
  
  func testEvaluatesSpaces() throws {
    Assertion(
      message: "Returns true for spaces",
      test: IsBlank(TextOf("    ")),
      matcher: HasValue(true)
    ).affirm()
  }
  
  func testEvaluatesNonBlank() throws {
    Assertion(
      message: "Returns false for word",
      test: IsBlank(TextOf(" hi   ")),
      matcher: HasValue(false)
    ).affirm()
  }
}
