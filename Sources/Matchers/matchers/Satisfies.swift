//
//  Satisfies.swift
//  
//
//  Created by Jesse Seidman on 9/11/22.
//

import Foundation
import Swoop

public class Satisfies<T>: MatcherEnvelope<T> {

  public convenience init<U>(
    matcher: any Matcher<U>,
    desc: String,
    extractor: any Func<T, U>
  ) {
    self.init(
      matcher: MatcherOf(
        match: FuncSmart { obj in
          try matcher.matches(item: extractor.apply(input: obj))
        },
        description: TextSmart {
          return "\(desc) satisfies \(matcher)"
        },
        mismatch: FuncSmart { input in
          return try "\(desc) on \(input) \(matcher.mismatchDescription(item: extractor.apply(input: input)))"
        }
      )
    )
  }

  public convenience init(closure: @escaping (T) -> Bool) {
    self.init(
      fnc: FuncSmart { input in
        return closure(input)
      }
    )
  }

  public convenience init(fnc: any Func<T, Bool>) {
    self.init(
      matcher: IsTrue(),
      desc: "func application",
      extractor: fnc
    )
  }

  public convenience init<U>(
    matcher: any Matcher<U>,
    extractor: any Func<T, U>
  ) {
    self.init(
      matcher: matcher,
      desc: "feature",
      extractor: extractor
    )
  }
}
