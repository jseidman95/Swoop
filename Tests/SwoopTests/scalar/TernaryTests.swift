//
//  TernaryTests.swift
//  
//
//  Created by Jesse Seidman on 9/18/22.
//

import XCTest
import Matchers
@testable import Swoop

class TernaryTests: XCTestCase {
  
  func testConditionTrueScalar() {
    Assertion(
      message: "Must work with true scalar condition",
      test: Ternary(
        True(),
        6,
        16
      ),
      matcher: HasValue(6)
    ).affirm()
  }
  
  func testConditionFalseScalar() {
    Assertion(
      message: "Must work with false scalar condition",
      test: Ternary(
        False(),
        6,
        16
      ),
      matcher: HasValue(16)
    ).affirm()
  }
  
  func testConditionStatic() {
    Assertion(
      message: "Must work with primitive static condition",
      test: Ternary(
        true,
        6,
        16
      ),
      matcher: HasValue(6)
    ).affirm()
  }
  
  func testConsequentScalar() {
    Assertion(
      message: "Must work with scalar consequent and alternative",
      test: Ternary(
        true,
        Constant(6),
        Constant(16)
      ),
      matcher: HasValue(6)
    ).affirm()
  }
  
  func testInputStatic() {
    Assertion(
      message: "Must call the functions with the input",
      test: Ternary(
        5,
        FuncSmart { $0 > 3 },
        FuncSmart { $0 + 1 },
        FuncSmart { $0 + 2 }
      ),
      matcher: HasValue(6)
    ).affirm()
  }
  
  func testInputScalar() {
    Assertion(
      message: "Must call the functions with the input scalar value",
      test: Ternary(
        Constant(5),
        FuncSmart { $0 > 3 },
        FuncSmart { $0 + 1 },
        FuncSmart { $0 + 2 }
      ),
      matcher: HasValue(6)
    ).affirm()
  }
}
