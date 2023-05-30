//
//  StickyTextTests.swift
//
//
//  Created by Jesse Seidman on 5/29/23.
//

import XCTest
import Matchers
@testable import Swoop

class StickyTextTests: XCTestCase {

  func testCachesResult() throws {
    let sticky = StickyText(
      TextSmart {
        return UUID().uuidString
      }
    )
    
    Assertion(
      message: "Must be the same",
      test: EquatableText(
        sticky
      ),
      matcher: IsEqual(value: EquatableText(sticky))
    ).affirm()
  }
  
  func testEqualsItself() throws {
    let createRandoString: () -> String = {
      return UUID().uuidString
    }
    
    let sticky = StickyText(
      TextSmart {
        return createRandoString()
      }
    )
    
    Assertion(
      message: "Must be the same as itself",
      test: EquatableText(
        sticky
      ),
      matcher: AllOf(
        IsEqual(value: EquatableText(sticky)),
        IsNot(IsEqual(value: EquatableText(TextSmart { createRandoString() })))
      )
    ).affirm()
  }
}
