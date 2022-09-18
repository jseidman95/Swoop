//
//  ReducedTests.swift
//  
//
//  Created by Jesse Seidman on 8/2/22.
//

import XCTest
import Matchers
@testable import Swoop

class ReducedTests: XCTestCase {

  func testThrowsErrorForEmptyIterable() throws {
    Assertion(
      message: "should throw standard exception because no element exists",
      test: Reduced<Any>([]) { x,y in
        return x
      },
      matcher: ThrowsScalarException()
    ).affirm()
  }
  
  func testFindSingleItemIterable() {
    let single = 10
    Assertion(
      message: "Find the single yo",
      test: Reduced(
        ScalarSmart { return single },
        closure: { first, last in return first }
      ),
      matcher: HasValue(single)
    ).affirm()
  }
  
  func testFirstAtIterable() {
    Assertion(
      message: "Find the first yo",
      test: Reduced(
        ScalarSmart { return "Apple" },
        ScalarSmart { return "Banana" },
        ScalarSmart { return "Orange" },
        closure: { first, second in return first}
      ),
      matcher: HasValue("Apple")
    ).affirm()
  }
  
  func testLastAtIterable() {
    Assertion(
      message: "Find the last yo",
      test: Reduced(
        ScalarSmart { return "Apple" },
        ScalarSmart { return "Banana" },
        ScalarSmart { return "Orange" },
        closure: { first, second in return second }
      ),
      matcher: HasValue("Orange")
    ).affirm()
  }
}
