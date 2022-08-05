//
//  Constant.swift
//  
//
//  Created by Jesse Seidman on 8/4/22.
//

import Foundation

public class Constant<T>: Scalar {

  private let val: T

  public init(_ val: T) {
    self.val = val
  }

  public func value() throws -> T {
    return val
  }
}
