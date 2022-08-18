//
//  FuncOfTests.swift
//  
//
//  Created by Jesse Seidman on 8/17/22.
//

import XCTest
@testable import Swoop

class FuncOfTests: XCTestCase {

  func testConvertsScalarToFunc() {
    let obj = NSObject()
    let funcOf = FuncOf<String, NSObject>(scalar: Constant(obj))

    XCTAssertEqual(
      try funcOf.apply(input: "nothing"),
      obj
    )
  }
}
