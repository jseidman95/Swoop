//
//  IsTrueTests.swift
//  
//
//  Created by Jesse Seidman on 9/9/22.
//

import XCTest
import Swoop
@testable import Matchers

final class IsTrueTests: XCTestCase {

  func testMatches() {
    Assertion(
      message: "confirm is true",
      test: IsTrue(),
      matcher: Matches(true)
    ).affirm()
  }

  func testMismatches() {
    Assertion(
      message: "confirm not true",
      test: IsTrue(),
      matcher: Mismatches(false)
    ).affirm()
  }
}
