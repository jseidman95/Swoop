//
//  LengthOfTests.swift
//  
//
//  Created by Jesse Seidman on 9/18/22.
//

import XCTest
import Matchers
@testable import Swoop

class LengthOfTests: XCTestCase {
  
  func testReturnsCorrectLength() {
    Assertion(
      message: "returns the correct length of the iterable",
      test: LengthOf(IterableOf(1,2,3,4,5,6)),
      matcher: HasValue(6)
    ).affirm()
  }
  
  func testReturnsEmptyLength() {
    Assertion(
      message: "returns zero for empty Iterable",
      test: LengthOf(IterableOf<Any>()),
      matcher: HasValue(0)
    ).affirm()
  }
}
