//
//  ConstantTests.swift
//  
//
//  Created by Jesse Seidman on 9/18/22.
//

import XCTest
import Matchers
@testable import Swoop

class ConstantTests: XCTestCase {
  
  func testReturnsValue() throws {
    let value = "Hello world"
    Assertion(
      message: "Must return given value",
      test: Constant(value),
      matcher: HasValue(value)
    ).affirm()
  }
  
  func testAlwaysReturnsValue() throws {
    let constant = Constant("Good bye!")
    
    Assertion(
      message: "Must return same value",
      test: constant,
      matcher: try HasValue(constant.value())
    ).affirm()
  }
}
