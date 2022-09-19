//
//  MappedIterable.swift
//  
//
//  Created by Jesse Seidman on 9/8/22.
//

import Foundation

public class MappedIterable<Y>: Iterable {

  private let iterable: any Iterable<Y>

  private init(iterable: any Iterable<Y>) {
    self.iterable = iterable
  }

  public func iterator() -> any IteratorProtocol<Y> {
    return iterable.iterator()
  }
}

public extension MappedIterable {
  
  convenience init<X>(_ fnc: any Func<X, Y>, _ src: any Iterable<X>) {
    self.init(
      iterable: IterableOf(
        iterator: MappedIterator(
          fnc: fnc,
          itr: src.iterator()
        )
      )
    )
  }

  convenience init<X>(_ fnc: any Func<X, Y>, _ src: X...) {
    self.init(
      fnc,
      IterableOf(arr: src)
    )
  }
}
