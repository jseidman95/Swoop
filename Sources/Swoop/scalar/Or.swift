//
//  Or.swift
//  
//
//  Created by Jesse Seidman on 8/1/22.
//

import Foundation

public class Or: Scalar {

  private let origin: any Iterable<any Scalar<Bool>>

  public init(itr: any Iterable<any Scalar<Bool>>) {
    self.origin = itr
  }

  public convenience init(_ origin: any Scalar<Bool>...) {
    self.init(itr: origin)
  }

  public func value() throws -> Bool {
    return try Reduced(origin) { partialResult, bool in
      return partialResult || bool
    }.value()
  }
}

public extension Or {
  convenience init<X>(fnc: any Func<X, Bool>, src: any Iterable<X>) {
    self.init(
      itr: MappedIteratable(
        fnc: FuncSmart { input in
          return ScalarOf(
            fnc: fnc,
            input: input
          )
        },
        src: src
      )
    )
  }
}
