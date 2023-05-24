//
//  EqualsTests.swift
//
//
//  Created by Jesse Seidman on 5/23/23.
//

import XCTest
import Matchers
@testable import Swoop

class EqualsTests: XCTestCase {
  
  func testCompareEquals() {
    Assertion(
      message: "Compare if two integers are equal",
      test: Equals(1,1),
      matcher: HasValue(true)
    ).affirm()
  }
  
  func testCompareNotEqual() {
    Assertion(
      message: "Compare if two integers are not equal",
      test: Equals(1,2),
      matcher: HasValue(false)
    ).affirm()
  }
  
  func testCompareEqualsTextScalar() {
    let str = "hello"
    Assertion(
      message: "Compare if two strings are equal",
      test: Equals(str,str),
      matcher: HasValue(true)
    ).affirm()
  }
  
  func testCompareNotEqualsTextScalar() {
    Assertion(
      message: "Compare if two strings are not equal",
      test: Equals("hello","hero"),
      matcher: HasValue(false)
    ).affirm()
  }
  
  func testCompareText() {
    Assertion(
      message: "Compare if two comparable texts are equal",
      test: Equals(
        EquatableText(TextOf("hello")),
        EquatableText(TextOf("hello"))
      ),
      matcher: HasValue(true)
    ).affirm()
  }
}
