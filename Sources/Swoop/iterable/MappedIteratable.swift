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

  convenience init<X>(fnc: any Func<X, Y>, src: any Iterable<X>) {
    self.init(
      iterable: IterableOf(
        iterator: MappedIterator(fnc: fnc, itr: src.iterator())
      )
    )
  }
}

//public <X> Mapped(
//        final Func<? super X, ? extends Y> fnc, final Iterable<? extends X> src
//    ) {
//        super(
//            new IterableOf<>(
//                () -> new org.cactoos.iterator.Mapped<>(fnc, src.iterator())
//            )
//        );
//    }
