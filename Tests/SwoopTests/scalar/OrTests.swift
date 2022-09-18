//
//  OrTests.swift
//  
//
//  Created by Jesse Seidman on 8/1/22.
//

import XCTest
import Matchers
@testable import Swoop

class OrTests: XCTestCase {

  func testAllFalse() throws {
    Assertion(
      message: "confirm all false",
      test: Or(
        False(),
        False(),
        False(),
        False()
      ),
      matcher: HasValue(false)
    ).affirm()
  }

  func testOneTrue() throws {
    Assertion(
      message: "confirm one true",
      test: Or(
        False(),
        False(),
        False(),
        True()
      ),
      matcher: HasValue(true)
    ).affirm()
  }

  func testAllTrue() throws {
    Assertion(
      message: "confirm all true",
      test: Or(
        True(),
        True(),
        True(),
        True()
      ),
      matcher: HasValue(true)
    ).affirm()
  }

  func testEmptyIterator() throws {
    Assertion(
      message: "confirm empty iterable",
      test: Or(
        IterableOf<any Scalar<Bool>>()
      ),
      matcher: HasValue(false)
    ).affirm()
  }

  func testProcedureIterable() throws {
    let list = ListOf<Int>()
    Assertion(
      message: "confirm proc iterable",
      test: try Or(
        ProcedureSmart<Int> { inp in list.add(element: inp) },
        IterableOf(1,2,3,4)
      ).value(),
      matcher: MatcherOf(
        match: FuncSmart { _ in
          list.contains(
            allIn: ListOf(1,2,3,4),
            where: { elem in
              list.contains(where: { $0 == elem })
            }
          )
        },
        description: TextSmart { "Should contain elements in list" },
        mismatch: FuncSmart { _ in
          return "does not contains some elements in list \(list)"
        }
      )
    ).affirm()
  }
  
  func testProcVarArgs() throws {
    let list = ListOf<Int>()
    _ = try Or(
      ProcedureSmart { elem in
        list.add(element: elem)
      },
      2,3,4
    ).value()
    
    Assertion(
      message: "Should have added values to list",
      test: list,
      matcher: HasValues(2,3,4)
    ).affirm()
  }
  
  func testFuncIterable() {
    Assertion(
      message: "Should use the func iterable init correctly",
      test: Or(
        FuncSmart { input in
          input > 0
        },
        IterableOf(-1,1,0)
      ),
      matcher: HasValue(true)
    ).affirm()
  }
  
  func testFuncVarargs() {
    Assertion(
      message: "Should use the func vararg init correctly",
      test: Or(
        FuncSmart { input in
          input > 0
        },
        -1,1,0
      ),
      matcher: HasValue(true)
    ).affirm()
  }
  
  func testMultipleFuncConditionTrue() {
    Assertion(
      message: "Can't compare subject with true conditions",
      test: Or(
        3,
        FuncSmart { input in input > 0 },
        FuncSmart { input in input > 5 },
        FuncSmart { input in input > 4 }
      ),
      matcher: HasValue(true)
    ).affirm()
  }
  
  func testMultipleFuncConditionFalse() {
    Assertion(
      message: "Can't compare subject with true conditions",
      test: Or(
        "swoop",
        FuncSmart { input in input.contains("singleton") },
        FuncSmart { input in input.contains("static") }
      ),
      matcher: HasValue(false)
    ).affirm()
  }
}
