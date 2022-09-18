//
//  OrTests.swift
//  
//
//  Created by Jesse Seidman on 8/1/22.
//

import XCTest
import Matchers
@testable import Swoop

class OrTests: XCTestCase {

  func testAllFalse() throws {
    Assertion(
      message: "confirm all false",
      test: Or(
        False(),
        False(),
        False(),
        False()
      ),
      matcher: HasValue(false)
    ).affirm()
  }

  func testOneTrue() throws {
    Assertion(
      message: "confirm one true",
      test: Or(
        False(),
        False(),
        False(),
        True()
      ),
      matcher: HasValue(true)
    ).affirm()
  }

  func testAllTrue() throws {
    Assertion(
      message: "confirm all true",
      test: Or(
        True(),
        True(),
        True(),
        True()
      ),
      matcher: HasValue(true)
    ).affirm()
  }

  func testEmptyIterator() throws {
    Assertion(
      message: "confirm empty iterable",
      test: Or(
        IterableOf<any Scalar<Bool>>()
      ),
      matcher: HasValue(false)
    ).affirm()
  }

  func testProcedureIterable() throws {
    Assertion(
      message: "confirm proc iterable",
      test: Or(
        ProcedureSmart { inp in inp.add},
        <#T##any Iterable<X>#>
      ).value(),
      matcher: HasValue(false)
    ).affirm()
  }
}
//    @Test
//    void testProcIterable() throws Exception {
//        final List<Integer> list = new LinkedList<>();
//        new Or(
//            (Proc<Integer>) list::add,
//            new IterableOf<>(1, 2, 3, 4)
//        ).value();
//        MatcherAssert.assertThat(
//            list,
//            Matchers.contains(1, 2, 3, 4)
//        );
//    }
//
//    @Test
//    void testProcIterator() throws Exception {
//        final List<Integer> list = new LinkedList<>();
//        new Or(
//            (Proc<Integer>) list::add,
//            new IterableOf<>(1, 2, 3, 4)
//        ).value();
//        MatcherAssert.assertThat(
//            list,
//            Matchers.contains(1, 2, 3, 4)
//        );
//    }
//
//    @Test
//    void testProcVarargs() throws Exception {
//        final List<Integer> list = new LinkedList<>();
//        new Or(
//            (Proc<Integer>) list::add,
//            2, 3, 4
//        ).value();
//        MatcherAssert.assertThat(
//            list,
//            Matchers.contains(2, 3, 4)
//        );
//    }
//
//    @Test
//    void testFuncIterable() throws Exception {
//        MatcherAssert.assertThat(
//            new Or(
//                input -> input > 0,
//                new IterableOf<>(-1, 1, 0)
//            ),
//            new HasValue<>(true)
//        );
//    }
//
//    @Test
//    void testFuncIterator() throws Exception {
//        MatcherAssert.assertThat(
//            new Or(
//                input -> input > 0,
//                new IterableOf<>(-1, 1, 0)
//            ),
//            new HasValue<>(true)
//        );
//    }
//
//    @Test
//    void testFuncVarargs() throws Exception {
//        MatcherAssert.assertThat(
//            new Or(
//                input -> input > 0,
//                -1, -2, 0
//            ),
//            new HasValue<>(false)
//        );
//    }
//
//    @Test
//    void testMultipleFuncConditionTrue() throws Exception {
//        MatcherAssert.assertThat(
//            "Can't compare subject with true conditions",
//            new Or(
//                3,
//                input -> input > 0,
//                input -> input > 5,
//                input -> input > 4
//            ),
//            new HasValue<>(true)
//        );
//    }
//
//    @Test
//    void testMultipleFuncConditionFalse() throws Exception {
//        MatcherAssert.assertThat(
//            "Can't compare subject with false conditions",
//            new Or(
//                "cactoos",
//                input -> input.contains("singleton"),
//                input -> input.contains("static")
//            ),
//            new HasValue<>(false)
//        );
//    }
