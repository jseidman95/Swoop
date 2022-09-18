//
//  UpperTests.swift
//  
//
//  Created by Jesse Seidman on 9/18/22.
//

import XCTest
import Matchers
@testable import Swoop

class UpperTests: XCTestCase {
  
  func testConvertsToUppercase() throws {
    Assertion(
      message: "Must transform text to all uppercase",
      test: try Upper(TextOf("boo radley")).asString(),
      matcher: HasValue("BOO RADLEY")
    ).affirm()
  }
}
