//
//  HasValuesTest.swift
//  
//
//  Created by Jesse Seidman on 8/18/22.
//

import XCTest
import Swoop
@testable import Matchers

final class HasValuesTest: XCTestCase {

  func testMatches() {
    Assertion(
      message: "matches iterable containing elements",
      test: HasValues(1),
      matcher: Matches(ListOf(1,2,3,4))
    ).affirm()
  }

  func testMatchSafely() {
    Assertion(
      message: "matches iterable containing the given tuple",
      test: HasValues("a", "b"),
      matcher: Matches(ListOf("a", "b", "c", "e"))
    ).affirm()
  }

  func testMismatches() {
    Assertion(
      message: "doesn't affirm incorrect inputs",
      test: HasValues(5),
      matcher: Mismatches(
        ListOf(1,2,3)
      )
    ).affirm()
  }
}
