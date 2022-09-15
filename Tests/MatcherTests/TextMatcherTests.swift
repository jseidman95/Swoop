//
//  TextMatcherTests.swift
//  
//
//  Created by Jesse Seidman on 9/9/22.
//

import Foundation

import XCTest
import Swoop
@testable import Matchers

final class TextMatcherTests: XCTestCase {

  func testMatchesAStringInput() {
    let string = "dajkdfs"
    Assertion(
      message: "must match on an input that can be read only once",
      test: TextMatcher(matcher: IsEqual(value: string)),
      matcher: Matches(TextOf(string))
    ).affirm()
  }

  func testMismatches() {
    Assertion(
      message: "mismatches text without the prefix",
      test: TextMatcher(
        text: TextOf("!"),
        f: BiFuncSmart { act, txt in
          act.starts(with: txt)
        },
        expected: "Text starting with"
      ),
      matcher: Mismatches(
        TextOf("hdjflksadjkl")
      )
    ).affirm()
  }

  func testMatchesFromFunc() {
    Assertion(
      message: "must match with function",
      test: TextMatcher(
        text: TextOf("I am"),
        f: BiFuncSmart { act, txt in
          act.starts(with: txt)
        },
        expected: "Text starts with"
      ),
      matcher: Matches(TextOf("I am slim shady"))
    ).affirm()
  }
}
