//
//  IsEqual.swift
//  
//
//  Created by Jesse Seidman on 9/8/22.
//

import Foundation
import Swoop

public class IsEqual<T: Equatable>: MatcherEnvelope<T> {

  public convenience init(value: T) {
    self.init(
      matcher: MatcherOf(
        match: FuncSmart { input in
          input == value
        },
        description: TextSmart {
          "equals \(value)"
        },
        mismatch: FuncSmart { input in
          return "input: \(input) does not equal \(value)"
        }
      )
    )
  }
}
