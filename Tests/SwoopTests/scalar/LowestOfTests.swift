//
//  LowestOfTests.swift
//
//
//  Created by Jesse Seidman on 5/24/23.
//

import XCTest
import Matchers
@testable import Swoop

class LowestOfTests: XCTestCase {
  
    func testFailsForEmptyIterable() {
        Assertion(
            message: "Fail for empty",
            test: LowestOf(iterable: IterableOf(arr: [Int]())),
            matcher: Throws(
                msg: "Can't find first element in empty iterable",
                type: StandardException.Type.self
            )
        ).affirm()
    }
    
    func testReturnsItemForSingleItem() {
        Assertion(
          message: "Returns single element",
          test: LowestOf(iterable: IterableOf(10)),
          matcher: HasValue(10)
        ).affirm()
    }
    
    func testReturnsLowest() {
        Assertion(
          message: "Returns lowest Element",
          test: LowestOf(1,2,3,4,5,6),
          matcher: HasValue(1)
        ).affirm()
    }
}
