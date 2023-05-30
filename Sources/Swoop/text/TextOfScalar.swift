//
//  TextOfScalar.swift
//
//
//  Created by Jesse Seidman on 5/25/23.
//

import Foundation

public class TextOfScalar: Text {
  
  private let scalar: any Scalar<String>
  
  public init(_ scalar: any Scalar<String>) {
    self.scalar = scalar
  }
  
  public func asString() throws -> String {
    return try scalar.value()
  }
}

