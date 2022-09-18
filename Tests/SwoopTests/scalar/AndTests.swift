//
//  AndTests.swift
//  
//
//  Created by Jesse Seidman on 8/2/22.
//

import XCTest
import Matchers
@testable import Swoop

class AndTests: XCTestCase {

  func testAllTrue() throws {
    Assertion(
      message: "Each object must be True",
      test: And(
        True(),
        True(),
        True()
      ),
      matcher: HasValue(true)
    ).affirm()
  }

  func testOneFalse() throws {
    Assertion(
      message: "One object must be False",
      test: And(
        True(),
        False(),
        True()
      ),
      matcher: HasValue(false)
    ).affirm()
  }

  func testAllFalse() throws {
    Assertion(
      message: "Each object must be False",
      test: And(
        False(),
        False(),
        False(),
        False()
      ),
      matcher: HasValue(false)
    ).affirm()
  }

  func testOneTrue() throws {
    Assertion(
      message: "fails if any are false",
      test: And(
        False(),
        False(),
        False(),
        True()
      ),
      matcher: HasValue(false)
    ).affirm()
  }

  func testEmptyIterator() throws {
    Assertion(
      message: "Iterator must be empty",
      test: And(
        origin: IterableOf<any Scalar<Bool>>()
      ),
      matcher: HasValue(true)
    ).affirm()
  }

  func testFuncIterable() throws {
    Assertion(
      message: "tests function for iterable",
      test: And(
        FuncSmart { input in
          input > 0
        },
        IterableOf(1, -1, 0)
      ),
      matcher: HasValue(false)
    ).affirm()
  }

  func testFuncVarargs() throws {
    Assertion(
      message: "tests function for varargs",
      test: And(
        FuncSmart { input in
          input > 0
        },
        -1, -2, 0
      ),
      matcher: HasValue(false)
    ).affirm()
  }

  func testMultipleFuncConditionTrue() throws {
    Assertion(
      message: "Can't compare subject with true conditions",
      test: And(
        3,
        FuncSmart { return $0 > 0 },
        FuncSmart { return $0 > 5 },
        FuncSmart { return $0 > 4 }
      ),
      matcher: HasValue(false)
    ).affirm()
  }

  func testMultipleFuncConditionFalse() throws {
    Assertion(
      message: "Can't compare subject with false conditions",
      test: And(
        "cactoos",
        FuncSmart { return $0.contains("singleton") },
        FuncSmart { return $0.contains("static") }
      ),
      matcher: HasValue(false)
    ).affirm()
  }
}
