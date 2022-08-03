//
//  Scalar.swift
//  
//
//  Created by Jesse Seidman on 8/1/22.
//

import Foundation

public protocol Scalar<Value>: SwoopEquatable {
  associatedtype Value

  func value() throws -> Value
}

public protocol SwoopEquatable {
  associatedtype Value

  func equals(_ obj: Value) throws -> Bool
}

public extension Scalar where Value: Equatable {

  func equals(_ obj: Value) throws -> Bool {
    do {
      return try value() == obj
    } catch let e as Exception {
      throw StandardException(
        "Could not equate self with value \(obj)",
        wrapping: e
      )
    }
  }
}
