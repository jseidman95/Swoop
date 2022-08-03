//
//  AndTests.swift
//  
//
//  Created by Jesse Seidman on 8/2/22.
//

import XCTest
@testable import Swoop

class AndTests: XCTestCase {

  func testAllFalse() throws {
    XCTAssertEqual(
      try And(
        False(),
        False(),
        False(),
        False()
      ).value(),
      false
    )
  }

  func testOneTrue() throws {
    XCTAssertEqual(
      try And(
        False(),
        False(),
        False(),
        True()
      ).value(),
      false
    )
  }

  func testAllTrue() throws {
    XCTAssertEqual(
      try And(
        True(),
        True(),
        True(),
        True()
      ).value(),
      true
    )
  }

  func testOneFalse() throws {
    XCTAssertEqual(
      try And(
        False(),
        True(),
        True(),
        True()
      ).value(),
      false
    )
  }
}
