//
//  IsTrue.swift
//  
//
//  Created by Jesse Seidman on 9/9/22.
//

import Foundation
import Swoop

public class IsTrue: MatcherEnvelope<Bool> {

  public convenience init() {
    self.init(
      matcher: MatcherOf(
        match: FuncSmart { $0 == true },
        description: TextSmart { "is true" },
        mismatch: FuncSmart {
          "was \($0)"
        }
      )
    )
  }
}
