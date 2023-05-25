//
//  Folded.swift
//
//
//  Created by Jesse Seidman on 5/23/23.
//

public class Folded<X,T>: Scalar {
  
  private let iterable: any Iterable<T>
  private let input: X
  private let fnc: any BiFunc<X, T, X>
  
  public init(
    input: X,
    fnc: any BiFunc<X, T, X>,
    iterable: any Iterable<T>
  ) {
    self.input = input
    self.fnc = fnc
    self.iterable = iterable
  }
  
  public func value() throws -> X {
    var memo = input
    
    for item in iterable.sequence() {
      memo = try fnc.apply(first: memo, second: item)
    }
    
    return memo
  }
}

extension Folded {
  
  public convenience init(
    input: X,
    fnc: any BiFunc<X,T,X>,
    _ list: T...
  ) {
    self.init(
      input: input,
      fnc: fnc,
      iterable: IterableOf(list: list)
    )
  }
}
