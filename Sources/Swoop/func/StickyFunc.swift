//
//  StickyFunc.swift
//
//
//  Created by Jesse Seidman on 5/24/23.
//

public class StickyFunc<X: Hashable,Y>: Func {
  
  private let biFunc: any BiFunc<X, Bool, Y>
  
  public init(biFunc: any BiFunc<X, Bool, Y>) {
    self.biFunc = biFunc
  }
  
  public func apply(input: X) throws -> Y {
    return try biFunc.apply(first: input, second: true)
  }
}

extension StickyFunc {
  
  public convenience init(fnc: any Func<X,Y>) {
    self.init(
      fnc: fnc,
      max: Int.max
    )
  }
  
  public convenience init(fnc: any Func<X,Y>, max: Int) {
    self.init(
      biFunc: StickyBiFunc(
        biFunc: BiFuncSmart { first, second in
          try fnc.apply(input: first)
        },
        size: max
      )
    )
  }
}
