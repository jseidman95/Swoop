//
//  XorTests.swift
//  
//
//  Created by Jesse Seidman on 8/7/22.
//

import XCTest
@testable import Swoop

class XorTests: XCTestCase {

  func testFalseTrue() throws {
    XCTAssertEqual(
      try Xor(
        False(),
        True()
      ).value(),
      true
    )
  }
  
  func testTrueFalse() throws {
    XCTAssertEqual(
      try Xor(
        True(),
        False()
      ).value(),
      true
    )
  }
  
  func testBothTrue() throws {
    XCTAssertEqual(
      try Or(
        True(),
        True()
      ).value(),
      true
    )
  }
  
  func testBothFalse() throws {
    XCTAssertEqual(
      try Or(
        False(),
        False()
      ).value(),
      false
    )
  }
}

