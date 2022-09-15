//
//  HasStringTests.swift
//  
//
//  Created by Jesse Seidman on 9/6/22.
//

import XCTest
import Swoop
@testable import Matchers

final class HasStringTests: XCTestCase {

  func testMatches() {
    Assertion(
      message: "matches and confirms that contains a string",
      test: HasString("Jed"),
      matcher: Matches(TextSmart { "Tenessee Jed" })
    ).affirm()
  }
}
