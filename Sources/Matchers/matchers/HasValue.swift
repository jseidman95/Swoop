//
//  HasValue.swift
//  
//
//  Created by Jesse Seidman on 9/8/22.
//

import Foundation
import Swoop

public class HasValue<T: Equatable>: MatcherEnvelope<any Scalar<T>> {

  public convenience init(_ value: T) {
    self.init(
      m: IsEqual(value: value)
    )
  }

  public convenience init(m: any Matcher<T>) {
    self.init(
      matcher: MatcherOf(
        match: FuncSmart { input in
          m.matches(item: try input.value())
        },
        description: TextSmart {
          return "scalar with " + m.description()
        },
        mismatch: FuncSmart { input in
          m.mismatchDescription(item: try input.value())
        }
      )
    )
  }
}
