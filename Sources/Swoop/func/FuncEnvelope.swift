//
//  FuncEnvelope.swift
//
//
//  Created by Jesse Seidman on 5/30/23.
//

import Foundation

public class FuncEnvelope<X,Y>: Func {
  
  private let fnc: any Func<X,Y>
  
  init(fnc: any Func<X, Y>) {
    self.fnc = fnc
  }
  
  public func apply(input: X) throws -> Y {
    return try fnc.apply(input: input)
  }
}
