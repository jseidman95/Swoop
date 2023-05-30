//
//  MappedTextTests.swift
//
//
//  Created by Jesse Seidman on 5/29/23.
//

import XCTest
import Matchers
@testable import Swoop

class MappedTextTests: XCTestCase {
  
  
  func testResultShouldBeEqual() throws {
    Assertion(
      message: "Must equal same text",
      test: EquatableText(
        MappedText(
          fnc: FuncSmart { x in
            return try x.value().uppercased()
          },
          text: TextOf("hi")
        )
      ),
      matcher: IsEqual(value: EquatableText(TextOf("HI")))
    ).affirm()
  }
}
