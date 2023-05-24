//
//  NotTests.swift
//
//
//  Created by Jesse Seidman on 5/24/23.
//

import XCTest
import Matchers
@testable import Swoop

class NotTests: XCTestCase {
  
    func testNotTrueIsFalse() {
        Assertion(
            message: "Not true should return false",
            test: Not(True()),
            matcher: HasValue(false)
        ).affirm()
    }
    
    func testNotFalseIsTrue() {
        Assertion(
            message: "Not false should return true",
            test: Not(False()),
            matcher: HasValue(true)
        ).affirm()
    }
    
    func testNotNotReturnsOriginal() throws {
        let bool = False()
        
        Assertion(
            message: "Not not should return original",
            test: try Not(Not(bool)).value(),
            matcher: IsEqual(value: bool.value())
        ).affirm()
    }
}
