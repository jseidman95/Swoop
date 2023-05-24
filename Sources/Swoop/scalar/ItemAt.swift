//
//  ItemAt.swift
//
//
//  Created by Jesse Seidman on 5/24/23.
//

import Foundation

public class ItemAt<T>: ScalarEnvelope<T> {

  public convenience init(
    position: Int,
    fallback: any Func<any Iterable<T>, T>,
    iterable: any Iterable<T>
  ) {
    self.init(
      scalar: StickyScalar<T>(
        scalar: ScalarSmart<T> {
          if position < 0 {
            throw StandardException("Position must be non negative \(position)")
          }
          
          let iterator = iterable.iterator()
          var cur: Int = 0
          
          while cur < position && iterator.hasNext() {
            cur += 1
            _ = iterator.next()
          }
          
          let ret: T
          if cur == position && iterator.hasNext() {
            ret = iterator.next()
          } else {
            ret = try fallback.apply(input: IterableOf(iterator: iterator))
          }
          
          return ret
        }
      )
    )
  }
}

extension ItemAt {
  
  public convenience init(position: Int, iterable: any Iterable<T>) {
    self.init(
      position: position,
      fallback: FuncSmart { itr in
        throw StandardException("The iterable doesn't have the position \(position)")
      },
      iterable: iterable
    )
  }
  
  public convenience init(
    position: Int,
    fallback: T,
    iterable: any Iterable<T>
  ) {
    self.init(
      position: position,
      fallback: FuncOf(scalar: Constant(fallback)),
      iterable: iterable
    )
  }
}
