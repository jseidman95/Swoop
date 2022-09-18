//
//  FalseTests.swift
//  
//
//  Created by Jesse Seidman on 8/1/22.
//

import XCTest
import Matchers
@testable import Swoop

class FalseTests: XCTestCase {

  func testValue() throws {
    Assertion(
      message: "False gives correct value",
      test: False().value(),
      matcher: IsNot(IsTrue())
    ).affirm()
  }

  func testScalar() throws {
    Assertion(
      message: "Must be false",
      test: False(),
      matcher: HasValue(false)
    ).affirm()
  }
}
