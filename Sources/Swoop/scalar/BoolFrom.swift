//
//  BoolFrom.swift
//  
//
//  Created by Jesse Seidman on 8/1/22.
//

import Foundation

public class BoolFrom: Scalar {

  private let origin: String

  public init(_ origin: String) {
    self.origin = origin
  }

  public func value() -> Bool {
    return NSString(string: origin).boolValue
  }
}
