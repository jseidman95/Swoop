//
//  ReducedInto.swift
//
//
//  Created by Jesse Seidman on 5/28/23.
//

import Foundation

public class ReducedInto<T,V>: Scalar {

  private let initial: V
  private let iterable: any Iterable<T>
  private let function: any BiFunc<T,V,V>

  public init(
    initial: V,
    _ iterable: any Iterable<T>,
    function: any BiFunc<T, V, V>
  ) {
    self.iterable = iterable
    self.function = function
    self.initial = initial
  }

  public func value() throws -> V {
    let i = iterable.iterator()

    if !i.hasNext() {
      throw StandardException("Can't find first element in empty iterable")
    }

    var ret = try function.apply(
      first: i.next(),
      second: initial
    )
    
    while i.hasNext() {
      let next = i.next()
      ret = try self.function.apply(first: next, second: ret)
    }

    return ret
  }
}

extension ReducedInto {
  
  public convenience init(
    initial: V,
    _ iterable: any Iterable<T>,
    closure: @escaping (T, V) throws -> V
  ) {
    self.init(
      initial: initial,
      iterable,
      function: BiFuncSmart(closure: closure)
    )
  }

  public convenience init(
    initial: V,
    _ items: T...,
    closure: @escaping (T, V) throws -> V
  ) {
    self.init(
      initial: initial,
      items,
      function: BiFuncSmart(closure: closure)
    )
  }
}
