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

  public func value() throws -> Bool {
    var result = false
    for item in origin.sequence() {
      if try item.value() == true {
        result = true
        break
      }
    }
    return result
  }
}


public extension Or {

  convenience init(_ origin: any Scalar<Bool>...) {
    self.init(itr: origin)
  }

  convenience init<X>(_ fnc: any Func<X, Bool>, _ src: any Iterable<X>) {
    self.init(
      itr: MappedIterable(
        FuncSmart { input in
          return ScalarOf(
            fnc: fnc,
            input: input
          )
        },
        src
      )
    )
  }

  convenience init<X>(_ subject: X, _ conditions: any Func<X, Bool>...) {
    self.init(
      itr: MappedIterable(
        FuncSmart { item in
          ScalarSmart {
            return try item.apply(input: subject)
          }
        },
        IterableOf(arr: conditions)
      )
    )
  }

  convenience init<X>(_ proc: any Procedure<X>, _ src: any Iterable<X>) {
    self.init(
      FuncOf(
        proc,
        false
      ),
      src
    )
  }

  convenience init<X>(_ fnc: any Func<X, Bool>, _ src: X...) {
    self.init(fnc, IterableOf(arr: src) as any Iterable<X>)
  }

  convenience init<X>(_ proc: any Procedure<X>, _ src: X...) {
    self.init(FuncOf(proc, false), src)
  }
}
