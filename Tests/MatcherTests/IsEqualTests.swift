//
//  IsEqualTests.swift
//  
//
//  Created by Jesse Seidman on 9/9/22.
//

import XCTest
import Swoop
@testable import Matchers

final class IsEqualTests: XCTestCase {

  func testMatches() {
    Assertion(
      message: "matches and confirms equality",
      test: IsEqual(value: 3),
      matcher: Matches(3)
    ).affirm()
  }

  func testMismatches() {
    Assertion(
      message: "matches and confirms equality",
      test: IsEqual(value: 3),
      matcher: Mismatches(6)
    ).affirm()
  }
}
