//
//  ThrowsTests.swift
//
//
//  Created by Jesse Seidman on 5/23/23.
//

import XCTest
import Swoop
@testable import Matchers

final class ThrowsTests: XCTestCase {

  func testMatchesFunc() {
    Assertion(
      message: "matches scalar that throws the expected exception",
      test: Throws(msg: "No objects found", type: StandardException.Type.self),
      matcher: Matches(
        ScalarOf(
          fnc: FuncSmart { _ in
            throw StandardException("No objects found")
          },
          input: Constant("doesnt matter")
        )
      )
    ).affirm()
  }
  
  func testMatchesNegative() {
    Assertion(
      message: "mismatches scalar that doesn't throw any exception",
      test: Throws(msg: "illegal arg", type: StandardException.Type.self),
      matcher: Mismatches(
        ScalarOf(
          fnc: FuncSmart { _ in
            "no exception"
          },
          input: Constant("nothin")
        )
      )
    ).affirm()
  }
}

extension ThrowsTests {
  
  class ExceptionSubtype: Exception, Error {
    func description() -> String {
      return ""
    }
  }
}
