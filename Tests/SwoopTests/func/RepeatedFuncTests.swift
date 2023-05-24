//
//  RepeatedFuncTests.swift
//
//
//  Created by Jesse Seidman on 5/24/23.
//

import XCTest
import Matchers
@testable import Swoop

class RepeatedFuncTests: XCTestCase {

    func testRunsFuncMultipleTimes() throws {
        let iterator = IteratorOf(1,2,20,6,7)
        let fnc: any Func<Bool, Int> = RepeatedFunc(
            fnc: FuncSmart { _ in iterator.next() },
            times: 3
        )
        
        Assertion(
            message: "Should be applied thrice",
            test: try fnc.apply(input: true),
            matcher: IsEqual(value: 20)
        ).affirm()
    }
    
    func testDoesNotRepeat() throws {
        let fnc: any Func<Bool, Int> = RepeatedFunc(
            fnc: FuncSmart { _ in Int.random(in: 0...100) },
            times: 0
        )
        
        Assertion(
            message: "Should throw if param is not correct",
            test: ScalarSmart { try fnc.apply(input: true) },
            matcher: Throws(
                msg: "The number of repetitions must be at least 1",
                type: StandardException.Type.self
            )
        ).affirm()
    }
}
