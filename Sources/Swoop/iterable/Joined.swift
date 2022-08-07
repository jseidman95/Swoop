//
//  Joined.swift
//  
//
//  Created by Jesse Seidman on 8/7/22.
//

import Foundation

public class Joined<X>: Iterable {
  
  private let itr: any Iterable<X>
  
  private init(itr: any Iterable<X>) {
    self.itr = itr
  }
  
  public convenience init(_ itr: any Iterable<any Iterable<X>>) {
    self.init(
      itr: IterableSmart {
        var i: any IteratorProtocol<X>
        let outer = itr.iterator()
        if !outer.hasNext() {
          i = IteratorProtocolSmart(
            hasNextClosure: { return false },
            nextClosure: { fatalError("Array index out of bounds") }
          )
        } else {
          var inner = outer.next().iterator()
          i = IteratorProtocolSmart(
            hasNextClosure: {
              return inner.hasNext() || outer.hasNext()
            },
            nextClosure: {
              while !inner.hasNext() {
                if outer.hasNext() {
                  inner = outer.next().iterator()
                } else {
                  fatalError("Array index out of bounds")
                }
              }

              return inner.next()
            }
          )
        }
        
        return i
      }
    )
  }
  
  public convenience init(item: X, items: any Iterable<X>) {
    self.init(
      IterableOf(IterableOf(item), items)
    )
  }
  
  public func iterator() -> any IteratorProtocol<X> {
    return itr.iterator()
  }
}
