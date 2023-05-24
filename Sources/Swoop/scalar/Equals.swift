//
//  Equals.swift
//
//
//  Created by Jesse Seidman on 05/23/23.
//

public class Equals<T>: Scalar where T: Equatable {
  
  private let first: any Scalar<T>
  private let second: any Scalar<T>
  
  public init(_ first: any Scalar<T>, _ second: any Scalar<T>) {
    self.first = first
    self.second = second
  }
  
  public func value() throws -> Bool {
    return try first.value() == second.value()
  }
}

extension Equals {
  
  public convenience init(_ source: T, _ compared: T) {
    self.init(Constant(source), Constant(compared))
  }
}
