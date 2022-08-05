//
//  Func.swift
//  
//
//  Created by Jesse Seidman on 8/2/22.
//

import Foundation

public protocol Func<X, Y> {
  associatedtype X
  associatedtype Y

  func apply(input: X) throws -> Y
}

public class FuncSmart<X, Y>: Func {

  private let f: (X) throws -> Y

  public init(f: @escaping (X) throws -> Y) {
    self.f = f
  }

  public func apply(input: X) throws -> Y {
    return try f(input)
  }
}
