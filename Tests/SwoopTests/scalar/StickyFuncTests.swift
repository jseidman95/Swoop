//
//  StickyFuncTests.swift
//
//
//  Created by Jesse Seidman on 5/24/23.
//

import XCTest
import Matchers
@testable import Swoop

class StickyFuncTests: XCTestCase {
  
  func testCachesFuncResults() throws {
    let fnc: any Func<Bool, Int> = StickyFunc(
      fnc: FuncSmart { _ in
        return Int.random(in: 0...100)
      }
    )
    Assertion(
      message: "Cache Results",
      test: try fnc.apply(input: true) + fnc.apply(input: true),
      matcher: IsEqual(value: try fnc.apply(input: true) + fnc.apply(input: true))
    ).affirm()
  }
  
  func testCachesWithLimitedBuffer() throws {
    let fnc: any Func<Int, Int> = StickyFunc(
      fnc: FuncSmart { _ in
        return Int.random(in: 0...100)
      },
      max: 2
    )
    let first = try fnc.apply(input: 0)
    let second = try fnc.apply(input: 1)
    
    Assertion(
      message: "Must Cache Two Results",
      test: first + second,
      matcher: IsEqual(value: try fnc.apply(input: 0) + fnc.apply(input: 1))
    ).affirm()
    
    let third = try fnc.apply(input: -1)
    Assertion(
      message: "Must cache next two results",
      test: second + third,
      matcher: IsEqual(value: try fnc.apply(input: 1) + fnc.apply(input: -1))
    ).affirm()
  }
  
  func testCachesWithNoBuffer() throws {
    let fnc: any Func<Bool, Int> = StickyFunc(
      fnc: FuncSmart { _ in
        return Int.random(in: 0...100)
      },
      max: 0
    )
    
    Assertion(
      message: "Must Cache Two Results",
      test: try fnc.apply(input: true) + fnc.apply(input: true),
      matcher: IsNot(
        IsEqual(value: try fnc.apply(input: true) + fnc.apply(input: true))
      )
    ).affirm()
  }
}
