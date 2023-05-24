//
//  FlattenedTests.swift
//
//
//  Created by Jesse Seidman on 5/23/23.
//

import XCTest
import Matchers
@testable import Swoop

class FlattenedTests: XCTestCase {
  
  func testFlattens() {
    Assertion(
      message: "should flatten scalars",
      test: Flattened(
        ScalarSmart {
          ScalarSmart {
            true
          }
        }
      ),
      matcher: HasValue(true)
    ).affirm()
  }
}
