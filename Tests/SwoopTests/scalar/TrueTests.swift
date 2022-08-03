//
//  TrueTests.swift
//  
//
//  Created by Jesse Seidman on 8/1/22.
//

import XCTest
@testable import Swoop

class TrueTests: XCTestCase {

  func testValue() throws {
    XCTAssertEqual(True().value(), true)
  }
}
