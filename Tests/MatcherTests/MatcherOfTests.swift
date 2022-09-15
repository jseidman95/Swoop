//
//  MatcherOfTests.swift
//  
//
//  Created by Jesse Seidman on 9/9/22.
//

import XCTest
import Swoop
@testable import Matchers

final class MatcherOfTests: XCTestCase {

  func testMatchesFunc() {
    Assertion(
      message: "matches when arg satisfies the predicate",
      test: MatcherOf(
        match: FuncSmart { x in
          return x > 5
        },
        description: TextSmart { "Must be > 5" },
        mismatch: FuncSmart {
          "\($0)"
        }
      ),
      matcher: Matches(10)
    ).affirm()
  }


  func testMismatchesFunc() {
    Assertion(
      message: "matches when arg satisfies the predicate",
      test: MatcherOf(
        match: FuncSmart { x in
          return x > 7
        },
        description: TextSmart { "Must be > 7" },
        mismatch: FuncSmart {
          "\($0)"
        }
      ),
      matcher: Mismatches(1)
    ).affirm()
  }
}
