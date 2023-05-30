//
//  SubTests.swift
//
//
//  Created by Jesse Seidman on 5/29/23.
//

import XCTest
import Matchers
@testable import Swoop

class SubTests: XCTestCase {

  func testCutTextWithStartAndEnd() throws {
    Assertion(
      message: "Cut a text with start and end",
      test: Sub(
        text: TextOf("hello world"),
        start: 2,
        final: 10
      ),
      matcher: HasString(TextOf("llo world"))
    ).affirm()
  }
  
  func testCutTextWithStartOnly() {
    
    Assertion(
      message: "Cut a text with start and end",
      test: Sub(
        text: TextOf("hello world"),
        start: 2
      ),
      matcher: HasString(TextOf("llo world"))
    ).affirm()
  }
  
  func testCutTextAdjustsEnd() {
    
    Assertion(
      message: "Cut a text for end",
      test: Sub(
        text: TextOf("hello world"),
        start: 2,
        final: 50
      ),
      matcher: HasString(TextOf("llo world"))
    ).affirm()
  }
  
  func testCutTextAdjustsStart() {
    
    Assertion(
      message: "Cut a text for start",
      test: Sub(
        text: TextOf("hello world"),
        start: -1,
        final: 50
      ),
      matcher: HasString(TextOf("llo world"))
    ).affirm()
  }
}
