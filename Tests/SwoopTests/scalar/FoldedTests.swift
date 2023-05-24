//
//  FoldedTests.swift
//
//
//  Created by Jesse Seidman on 5/23/23.
//

import XCTest
import Matchers
@testable import Swoop

class FoldedTests: XCTestCase {
  
  func testFoldIterable() throws {
    Assertion(
      message: "Must fold elements in iterable",
      test: try Folded(
        input: 0,
        fnc: BiFuncSmart { $0 + $1 },
        iterable: IterableOf(1,2,3,4,5)
      ).value(),
      matcher: IsEqual(value: 15)
    ).affirm()
  }
  
  func testFoldVarArgs() throws {
    Assertion(
      message: "Must fold elements in iterable",
      test: try Folded(
        input: 0,
        fnc: BiFuncSmart { $0 + $1 },
        1,2,3,4,5
      ).value(),
      matcher: IsEqual(value: 15)
    ).affirm()
  }
}
