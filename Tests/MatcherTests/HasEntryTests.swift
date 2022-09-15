//
//  HasEntryTests.swift
//  
//
//  Created by Jesse Seidman on 9/6/22.
//

import XCTest
import Swoop
@testable import Matchers

final class HasEntryTests: XCTestCase {

  func testMatch() {
    Assertion(
      message: "matches a valid entry in the map",
      test: HasEntry(key: "bob", val: 1),
      matcher: Matches(["bob": 1])
    ).affirm()
  }

  func testDoesNotMatchMissingEntry() {
    Assertion(
      message: "matches a valid entry in the map",
      test: HasEntry(key: "bob", val: 1),
      matcher: Mismatches(["fred": 1])
    ).affirm()
  }

  func testDoesNotMatchDifferentValue() {
    Assertion(
      message: "matches a valid entry in the map",
      test: HasEntry(key: "bob", val: 1),
      matcher: Mismatches(["bob": 2])
    ).affirm()
  }
}
