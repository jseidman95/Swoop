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

  public func apply(input: X) throws -> Y {
    return try f.apply(input: input)
  }
}

extension FuncOf {
  
  public convenience init(scalar: any Scalar<Y>) {
    self.init(
      f: FuncSmart { _ in
        return try scalar.value()
      }
    )
  }

  public convenience init(_ proc: any Procedure<X>, _ result: Y) {
    self.init(
      f: FuncSmart { input in
        try proc.execute(input: input)
        return result
      }
    )
  }
}
