//
//  FuncOfTests.swift
//  
//
//  Created by Jesse Seidman on 8/17/22.
//

import XCTest
import Matchers
@testable import Swoop

class FuncOfTests: XCTestCase {

  func testConvertsScalarToFunc() {
    let obj = NSObject()
    let funcOf = FuncOf<String, NSObject>(scalar: Constant(obj))

    Assertion(
      message: "confirm that scalar is converted to Func",
      test: IsEqual(value: obj),
      matcher: Matches(try! funcOf.apply(input: "nothing"))
    ).affirm()
  }
}
