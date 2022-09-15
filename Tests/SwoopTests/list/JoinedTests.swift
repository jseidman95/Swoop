//
//  JoinedTests.swift
//  
//
//  Created by Jesse Seidman on 9/14/22.
//

import XCTest
import Matchers
@testable import Swoop

class JoinedTests: XCTestCase {

  func testSize() {
    Assertion(
      message: "Must evaluate the size of the joined list",
      test: Joined(
        ListOf("one", "two"),
        ListOf("three", "four")
      ).count(),
      matcher: IsEqual(value: 4)
    ).affirm()
  }

  func testEmpty() {
    Assertion(
      message: "Must be evaluated as a noon empty list",
      test: Joined(
        ListOf("one", "two"),
        ListOf("three", "four")
      ).isEmpty(),
      matcher: IsNot(IsTrue())
    ).affirm()
  }

  func testContains() {
    Assertion(
      message: "Must contain element specified",
      test: Joined(
        ListOf("one", "two"),
        ListOf("three", "four")
      ).contains(where: { $0 == "three" }),
      matcher: IsTrue()
    ).affirm()
  }

  func testIterator() {
    let list = Joined(
      ListOf("one", "two"),
      ListOf("three", "four")
    ).iterator()

    let x = list.next()

    Assertion(
      message: "Joined Iterator Must return next element equal to the first added",
      test: x,
      matcher: IsEqual(value: "one")
    ).affirm()
  }

  func testAdd() {
    let joined = Joined(
      ListOf("one"),
      ListOf("two")
    )
    joined.add(element: "three")

    Assertion<any Iterable<String>>(
      message: "Must be able to add element specified",
      test: joined,
      matcher: EqualsValues(
        IterableOf("one", "two", "three")
      )
    ).affirm()
  }

  func testRemove() {
    let joined = Joined(
      ListOf("one"),
      ListOf("two")
    )
    joined.remove(atIndex: 1)

    Assertion<any Iterable<String>>(
      message: "Must be able to add element specified",
      test: joined,
      matcher: EqualsValues(
        IterableOf("one")
      )
    ).affirm()
  }

  func testContainsAll() {
    let joined = Joined(
      ListOf("one", "two"),
      ListOf("three", "four")
    )
    let contains = joined.contains(
      allIn: ListOf(
        "one", "two"
      ),
      where: { e in
        joined.contains(where: { $0 == e })
      }
    )

    Assertion(
      message: "Must be able to add element specified",
      test: contains,
      matcher: IsTrue()
    ).affirm()
  }
}
