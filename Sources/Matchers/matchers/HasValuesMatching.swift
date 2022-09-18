//
//  HasValuesMatching.swift
//  
//
//  Created by Jesse Seidman on 9/8/22.
//

import Foundation
import Swoop

public class HasValuesMatching<X>: MatcherEnvelope<any Iterable<X>> {

  public convenience init(fnc: any Func<X, Bool>) {
    self.init(
      matcher: MatcherOf(
        match: FuncSmart { input in
          return try Or(fnc, input).value()
        },
        description: TextSmart {
          return "matches at least 1 element"
        },
        mismatch: FuncSmart{ input in
          return "no match in \(input)"
        }
      )
    )
  }
}
