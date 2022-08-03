//
//  BiFunc.swift
//  
//
//  Created by Jesse Seidman on 8/2/22.
//

import Foundation

public protocol BiFunc<X,Y,Z> {
  associatedtype X
  associatedtype Y
  associatedtype Z

  func apply(first: X, second: Y) throws -> Z
}

public class BiFuncSmart<X,Y,Z>: BiFunc {

  private let closure: (X,Y) throws -> Z

  public init(closure: @escaping (X,Y) throws -> Z) {
    self.closure = closure
  }

  public func apply(first: X, second: Y) throws -> Z {
    return try closure(first, second)
  }
}
