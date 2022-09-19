//
//  IsEmptyIterable.swift
//  
//
//  Created by Jesse Seidman on 9/18/22.
//

import Foundation
import Swoop

public class IsEmptyIterable<X>: MatcherEnvelope<any Iterable<X>> {
  
  public convenience init() {
    self.init(
      matcher: MatcherOf(
        match: FuncSmart { itr in
          itr.iterator().hasNext() == false
        },
        description: TextSmart { "should have an iterable without any elements" },
        mismatch: FuncSmart { itr in
          "iterable was not empty"
        }
      )
    )
  }
}
