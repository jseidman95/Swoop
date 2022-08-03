//
//  FalseTests.swift
//  
//
//  Created by Jesse Seidman on 8/1/22.
//

import XCTest
@testable import Swoop

class FalseTests: XCTestCase {

  func testValue() throws {
    XCTAssertEqual(False().value(), false)
  }
}
