//
//  FoldedTests.swift
//
//
//  Created by Jesse Seidman on 5/24/23.
//

import XCTest
import Matchers
@testable import Swoop

class HighestOfTests: XCTestCase {
  
  func testFailsForEmptyIterable() throws {
    Assertion(
      message: "Fails for empty iterable",
      test: HighestOf(iterable: IterableOf(arr: [Int]())),
      matcher: Throws(
        msg: "Can't find first element in empty iterable",
        type: StandardException.Type.self
      )
    ).affirm()
  }
  
  func testReturnsElementIfTheresOnlyOne() {
    Assertion(
      message: "Returns single element",
      test: HighestOf(iterable: IterableOf(10)),
      matcher: HasValue(10)
    ).affirm()
  }
  
  func testReturnsHighestScalar() throws {
    Assertion(
      message: "Returns highest scalar",
      test: try HighestOf(
        ScalarSmart {  10 },
        ScalarSmart { 0 },
        ScalarSmart { -1 },
        ScalarSmart { 2 }
      ).value(),
      matcher: IsEqual(value: 10)
    ).affirm()
  }
  
  func testReturnsHighestInteger() throws {
    Assertion(
      message: "Returns highest int",
      test: try HighestOf(10, 0, -1, 2).value(),
      matcher: IsEqual(value: 10)
    ).affirm()
  }
  
  func testReturnsHighestNegativeInteger() throws {
    Assertion(
      message: "Returns highest negative int",
      test: try HighestOf(-272, -10, -134, -101).value(),
      matcher: IsEqual(value: -10)
    ).affirm()
  }
  
  func testReturnsHighestString() throws {
    Assertion(
      message: "Returns string with greatest value",
      test: try HighestOf("A", "B", "C").value(),
      matcher: IsEqual(value: "C")
    ).affirm()
  }
}
