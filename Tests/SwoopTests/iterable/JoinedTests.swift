//
//  JoinedTests.swift
//  
//
//  Created by Jesse Seidman on 8/7/22.
//

import XCTest
@testable import Swoop

class JoinedTests: XCTestCase {

  func testJoinLists() throws {
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
  
  func testJoinSingleItem() throws {
    XCTAssertEqual(
      try LengthOf(
        Joined(
          item: 7,
          items: IterableOf(5,6)
        )
      ).value(),
      3
    )
  }
  
  func testJoinEmptyArrayWithSingleItemArray() throws {
    XCTAssertEqual(
      try LengthOf(
        Joined(
          IterableOf(
            IterableOf(),
            IterableOf(1)
          )
        )
      ).value(),
      1
    )
  }
  
  func testJoinEmptyArrayWithSingleItemArrayReversedOrder() throws {
    XCTAssertEqual(
      try LengthOf(
        Joined(
          IterableOf(
            IterableOf(1),
            IterableOf()
          )
        )
      ).value(),
      1
    )
  }
  
  func testJoinWithOneEmptyList() throws {
    XCTAssertEqual(
      try LengthOf(
        Joined<Any>(
          IterableOf(
            IterableOf()
          )
        )
      ).value(),
      0
    )
  }
  
  func testJoinWithMultipleEmptyLists() throws {
    XCTAssertEqual(
      try LengthOf(
        Joined<Any>(
          IterableOf(
            IterableOf(),
            IterableOf(),
            IterableOf(),
            IterableOf()
          )
        )
      ).value(),
      0
    )
  }
  
  func testJoinWithItemsWithMultipleValuesAndEmptys() throws {
    XCTAssertEqual(
      try LengthOf(
        Joined<Any>(
          IterableOf(
            IterableOf(1,2,3,4,5),
            IterableOf(),
            IterableOf(6,7,8,9,10),
            IterableOf()
          )
        )
      ).value(),
      10
    )
  }
  
  func testJoinWithItemsWithMultipleValuesAndTwoEmptysAtTheEnd() throws {
    XCTAssertEqual(
      try LengthOf(
        Joined<Any>(
          IterableOf(
            IterableOf(1,2,3,4,5),
            IterableOf(),
            IterableOf()
          )
        )
      ).value(),
      5
    )
  }
  
  func testJoinWithItemsWithEmptysAtTheBeginningAndMultipleValuesAsTheLastFew() throws {
    XCTAssertEqual(
      try LengthOf(
        Joined<Any>(
          IterableOf(
            IterableOf(),
            IterableOf(),
            IterableOf(1,2,3,4,5),
            IterableOf(6,7,8,9,10),
            IterableOf(11,12,13,14,15)
          )
        )
      ).value(),
      15
    )
  }
}
