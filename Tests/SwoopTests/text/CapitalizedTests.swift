//
//  CapitalizedTests.swift
//
//
//  Created by Jesse Seidman on 5/29/23.
//

import XCTest
import Matchers
@testable import Swoop

class CapitalizedTests: XCTestCase {

  func testCapitalizedEmpty() throws {
    Assertion(
      message: "Must return empty string",
      test: EquatableText(
        Capitalized(TextOf(""))
      ),
      matcher: IsEqual(value: EquatableText(TextOf("")))
    ).affirm()
  }
  
  func testCapitalizedSingleLetter() throws {
    Assertion(
      message: "Must return capitalized letter",
      test: Capitalized(TextOf("f")),
      matcher: IsText(string: "F")
    ).affirm()
  }
  
  func testCapitalizedSingleUppercasedLetter() throws {
    Assertion(
      message: "Must return capitalized letter",
      test: Capitalized(TextOf("F")),
      matcher: IsText(string: "F")
    ).affirm()
  }
  
  func testCapitalizedWord() throws {
    Assertion(
      message: "Must return capitalized word",
      test: Capitalized(TextOf("Bar")),
      matcher: IsText(string: "Bar")
    ).affirm()
  }
  
  func testCapitalizeTextStartingWithLowerCaseCharacter() throws {
    Assertion(
      message: "Must capitalize text starting with lower case character",
      test: Capitalized(TextOf("xyz")),
      matcher: IsText(string: "Xyz")
    ).affirm()
  }
}
