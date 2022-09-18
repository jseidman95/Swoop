//
//  TrueTests.swift
//  
//
//  Created by Jesse Seidman on 8/1/22.
//

import XCTest
import Matchers
@testable import Swoop

class TrueTests: XCTestCase {

  func testValue() throws {
    Assertion(
      message: "Should give the value true",
      test: True().value(),
      matcher: IsEqual(value: true)
    ).affirm()
  }
}
