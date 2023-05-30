//
//  ReducedIntoTests.swift
//
//
//  Created by Jesse Seidman on 5/29/23.
//

import XCTest
import Matchers
@testable import Swoop

class ReducedIntoTests: XCTestCase {
  
  func testThrowsErrorForEmptyIterable() {
    Assertion(
      message: "should throw standard exception because no element exists",
      test: ReducedInto<Any, Any>(
        initial: 1,
        IterableOf(arr: []),
        closure: { x, y in return x }
      ),
      matcher: Throws(
        msg: "Can't find first element in empty iterable",
        type: StandardException.Type.self
      )
    ).affirm()
  }

  func testFindSingleItemIterable() {
    Assertion(
      message: "Find the single",
      test: ReducedInto(
        initial: 5,
        IterableOf(arr: [4]),
        function: BiFuncSmart { x,y in
          return x + y
        }
      ),
      matcher: HasValue(9)
    ).affirm()
  }
}
