//
//  Scalar.swift
//  
//
//  Created by Jesse Seidman on 8/1/22.
//

import Foundation

public protocol Scalar<Value> {
  associatedtype Value

  func value() throws -> Value
}

public protocol UncheckedScalar<Value> {
  associatedtype Value

  func value() -> Value
}

public class ScalarSmart<Value>: Scalar {

  private let closure: () throws -> Value

  public init(_ closure: @escaping () throws -> Value) {
    self.closure = closure
  }

  public func value() throws -> Value {
    return try closure()
  }
}
