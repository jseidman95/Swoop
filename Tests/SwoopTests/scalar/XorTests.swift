//
//  XorTests.swift
//  
//
//  Created by Jesse Seidman on 8/7/22.
//

import XCTest
import Matchers
@testable import Swoop

class XorTests: XCTestCase {
  
  func testTrueTrue() {
    Assertion(
      message: "can't be both true",
      test: Xor(
        True(),
        True()
      ),
      matcher: HasValue(false)
    ).affirm()
  }
  
  func testFalseTrue() {
    Assertion(
      message: "Either one can be true but not both",
      test: Xor(
        False(),
        True()
      ),
      matcher: HasValue(true)
    ).affirm()
  }
  
  func testTrueFalse() {
    Assertion(
      message: "Either one can be true but not both",
      test: Xor(
        True(),
        False()
      ),
      matcher: HasValue(true)
    ).affirm()
  }
  
  func testFalseFalse() {
    Assertion(
      message: "Can't be both false",
      test: Xor(
        False(),
        False()
      ),
      matcher: HasValue(false)
    ).affirm()
  }
  
  func testSingleTrue() {
    Assertion(
      message: "Single true evaluates to true",
      test: Xor(
        True()
      ),
      matcher: HasValue(true)
    ).affirm()
  }
  
  func testSingleFalse() {
    Assertion(
      message: "Single false evaluates to false",
      test: Xor(
        False()
      ),
      matcher: HasValue(false)
    ).affirm()
  }
  
  func testEmptyIterable() {
    Assertion(
      message: "Empty iterable is false",
      test: Xor(
        iterable: IterableOf<any Scalar<Bool>>()
      ),
      matcher: HasValue(false)
    ).affirm()
  }
  
  func testOddNumberTrue() {
    Assertion(
      message: "Odd number of True must be True",
      test: Xor(
        False(),
        False(),
        True()
      ),
      matcher: HasValue(true)
    ).affirm()
  }
  
  func testEvenNumberTrue() {
    Assertion(
      message: "Even number of True must be false",
      test: Xor(
        False(),
        False(),
        True(),
        True()
      ),
      matcher: HasValue(false)
    ).affirm()
  }
  
  func allFalse() {
    Assertion(
      message: "all false always evaluates to false",
      test: Xor(
        False(),
        False(),
        False(),
        False()
      ),
      matcher: HasValue(false)
    ).affirm()
  }
}

