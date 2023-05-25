//
//  And.swift
//  
//
//  Created by Jesse Seidman on 8/2/22.
//

import Foundation

public class And: Scalar {

  private let origin: any Iterable<any Scalar<Bool>>

  public init(origin: any Iterable<any Scalar<Bool>>) {
    self.origin = origin
  }

  public func value() throws -> Bool {
    var result = true

    for item in origin.sequence() {
      if try item.value() != true {
        result = false
        break
      }
    }

    return result
  }
}

public extension And {

  convenience init(_ origin: any Scalar<Bool>...) {
    self.init(origin: origin)
  }

  convenience init<X>(_ subject: X, _ conditions: any Func<X, Bool>...) {
    self.init(subject, IterableOf(arr: conditions));
  }

  convenience init<X>(_ fnc: any Func<X, Bool>, _ src: X...) {
    self.init(fnc, IterableOf(arr: src) as any Iterable<X>)
  }

  convenience init<X>(_ fnc: any Func<X, Bool>, _ src: any Iterable<X>) {
    self.init(
      origin: MappedIterable(
        FuncSmart { item in
          ScalarSmart {
            return try fnc.apply(input: item)
          }
        },
        src
      )
    )
  }

  convenience init<X>(_ subject: X, _ conditions: any Func<X, Bool>) {
    self.init(subject, IterableOf(conditions))
  }

  convenience init<X>(_ subject: X, _ conditions: any Iterable<any Func<X, Bool>>) {
    self.init(
      origin: MappedIterable(
        FuncSmart { input in
          ScalarSmart {
            return try input.apply(input: subject)
          }
        },
        conditions
      )
    )
  }
}
