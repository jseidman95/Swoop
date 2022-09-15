//
//  HasValuesMatchingTests.swift
//  
//
//  Created by Jesse Seidman on 9/9/22.
//

import XCTest
import Swoop
@testable import Matchers

final class HasValuesMatchingTests: XCTestCase {

  func testMatches() {
    Assertion(
      message: "matches with values matching func",
      test: HasValuesMatching(
        fnc: FuncSmart { input in
          input == 4
        }
      ),
      matcher: Matches(IterableOf(1,2,3,4,5,6))
    ).affirm()
  }

  func testMismatches() {
    Assertion(
      message: "matches with values matching func",
      test: HasValuesMatching(
        fnc: FuncSmart { input in
          input == 10
        }
      ),
      matcher: Mismatches(IterableOf(1,2,3,4,5,6))
    ).affirm()
  }
}
