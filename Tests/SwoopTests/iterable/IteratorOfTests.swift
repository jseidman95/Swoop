//
//  IteratorOfTests.swift
//  
//
//  Created by Jesse Seidman on 8/18/22.
//

import XCTest
@testable import Swoop

class IteratorOfTests: XCTestCase {

  func testEmptyIteratorDoesNotHaveNext() {
    XCTAssertTrue(
      IteratorOf<Any>().hasNext() != true
    )
  }

  func testNonEmptyIteratorDoesNotHaveNext() {
    let i = IteratorOf(1,2,3)

    while i.hasNext() {
      _ = i.next()
    }

    XCTAssertTrue(
      i.hasNext() != true
    )
  }

  func testConvertStringsToIterator() {
    IterableOf(
      iterator: IteratorOf("a", "b", "c")
    )
  }
}
