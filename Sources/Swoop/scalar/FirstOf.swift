//
//  FirstOf.swift
//
//
//  Created by Jesse Seidman on 8/1/22.
//

import Foundation

public class FirstOf<T>: Scalar {
  
  private let condition: any Func<T, Bool>
  private let source: any Iterable<T>
  private let fallback: any Scalar<T>
  
  public init(
    condition: any Func<T, Bool>,
    source: any Iterable<T>,
    fallback: any Scalar<T>
  ) {
    self.condition = condition
    self.source = source
    self.fallback = fallback
  }

  public func value() throws -> T {
    for item in source.sequence() {
      if try condition.apply(input: item) {
        return item
      }
    }
    
    return try fallback.value()
  }
}

extension FirstOf {
  
  public convenience init(src: any Iterable<T>, fbck: T) {
    self.init(
      condition: FuncOf(scalar: True()),
      source: src,
      fallback: ScalarSmart { fbck }
    )
  }
  
  public convenience init(src: any Iterable<T>, fbck: any Scalar<T>) {
    self.init(
      condition: FuncOf(scalar: True()),
      source: src,
      fallback: fbck
    )
  }
}
