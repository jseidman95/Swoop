//
//  AllOf.swift
//
//
//  Created by Jesse Seidman on 5/25/23.
//

import Foundation
import Swoop

public class AllOf<T>: MatcherEnvelope<T> {

  public convenience init(iterable: any Iterable<any Matcher<T>>) {
    self.init(
      matcher: MatcherOf(
        match: FuncSmart { input in
          try ReducedInto<any Matcher<T>, any Scalar<Bool>>(
            initial: True(),
            iterable,
            function: BiFuncSmart { first, second in
              And(
                ScalarSmart {
                  first.matches(item: input)
                },
                second
              )
            }
          ).value().value()
        },
        description: TextSmart {
          try ReducedInto<any Matcher<T>, Text>(
            initial: TextOf(""),
            iterable,
            function: BiFuncSmart { first, second in
              JoinedText(
                delimit: "\n",
                TextOf(first.description()),
                second
              )
            }
          ).value().asString()
        },
        mismatch: FuncSmart { input in
          try ReducedInto<any Matcher<T>, Text>(
            initial: TextOf(""),
            iterable,
            function: BiFuncSmart { first, second in
              JoinedText(
                delimit: "\n",
                TextOf(first.description()),
                second
              )
            }
          ).value().asString()
        }
      )
    )
  }
  
  public convenience init(_ matchers: any Matcher<T>...) {
    self.init(iterable: IterableOf(arr: matchers))
  }
}
