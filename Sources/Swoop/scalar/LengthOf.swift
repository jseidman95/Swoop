//
//  LengthOf.swift
//  
//
//  Created by Jesse Seidman on 8/4/22.
//

import Foundation

public class LengthOf: Scalar {

  private let length: any Scalar<Int>

  private init(length: any Scalar<Int>) {
    self.length = length
  }

  public func value() throws -> Int {
    return try length.value()
  }
}

extension LengthOf {
  
  public convenience init<T>(_ iterable: any Iterable<T>) {

    self.init(
      length: ScalarSmart {
        var size = 0
        for item in iterable.sequence() {
          size += 1
        }
        return size
      }
    )
  }
}
