//
//  MappedIterableTests.swift
//  
//
//  Created by Jesse Seidman on 9/11/22.
//

import XCTest
@testable import Swoop

class MappedIterableTests: XCTestCase {

  func testTransformsList() {
  }
}


//@Test
//    void transformsList() throws Exception {
//        new Assertion<>(
//            "Must transform an iterable",
//            new Mapped<>(
//                input -> new Upper(new TextOf(input)),
//                new IterableOf<>(
//                    "hello", "world", "друг"
//                )
//            ).iterator().next(),
//            new IsText("HELLO")
//        ).affirm();
//    }
//
//    @Test
//    void transformsEmptyList() {
//        new Assertion<>(
//            "Must transform an empty iterable",
//            new Mapped<>(
//                (String input) -> new Upper(new TextOf(input)),
//                Collections.emptyList()
//            ),
//            new IsEmptyIterable<>()
//        ).affirm();
//    }
//
//    @Test
//    void string() {
//        new Assertion<>(
//            "Must convert to string",
//            new Mapped<>(
//                x -> x * 2,
//                new ListOf<>(1, 2, 3)
//            ).toString(),
//            new IsEqual<>("2, 4, 6")
//        ).affirm();
//    }
//
//    @Test
//    void transformsArray() {
//        new Assertion<>(
//            "Transforms an array",
//            new Mapped<>(
//                input -> new Upper(new TextOf(input)).asString(),
//                "a", "b", "c"
//            ),
//            new IsEqual<>(new IterableOf<>("A", "B", "C"))
//        ).affirm();
//    }
