//
//  IterableOfTests.swift
//  
//
//  Created by Jesse Seidman on 8/4/22.
//

import XCTest
@testable import Swoop

class IterableOfTests: XCTestCase {

  func testConvertsScalarsToIterable() {
    XCTAssertEqual(
      try LengthOf(
        IterableOf("a", "b", "c")
      ).value(),
      3
    )
  }

  func testConvertArrayOfIntsToIterable() {
    let i = IterableOf(1,2,0,2).iterator()
    var hasInt = false
    while i.hasNext() {
      if i.next() == 0 {
        hasInt = true
      }
    }

    XCTAssertTrue(hasInt)
  }

  func testConvertObjectsToIterable() {
    XCTAssertEqual(
      try LengthOf(
        IterableOf(
          TextOf
        )
      ).value(),
      3
    )
  }

//  @Test
//      void convertsObjectsToIterable() throws Exception {
//          new Assertion<>(
//              "Must convert objects to iterable",
//              new LengthOf(
//                  new IterableOf<>(
//                      new TextOf("a"), new TextOf("b"), new TextOf("c")
//                  )
//              ),
//              new HasValue<>(3L)
//          ).affirm();
//      }
}
