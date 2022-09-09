//
//  Mapped.swift
//  
//
//  Created by Jesse Seidman on 9/8/22.
//

import Foundation

public class Mapped<T>: Scalar {

  private let scalar: any Scalar<T>

  private init(scalar: any Scalar<T>) {
    self.scalar = scalar
  }

  public func value() throws -> T {
    return try scalar.value()
  }
}

public extension Mapped {

  convenience init<U>(
    fnc: any Func<U, T>,
    scalar: any Scalar<U>
  ) {
    self.init(
      scalar: ScalarSmart {
        return try fnc.apply(input: scalar.value())
      }
    )
  }
}
