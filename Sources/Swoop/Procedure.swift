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
