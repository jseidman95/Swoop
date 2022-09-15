//
//  HasSizeTests.swift
//  
//
//  Created by Jesse Seidman on 9/6/22.
//

import XCTest
import Swoop
@testable import Matchers

final class HasSizeTests: XCTestCase {

  func testMatchesSize() {
    Assertion(
      message: "matches the size of the iterable",
      test: HasSize(2),
      matcher: Matches(IterableOf(1,2))
    ).affirm()
  }

  func testMatchesEmptyCollection() {
    Assertion(
      message: "matches zero",
      test: HasSize(0),
      matcher: Matches(IterableOf<Int>())
    ).affirm()
  }

  func testMismatch() {
    Assertion(
      message: "mismatches for wronog size list",
      test: HasSize(3),
      matcher: Mismatches(IterableOf(1,2,4,5))
    ).affirm()
  }
}
