//
//  JoinedTests.swift
//  
//
//  Created by Jesse Seidman on 8/7/22.
//

import XCTest
@testable import Swoop

class JoinedTests: XCTestCase {

  func testJoinMultipleLists() throws {
    XCTAssertEqual(
      try LengthOf(
        Joined(
          [1,2,3,4],
          ListOf([1,2,3,4]),
          ListOf([1,2,3,4]),
          ListOf([1,2,3,4]),
          ListOf([1,2,3,4]),
          ListOf([1,2,3,4])
        )
      ).value(),
      6
    )
  }
  
  func testJoinSingleItem() throws {
    XCTAssertEqual(
      try LengthOf(
        Joined(
          item: 7,
          items: [5,6]
        )
      ).value(),
      3
    )
  }
  
//  func testJoinEmptyArrayWithSingleItemArray() throws {
//    XCTAssertEqual(
//      try LengthOf(
//        Joined(
//          1,
//          2,
//          4,
//          [4,5,6]
//        )
//      ).value(),
//      3
//    )
//  }
  
  func testJoinEmptyArrayWithSingleItemArrayReversedOrder() throws {
    XCTAssertEqual(
      try LengthOf(
        Joined(
          ListOf(
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
          ListOf(
            IterableOf<Any>()
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
          ListOf(
            IterableOf<Any>(),
            IterableOf<Any>(),
            IterableOf<Any>(),
            IterableOf<Any>()
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
          ListOf(
            IterableOf(1,2,3,4,5),
            IterableOf<Int>(),
            IterableOf(6,7,8,9,10),
            IterableOf<Int>()
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
          ListOf(
            IterableOf(1,2,3,4,5),
            IterableOf<Int>(),
            IterableOf<Int>()
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
          ListOf(
            IterableOf<Int>(),
            IterableOf<Int>(),
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
