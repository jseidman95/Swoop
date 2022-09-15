//
//  IterableOfTests.swift
//  
//
//  Created by Jesse Seidman on 8/4/22.
//

import XCTest
import Matchers
@testable import Swoop

class IterableOfTests: XCTestCase {

  func testConvertsScalarsToIterable() {
    Assertion(
      message: "Converts scalars to iterable",
      test: try! LengthOf(
        IterableOf("a", "b", "c")
      ),
      matcher: HasValue(3)
    ).affirm()
  }

  func testConvertArrayOfIntsToIterable() {
    Assertion(
      message: "Converts ints to iterable",
      test: IterableOf(
        1,2,0,2
      ),
      matcher: HasValues(0)
    ).affirm()
  }

  func testConvertObjectsToIterable() {
    Assertion(
      message: "Converts ints to iterable",
      test: try! LengthOf(
        IterableOf(TextOf("a"), TextOf("b"), TextOf("c"))
      ),
      matcher: HasValue(3)
    ).affirm()
  }
}
