//
//  Ternary.swift
//  
//
//  Created by Jesse Seidman on 8/4/22.
//

import Foundation

public class Ternary<T>: Scalar {

  private let val: any Scalar<T>

  private init(val: any Scalar<T>) {
    self.val = val
  }

  public convenience init<U>(
    input: any Scalar<U>,
    condition: any Func<U, Bool>,
    consequent: any Func<U, T>,
    alternative: any Func<U, T>
  ) {
    self.init(
      val: ScalarSmart {
        if try condition.apply(input: input.value()) {
          return try consequent.apply(input: input.value())
        } else {
          return try alternative.apply(input: input.value())
        }
      }
    )
  }

  public func value() throws -> T {
    return try val.value()
  }
}
