//
//  AbbreviatedTests.swift
//
//
//  Created by Jesse Seidman on 9/18/22.
//

import XCTest
import Matchers
@testable import Swoop

class AbbreviatedTests: XCTestCase {
  
  func testAbbreviatesEmptyText() throws {
    let msg = ""
    Assertion(
      message: "Abbreviate empty text",
      test: Abbreviated(msg, max: 8),
      matcher: IsText(string: msg)
    ).affirm()
  }
  
  func testAbbreviatesText() throws {
    Assertion(
      message: "Abbreviate text",
      test: Abbreviated("hello world", max: 8),
      matcher: IsText(string: "hello...")
    ).affirm()
  }
  
  func testAbbreviatesOneCharSmaller() throws {
    Assertion(
      message: "Abbreviate text one character smaller",
      test: Abbreviated("oo programming", max: 10),
      matcher: IsText(string: "oo prog...")
    ).affirm()
  }
  
  func testAbbreviatesWithSameLength() throws {
    let msg = "elegant objects"
    Assertion(
      message: "Abbreviates a text with same length",
      test: Abbreviated(msg, max: 15),
      matcher: IsText(string: msg)
    ).affirm()
  }
  
  func testAbbreviatesOneCharBigger() throws {
    let msg = "the old mcdonald"
    Assertion(
      message: "Abbreviates a text with one char bigger",
      test: Abbreviated(msg, max: 17),
      matcher: IsText(string: msg)
    ).affirm()
  }
  
  func testAbbreviatesTwoCharsBigger() throws {
    let msg = "hi everybody!"
    Assertion(
      message: "Must abbreviate a text two chars bigger",
      test: Abbreviated(msg, max: 57),
      matcher: IsText(string: msg)
    ).affirm()
  }
  
  func testAbbreviatesTextWithWidthBiggerThanLength() throws {
    let msg = "cactoos framework"
    Assertion(
      message: "Must abbreviate a text with width bigger than length",
      test: Abbreviated(msg, max: 50),
      matcher: IsText(string: msg)
    ).affirm()
  }
  
  func testAbbreviatesTextBiggerThanDefaultMaxWidth() throws {
    Assertion(
      message: "Must abbreviate a text bigger than default max width",
      test: Abbreviated("The quick brown fox jumps over the lazy black dog and after that returned to the cave"),
      matcher: IsText(string: "The quick brown fox jumps over the lazy black dog and after that returned to ...")
    ).affirm()
  }
  
  func testAbbreviatesTextThatChanges() throws {
    var first = true
    let text = TextSmart {
      let result: String
      if first {
        result = "The quick brown fox jumps"
      } else {
        result = "The lazy black dog"
      }
      return result
    }
    
    Assertion(
      message: "Must abbreviate a text that changes",
      test: Abbreviated(text, max: 15),
      matcher: IsText(string: "The quick br...")
    ).affirm()
    
    first = false
    
    Assertion(
      message: "Must abbreviate a text that changes",
      test: Abbreviated(text, max: 15),
      matcher: IsText(string: "The lazy bla...")
    ).affirm()
  }
}
