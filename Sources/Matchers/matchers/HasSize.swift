//
//  HasSize.swift
//  
//
//  Created by Jesse Seidman on 9/6/22.
//

import Foundation
import Swoop

public class HasSize<X>: MatcherEnvelope<any Iterable<X>> {

  public convenience init(_ size: Int) {
    self.init(
      matcher: MatcherOf(
        match: FuncSmart { input in
          return try LengthOf(input).value() == size
        },
        description: TextSmart { "has size \(size)" },
        mismatch: FuncSmart { input in
          return try "has size \(LengthOf(input).value())"
        }
      )
    )
  }
}
