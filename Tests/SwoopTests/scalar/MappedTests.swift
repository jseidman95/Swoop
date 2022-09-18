//
//  MappedTests.swift
//  
//
//  Created by Jesse Seidman on 9/18/22.
//

import XCTest
import Matchers
@testable import Swoop

class MappedTests: XCTestCase {
  
  func testTransformsScalar() {
    Assertion(
      message: "Transforms scalar text to uppercase",
      test: Mapped(
        fnc: FuncSmart { inp in
          Upper(TextOf(inp))
        },
        scalar: ScalarSmart { return "hello" }
      ),
      matcher: MatcherOf(
        match: FuncSmart { inp in
          return try inp.value().asString() == "HELLO"
        },
        description: TextSmart { "Check text value is correct" },
        mismatch: FuncSmart { inp in
          "\(inp) did not equal HELLO"
        }
      )
    ).affirm()
  }
}
