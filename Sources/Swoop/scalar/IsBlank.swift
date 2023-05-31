//
//  IsBlank.swift
//
//
//  Created by Jesse Seidman on 5/25/23.
//

import Foundation

public class IsBlank: Scalar {
  
  private let origin: Text
  
  public init(_ origin: Text) {
    self.origin = origin
  }

  public func value() throws -> Bool {
    var allBlank = true
    
    for char in try origin.asString() {
      if !char.isWhitespace {
        allBlank = false
        break
      }
    }
    
    return allBlank
  }
}
