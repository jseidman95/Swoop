//
//  ItemAtTests.swift
//
//
//  Created by Jesse Seidman on 5/24/23.
//

import XCTest
import Matchers
@testable import Swoop

class ItemAtTests: XCTestCase {
  
  func testGetItemAtPosition() throws {
    Assertion(
      message: "take the item at the position in the iterable",
      test: ItemAt(
        position: 1,
        iterable: IterableOf(1,2,3)
      ),
      matcher: HasValue(2)
    ).affirm()
  }
  
  func testFallbackWorks() {
    Assertion(
      message: "fallback to default",
      test: ItemAt(
        position: 1,
        fallback: 5,
        iterable: IterableOf(arr: [])
      ),
      matcher: HasValue(5)
    ).affirm()
  }
  
  func testFailsForNegativePosition() {
    Assertion(
      message: "fallback to default",
      test: ItemAt(
        position: -1,
        iterable: IterableOf(1,2,3)
      ),
      matcher: Throws(
        msg: "Position must be non negative -1",
        type: StandardException.Type.self
      )
    ).affirm()
  }
  
  func testFailsForPositionGreaterThanLength() {
    Assertion(
      message: "Must fail for position greater than the length",
      test: ItemAt(
        position: 4,
        iterable: IterableOf(1,2,3)
      ),
      matcher: Throws(
        msg: "The iterable doesn't have the position 4",
        type: StandardException.Type.self
      )
    ).affirm()
  }
}
