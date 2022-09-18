//
//  ThrowsException.swift
//  
//
//  Created by Jesse Seidman on 9/18/22.
//

import Foundation
import Swoop

public class ThrowsScalarException<X>: MatcherEnvelope<any Scalar<X>> {
  
  public convenience init() {
    self.init(
      matcher: MatcherOf(
        match: FuncSmart { scalar in
          var thrown = false
          
          do {
            _ = try scalar.value()
          } catch {
            thrown = true
          }
          
          return thrown
        },
        description: TextSmart { "Should throw exception when you try to get scalar value"},
        mismatch: FuncSmart { scalar in
          "didn't throw exception when trying to access: \(scalar)'s value"
        }
      )
    )
  }
}
