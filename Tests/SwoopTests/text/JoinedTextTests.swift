//
//  JoinedTextTests.swift
//
//
//  Created by Jesse Seidman on 5/29/23.
//

import XCTest
import Matchers
@testable import Swoop

class JoinedTextTests: XCTestCase {
  
  func testJoinStrings() throws {
    Assertion(
      message: "joins text",
      test: EquatableText(
        JoinedText(
          delimit: " ",
          TextOf("Hello"),
          TextOf("World!")
        )
      ),
      matcher: HasString("Hello World!")
    ).affirm()
  }
  
  func testDoesNotJoinSingleString() throws {
    Assertion(
      message: "doesn't join single string",
      test: EquatableText(
        JoinedText(
          delimit: " ",
          TextOf("Hello")
        )
      ),
      matcher: HasString("Hello")
    ).affirm()
  }
  
  func testReturnsEmptyForEmpty() throws {
    Assertion(
      message: "doesn't join empty string",
      test: EquatableText(
        JoinedText(
          delimit: TextOf(" "),
          texts: IterableOf(arr: [any Text]())
        )
      ),
      matcher: IsEqual(value: EquatableText(TextOf("")))
    ).affirm()
  }
}
