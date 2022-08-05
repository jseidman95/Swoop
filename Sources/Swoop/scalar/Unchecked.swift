//
//  Unchecked.swift
//  
//
//  Created by Jesse Seidman on 8/3/22.
//

import Foundation

public class Unchecked<T>: UncheckedScalar {

  private let scalar: any Scalar<T>

  public init(_ scalar: any Scalar<T>) {
    self.scalar = scalar
  }

  public func value() -> T {
    return try! scalar.value()
  }
}
