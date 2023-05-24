//
//  Sticky.swift
//
//
//  Created by Jesse Seidman on 5/24/23.
//

import Foundation

public class StickyScalar<T>: Scalar {
  
  private let fnc: any Func<Bool, T>
  
  public init(fnc: any Func<Bool, T>) {
    self.fnc = fnc
  }
  
  public convenience init(scalar: any Scalar<T>) {
    self.init(
      fnc: StickyFunc(
        fnc: FuncSmart { _ in
          try scalar.value()
        }
      )
    )
  }
  
  public func value() throws -> T {
    return try fnc.apply(input: true)
  }
}
