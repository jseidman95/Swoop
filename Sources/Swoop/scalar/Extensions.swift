//
//  Extensions.swift
//  
//
//  Created by Jesse Seidman on 8/2/22.
//

import Foundation

extension String: Scalar {

  public func value() throws -> String {
    return self
  }
}

extension Int: Scalar {

  public func value() throws -> Int {
    return self
  }
}
