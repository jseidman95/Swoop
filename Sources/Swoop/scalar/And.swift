//
//  And.swift
//  
//
//  Created by Jesse Seidman on 8/2/22.
//

import Foundation

public class And: Scalar {

  private let origin: any Iterable<any Scalar<Bool>>

  public init(_ origin: any Scalar<Bool>...) {
    self.origin = origin
  }

  public func value() throws -> Bool {
    return try Reduced(origin) { partial, element in
      return partial && element
    }.value()
  }
}
