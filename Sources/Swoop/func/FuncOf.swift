//
//  FuncOf.swift
//  
//
//  Created by Jesse Seidman on 8/4/22.
//

import Foundation

public class FuncOf<X, Y>: Func {

  private let f: any Func<X, Y>

  private init(f: any Func<X, Y>) {
    self.f = f
  }

  public convenience init(scalar: any Scalar<Y>) {
    self.init(
      f: FuncSmart { _ in
        return try scalar.value()
      }
    )
  }

  public func apply(input: X) throws -> Y {
    return try f.apply(input: input)
  }
}
