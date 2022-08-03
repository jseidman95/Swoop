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
