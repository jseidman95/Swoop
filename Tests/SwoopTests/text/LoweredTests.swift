//
//  LoweredTests.swift
//
//
//  Created by Jesse Seidman on 9/18/22.
//

import XCTest
import Matchers
@testable import Swoop

class LoweredTests: XCTestCase {
  
  func testConvertsToLowercase() throws {
    Assertion(
      message: "Lower case text",
      test: try Lowered(TextOf("BOO RADLEY")).asString(),
      matcher: HasValue("boo radley")
    ).affirm()
  }
  
  func testConvertsMixedStringToLowercase() throws {
    Assertion(
      message: "Lower case text of mixed string",
      test: try Lowered(TextOf("WoRLd!")).asString(),
      matcher: HasValue("world!")
    ).affirm()
  }
}
