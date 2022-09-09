//
//  MappedIteratable.swift
//  
//
//  Created by Jesse Seidman on 9/8/22.
//

import Foundation

public class MappedIteratable<Y>: Iterable {

  private let iterable: any Iterable<Y>

  private init(iterable: any Iterable<Y>) {
    self.iterable = iterable
  }

  public func iterator() -> any IteratorProtocol<Y> {
    return iterable.iterator()
  }
}

public extension MappedIteratable {

  convenience init<X>(fnc: any Func<X, Y>, src: any Iterable<X>) {
    self.init(
      iterable: IterableOf(
        iterator: MappedIterator(fnc: fnc, itr: src.iterator())
      )
    )
  }
}
