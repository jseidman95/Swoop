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

//  func testConvertIntsToIterable() {
//    XCTAssertTrue(
//      IterableOf(1,2,5,9)
//    )
//  }
}
