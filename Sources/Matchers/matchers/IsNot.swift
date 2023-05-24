//
//  IsNot.swift
//  
//
//  Created by Jesse Seidman on 9/14/22.
//

import Foundation
import Swoop

public class IsNot<T: Equatable>: MatcherEnvelope<T> {

  public convenience init(_ boolMatcher: any Matcher<T>) {
    self.init(
      matcher: MatcherOf(
        match: FuncSmart { input in
          return !boolMatcher.matches(item: input)
        },
        description: TextSmart {
          "does not matcher matcher with description \(boolMatcher.description())"
        },
        mismatch: FuncSmart { input in
          return "mismatched, should have satisfied  \(boolMatcher.mismatchDescription(item: input))"
        }
      )
    )
  }
}
