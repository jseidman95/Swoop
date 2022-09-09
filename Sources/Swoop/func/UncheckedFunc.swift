//
//  UncheckedFunc.swift
//  
//
//  Created by Jesse Seidman on 8/23/22.
//

import Foundation

public class UncheckedFunc<X,Y>: Func {

  private let origin: any Func<X,Y>

  public init(_ origin: any Func<X, Y>) {
    self.origin = origin
  }

  public func apply(input: X) -> Y {
    return Unchecked(
      ScalarSmart {
        return try! self.origin.apply(input: input)
      }
    ).value()
  }
}
