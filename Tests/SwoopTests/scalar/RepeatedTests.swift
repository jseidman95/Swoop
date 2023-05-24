//
//  RepeatedTests.swift
//
//
//  Created by Jesse Seidman on 5/24/23.
//

import XCTest
import Matchers
@testable import Swoop

class RepeatedTests: XCTestCase {

    func testRunsMultipleTimes() throws {
        var int = 0
        Assertion(
          message: "Must run scalar 3 times",
          test: try Repeated(
              scalar: ScalarSmart {
                  int += 1
                  return int
              },
              times: 3
          ).value(),
          matcher: IsEqual(value: 3)
        ).affirm()
    }
    
    func testThrowsIfZero() throws {
        Assertion(
          message: "Must throws an exception if number of repetitions not be at least 1",
          test: try ScalarSmart {
              Repeated(
                  scalar: ScalarSmart {
                      throw StandardException("this should fail")
                  },
                  times: 0
              )
          }.value(),
          matcher: Throws(
            msg: "The number of repetitions must be at least 1",
            type: StandardException.Type.self
          )
        ).affirm()
    }
}
