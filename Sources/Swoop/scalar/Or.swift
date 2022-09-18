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
    let i = origin.iterator()
    while i.hasNext() {
      if try i.next().value() == true {
        result = true
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

  convenience init<X>(_ subject: X, _ conditions: any Func<X, Bool>...) {
    self.init(
      itr: MappedIterable(
        fnc: FuncSmart { item in
          ScalarSmart {
            return try item.apply(input: subject)
          }
        },
        src: IterableOf(arr: conditions)
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
