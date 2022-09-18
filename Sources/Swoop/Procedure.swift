//
//  Procedure.swift
//  
//
//  Created by Jesse Seidman on 8/2/22.
//

import Foundation

public protocol Procedure<X> {
  associatedtype X

  func apply(input: X) throws
}

public class ProcedureSmart<X>: Procedure {

  private let closure: (X) throws -> Void

  public init(closure: @escaping (X) throws -> Void) {
    self.closure = closure
  }

  public func apply(input: X) throws {
    try closure(input)
  }
}
