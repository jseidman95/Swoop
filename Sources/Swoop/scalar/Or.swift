//
//  Or.swift
//  
//
//  Created by Jesse Seidman on 8/1/22.
//

import Foundation

public class Or: Scalar {

  private let origin: any Iterable<any Scalar<Bool>>

  public init(_ origin: any Scalar<Bool>...) {
    self.origin = origin
  }

  public func value() throws -> Bool {
    return try Reduced(origin) { partialResult, bool in
      return partialResult || bool
    }.value()
  }
}
