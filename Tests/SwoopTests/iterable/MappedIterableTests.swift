//
//  MappedIterableTests.swift
//  
//
//  Created by Jesse Seidman on 9/18/22.
//

import XCTest
import Matchers
@testable import Swoop

class MappedIterableTests: XCTestCase {
  
  // For some reason I need to split these up because of type checking bullshit
  private static func testTransformsListSubject1() -> any IteratorProtocol<Text> {
    return MappedIterable(
      FuncSmart { Upper(TextOf($0)) },
      IterableOf("hello", "world", "shalom")
    ).iterator()
  }
  
  private static func testTransformsListSubject2() -> Text {
    return MappedIterableTests.testTransformsListSubject1().next()
  }
  
  private static func testTransformsListSubject3() throws -> String {
    return try MappedIterableTests.testTransformsListSubject2().asString()
  }

  func testTransformsList() throws {
    let string: String = try MappedIterableTests.testTransformsListSubject3()
    Assertion(
      message: "Must transform to uppercase",
      test: string,
      matcher: IsEqual(value: "HELLO")
    ).affirm()
  }
  
  func testTransformsEmptyList() {
    Assertion(
      message: "transforms empty iterable",
      test: MappedIterable(
        FuncSmart { Upper(TextOf($0)) }
      ),
      matcher: IsEmptyIterable()
    ).affirm()
  }
  
  func testTransformsArray() {
    Assertion(
      message: "Transforms an array",
      test: MappedIterable(
        FuncSmart { try Upper(TextOf($0)).asString() },
        "a", "b", "c"
      ),
      matcher: HasValues("A", "B", "C")
    ).affirm()
  }
}
