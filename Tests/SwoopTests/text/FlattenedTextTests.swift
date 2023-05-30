//
//  FlattenedTextTests.swift
//
//
//  Created by Jesse Seidman on 5/29/23.
//

import XCTest
import Matchers
@testable import Swoop

class FlattenedTextTests: XCTestCase {
  
  
  func testFlatten() throws {
    let msg = "txt"
    Assertion(
      message: "Must flatten",
      test: FlattenedText(
        text: TextOf(msg)
      ),
      matcher: IsText(string: msg)
    ).affirm()
  }
  
  func testFlattensTextThatChanges() throws {
    let txt1 = TextOf("txt1")
    let txt2 = TextOf("txt2")
    var isFirst = true
    let text = TextSmart {
      return try (isFirst ? txt1 : txt2).asString()
    }
    
    Assertion(
      message: "Must flatten a scalar that changes",
      test: FlattenedText(
        text: text
      ),
      matcher: IsText(string: "txt1")
    ).affirm()
    
    isFirst = false
    
    Assertion(
      message: "Must flatten a scalar that changes",
      test: FlattenedText(
        text: text
      ),
      matcher: IsText(string: "txt2")
    ).affirm()
  }
}
