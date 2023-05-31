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
  
  func testCutTextInvalidEnd() throws {
    
    Assertion(
      message: "Throws for invalid end",
      test: ScalarSmart {
        try Sub(
          text: TextOf("hello world"),
          start: 2,
          final: 50
        ).asString()
      },
      matcher: Throws(
        msg: "finish: 50 must be less than count: 11",
        type: StandardException.Type.self
      )
    ).affirm()
  }
  
  func testCutTextThrowsForInvalidStart() {

    Assertion(
      message: "Throw for invalid start",
      test: ScalarSmart {
        try Sub(
          text: TextOf("hello world"),
          start: -1,
          final: 50
        ).asString()
      },
      matcher: Throws(
        msg: "begin must be greater than zero",
        type: StandardException.Type.self
      )
    ).affirm()
  }
  
  func testBeginCantBeGreaterThanEnd() {
    Assertion(
      message: "Throw for invalid beginning and end",
      test: ScalarSmart {
        try Sub(
          text: TextOf("hello world"),
          start: 3,
          final: 2
        ).asString()
      },
      matcher: Throws(
        msg: "begin: 3 must be less than finish: 2",
        type: StandardException.Type.self
      )
    ).affirm()
  }
}
