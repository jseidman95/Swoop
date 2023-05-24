//
//  IsAnything.swift
//
//
//  Created by Jesse Seidman on 5/23/23.
//

import Foundation
import Swoop

public class IsAnything<T>: MatcherEnvelope<T> {
  
  public convenience init() {
    self.init(
      matcher: MatcherOf(
        match: FuncSmart { _ in return true },
        description: TextSmart { "is anything" },
        mismatch: FuncSmart {_ in
          "should be impossible"
        }
      )
    )
  }
}
