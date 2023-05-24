//
//  FirstOfTests.swift
//
//
//  Created by Jesse Seidman on 5/23/23.
//

import XCTest
import Matchers
@testable import Swoop

class FirstOfTests: XCTestCase {

  func testReturnsMatchingValue() {
    let value = 1
    Assertion(
      message: "Must return the only matching element",
      test: FirstOf(
        condition: FuncSmart { i in i >= value },
        source: IterableOfInts(0, value),
        fallback: ScalarSmart { return -1 }
      ),
      matcher: HasValue(value)
    ).affirm()
  }
  
  func testReturnsMatchingValueWithExceptionalFallBack() {
    let value = 2
    Assertion(
      message: "Exception was not thrown",
      test: FirstOf(
        condition: FuncSmart { i in i >= value},
        source: IterableOfInts(0, value),
        fallback: ScalarSmart {
          throw StandardException("This exception shouldn't be thrown")
        }
      ),
      matcher: HasValue(value)
    ).affirm()
  }
  
  func testReturnsFirstvalueForMultipleMatchingOnes() {
    let val = "1"
    Assertion(
      message: "Must return first matching element",
      test: FirstOf(
        condition: FuncSmart { i in i != "" },
        source: IterableOf("1", "2"),
        fallback: ScalarSmart { "" }
      ),
      matcher: HasValue(val)
    ).affirm()
  }
  
  func testReturnsFallbackIfNothingMatches() {
    let val = "hi"
    Assertion(
      message: "Return fallback value if nothing matches",
      test: FirstOf(
        condition: FuncSmart {
          return $0 == val
        },
        source: IterableOf("ba", "ba", "black", "sheep"),
        fallback: Constant("sittin")
      ),
      matcher: HasValue("sittin")
    ).affirm()
  }
  
  func testThrowsFallbackIfNothingMatches() {
    Assertion(
      message: "Fallback was not thrown",
      test: FirstOf(
        condition: FuncSmart {
          return $0 == 0
        },
        source: IterableOf(1,2,3,4,5),
        fallback: ScalarSmart {
          throw StandardException("Unable to find element with id")
        }
      ),
      matcher: Throws(type: StandardException.Type.self)
    ).affirm()
  }
  
  func testReturnsFirstValueWithScalarFallback() {
    Assertion(
      message: "Returns first value with scalar fallback",
      test: FirstOf(
        src: IterableOfInts(2,1,0),
        fbck: ScalarSmart { -1 }
      ),
      matcher: HasValue(2)
    ).affirm()
  }
  
  func testReturnsFirstValueWithIntegerFallback() {
    Assertion(
      message: "Returns first value with integer fallback",
      test: FirstOf(
        src: IterableOfInts(2,1,0),
        fbck: -1
      ),
      matcher: HasValue(2)
    ).affirm()
  }
  
  func testReturnsFallbackWhenIterableIsEmpty() {
    Assertion(
      message: "Returns fallback when iterable empty",
      test: FirstOf(
        src: IterableOf(),
        fbck: ScalarSmart { -1 }
      ),
      matcher: HasValue(-1)
    ).affirm()
  }
}
