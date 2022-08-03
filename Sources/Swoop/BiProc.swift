//
//  BiProc.swift
//  
//
//  Created by Jesse Seidman on 8/2/22.
//

import Foundation

public protocol BiProc<X, Y> {
  associatedtype X
  associatedtype Y

  func apply(first: X, second: Y) throws
}
