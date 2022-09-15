//
//  IteratorOfTests.swift
//  
//
//  Created by Jesse Seidman on 8/18/22.
//

import XCTest
import Matchers
@testable import Swoop

class IteratorOfTests: XCTestCase {

  func testEmptyIteratorDoesNotHaveNext() {
    Assertion(
      message: "Must create empty iterator",
      test: IteratorOf<Any>().hasNext(),
      matcher: IsNot(IsTrue())
    ).affirm()
  }

  func testNonEmptyIteratorDoesNotHaveNext() {
    let i = IteratorOf(1,2,3)

    while i.hasNext() {
      _ = i.next()
    }

    Assertion(
      message: "Must create non empty iterator",
      test: i.hasNext(),
      matcher: IsNot(IsTrue())
    ).affirm()
  }

  func testConvertStringsToIterator() {
    Assertion(
      message: "Must create an iterator of strings",
      test: IterableOf(
        iterator: IteratorOf("a", "b", "c")
      ),
      matcher: HasValues("a", "b", "c")
    ).affirm()

  }
}
