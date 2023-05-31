//
//  CapitalizedTests.swift
//
//
//  Created by Jesse Seidman on 5/29/23.
//

import XCTest
import Matchers
@testable import Swoop

class ConcatenatedTests: XCTestCase {

  func testConcatSingle() throws {
    Assertion(
      message: "Concatenate to a single text",
      test: Concatenated(
        TextOf("Bar")
      ),
      matcher: IsText(string: "Bar")
    ).affirm()
  }
  
  func testConcatMultiple() throws {
    Assertion(
      message: "Concatenate multiple texts",
      test: Concatenated(
        TextOf("Foo"),
        TextOf("Bar"),
        TextOf("Baz")
      ),
      matcher: IsText(string: "FooBarBaz")
    ).affirm()
  }
  
  func testConcatIterable() throws {
    Assertion(
      message: "Concatenate multiple texts",
      test: Concatenated(
        txts: IterableOf(
          TextOf("foo"),
          TextOf("bar")
        )
      ),
      matcher: IsText(string: "foobar")
    ).affirm()
  }
  
  func testConcatString() throws {
    Assertion(
      message: "Concatenate multiple strings",
      test: Concatenated(
        "foo",
        "bar"
      ),
      matcher: IsText(string: "foobar")
    ).affirm()
  }
}
