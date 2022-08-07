//
//  JoinedTests.swift
//  
//
//  Created by Jesse Seidman on 8/7/22.
//

import XCTest
@testable import Swoop

class JoinedTests: XCTestCase {

  func testJoin() throws {
    XCTAssertEqual(
      try LengthOf(
        Joined(
          IterableOf(
            IterableOf(1,2,3,4,5,6),
            IterableOf(7,8)
          )
        )
      ).value(),
      8
    )
  }
}
