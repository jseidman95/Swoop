//
//  ScalarOf.swift
//  
//
//  Created by Jesse Seidman on 8/3/22.
//

import Foundation

public class ScalarOf<T>: Scalar {

  private let scalar: any Scalar<T>

  private init(scalar: any Scalar<T>) {
    self.scalar = scalar
  }

  public func value() throws -> T {
    return try scalar.value()
  }
}

extension ScalarOf {
  
  public convenience init<X>(
    fnc: any Func<X, T>,
    input: X
  ) {
    self.init(
      scalar: ScalarSmart {
        return try fnc.apply(input: input)
      }
    )
  }
}
