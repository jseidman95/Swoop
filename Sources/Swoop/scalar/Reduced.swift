//
//  Reduced.swift
//  
//
//  Created by Jesse Seidman on 8/2/22.
//

import Foundation

public class Reduced<T: Equatable>: Scalar {

  private let iterable: any Iterable<any Scalar<T>>
  private let function: any BiFunc<T,T,T>

  public init(iterable: any Iterable<any Scalar<T>>, function: any BiFunc<T, T, T>) {
    self.iterable = iterable
    self.function = function
  }

  public convenience init(
    iterable: any Iterable<any Scalar<T>>,
    _ closure: @escaping (T, T) throws -> T
  ) {
    self.init(
      iterable: iterable,
      function: BiFuncSmart(closure: closure)
    )
  }

  public convenience init(
    _ items: any Scalar<T>...,
    closure: @escaping (T, T) throws -> T
  ) {
    self.init(
      iterable: items,
      function: BiFuncSmart(closure: closure)
    )
  }

  public func value() throws -> T {
    let i = iterable.iterator()

    if !i.hasNext() {
      throw StandardException("Can't find first element in empty iterable")
    }

    var item = try i.next().value()
    while i.hasNext() {
      let next = try i.next().value()
      item = try self.function.apply(first: item, second: next)
    }

    return item
  }
}

