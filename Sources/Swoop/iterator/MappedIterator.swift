//
//  Mapped.swift
//  
//
//  Created by Jesse Seidman on 9/8/22.
//

import Foundation

public class MappedIterator<Y>: IteratorProtocol {

  private let iterator: any IteratorProtocol<Y>

  private init(iterator: any IteratorProtocol<Y>) {
    self.iterator = iterator
  }

  public func hasNext() -> Bool {
    return iterator.hasNext()
  }

  public func next() -> Y {
    return iterator.next()
  }
}

public extension MappedIterator {

  convenience init<X>(
    fnc: any Func<X, Y>,
    itr: any IteratorProtocol<X>
  ) {
    self.init(
      iterator: IteratorProtocolSmart(
        hasNextClosure: {
          itr.hasNext()
        },
        nextClosure: {
          if itr.hasNext() {
            return Unchecked(
              Mapped(
                fnc: fnc,
                scalar: ScalarSmart {
                  itr.next()
                }
              )
            ).value()
          } else {
            fatalError("Iterator is empty!")
          }
        }
      )
    )
  }
}
