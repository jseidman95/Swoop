//
//  Joined.swift
//  
//
//  Created by Jesse Seidman on 8/7/22.
//

import Foundation

public class Joined<X>: ListEnvelope<X> {

  public convenience init(_ src: any List<X>...) {
    self.init(IterableOf(list: src))
  }

  public convenience init(item: X, items: any List<X>) {
    self.init(ListOf(item), items)
  }

  public convenience init(_ src: any Iterable<any List<X>>) {
    self.init(
      list: ListOf(
        itr: IterableSmart {
          let outer = src.iterator()
          var arr = [X]()

          while outer.hasNext() {
            let inner = outer.next().iterator()
            while inner.hasNext() {
              arr.append(inner.next())
            }
          }

          return IteratorOf(arr: arr)
        }
      )
    )
  }
}
