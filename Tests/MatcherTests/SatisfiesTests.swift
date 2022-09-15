//
//  SatisfiesTests.swift
//  
//
//  Created by Jesse Seidman on 9/11/22.
//

import XCTest
import Swoop
@testable import Matchers

final class SatisfiesTests: XCTestCase {

  func testExampleFunc() {
    Assertion(
      message: "confirm the satisfies with matches",
      test: Satisfies { x in
        return x > 0
      },
      matcher: Matches(1)
    ).affirm()
  }

  func testMismatchesFunc() {
    Assertion(
      message: "confirm the mismatch",
      test: Satisfies { x in
        return x > 1
      },
      matcher: Mismatches(0)
    ).affirm()
  }
}
