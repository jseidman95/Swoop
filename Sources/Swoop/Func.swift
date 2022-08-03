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
