//
//  HasEntry.swift
//  
//
//  Created by Jesse Seidman on 9/6/22.
//

import Foundation
import Swoop

public class HasEntry<K: Hashable, V: Equatable>: MatcherEnvelope<Dictionary<K, V>> {

  public convenience init(key: K, val: V) {
    self.init(
      matcher: MatcherOf(
        match: FuncSmart { input in
          input[key] == val
        },
        description: TextSmart {
          return "\(key)=\(val)"
        },
        mismatch: FuncSmart { input in
          try Ternary(
            ScalarSmart {
              return input[key] != nil
            },
            ScalarSmart {
              return "has entry \(key) with value \(input[key])"
            },
            ScalarSmart{
              return "has no entry for \(key)"
            }
          ).value()
        }
      )
    )
  }
}
