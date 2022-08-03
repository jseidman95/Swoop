//
//  OrTests.swift
//  
//
//  Created by Jesse Seidman on 8/1/22.
//

import XCTest
@testable import Swoop

class OrTests: XCTestCase {

  func testAllFalse() throws {
    XCTAssertEqual(
      try Or(
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
      try Or(
        False(),
        False(),
        False(),
        True()
      ).value(),
      true
    )
  }
}

