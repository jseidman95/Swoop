//
//  ReducedTests.swift
//  
//
//  Created by Jesse Seidman on 8/2/22.
//

import XCTest
@testable import Swoop

class ReducedTests: XCTestCase {

  func testThrowsErrorForEmptyIterable() throws {
    XCTAssertThrowsError(
      try Reduced(iterable: []) { x,y in
        return x
      }.value() as String
    )
  }

  func testReducesToTheSingleItem() throws {
    XCTAssert(
      try Reduced(
        1,
        closure: { first, second in
          return first
        }
      ).value() == 1
    )
  }

  func testReducesToFirstInTheList() throws {
    XCTAssert(
      try Reduced(
        "Apple",
        "Banana",
        "Orange",
        closure: { first, second in
          return first
        }
      ).value() == "Apple"
    )
  }

  func testReducesToLastInTheList() throws {
    XCTAssert(
      try Reduced(
        "A",
        "B",
        "O",
        closure: { first, second in
          return second
        }
      ).value() == "O"
    )
  }
}
