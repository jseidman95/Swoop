//
//  StickyBiFunTests.swift
//
//
//  Created by Jesse Seidman on 5/24/23.
//

import XCTest
import Matchers
@testable import Swoop

class StickyBiFunTests: XCTestCase {
  
  func testCachesFuncResults() throws {
    let fnc: any BiFunc<Bool, Bool, Int> = StickyBiFunc(
      biFunc: BiFuncSmart { _, _ in
        return Int.random(in: 1...100)
      }
    )
    Assertion(
      message: "Cache Results",
      test: try fnc.apply(first: true, second: true) + fnc.apply(first: true, second: true),
      matcher: IsEqual(value: try fnc.apply(first: true, second: true) + fnc.apply(first: true, second: true))
    ).affirm()
  }
}
