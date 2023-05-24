//
//  AndTests.swift
//
//
//  Created by Jesse Seidman on 8/2/22.
//

import XCTest
import Matchers
@testable import Swoop

class BoolFromTests: XCTestCase {
  
  func testTrue() throws {
    Assertion(
      message: "Must be parsed string 'true'",
      test: BoolFrom("true"),
      matcher: HasValue(true)
    ).affirm()
  }
  
  func testFalse() throws {
    Assertion(
      message: "Must be parsed string 'false'",
      test: BoolFrom("false"),
      matcher: HasValue(false)
    ).affirm()
  }

  func testIsFalseIfTextIsNotBool() throws {
    Assertion(
      message: "Must be parsed as a non-boolean string",
      test: BoolFrom("xyz"),
      matcher: HasValue(false)
    ).affirm()
  }
}
