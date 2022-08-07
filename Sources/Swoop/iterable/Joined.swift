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
  
  public func iterator() -> any IteratorProtocol<X> {
    return itr.iterator()
  }
}

extension Joined {
  
  public convenience init(item: X, items: any Iterable<X>) {
    self.init(
      IterableOf(IterableOf(item), items)
    )
  }
  
  public convenience init(_ itr: any Iterable<any Iterable<X>>) {
    self.init(
      itr: IterableSmart {
        let outer = itr.iterator()
        
        // Empty array
        if !outer.hasNext() {
          return IteratorProtocolSmart(
            hasNextClosure: { return false },
            nextClosure: { fatalError("Array index out of bounds - Need at least one item in the iterable") }
          )
        } else {
          var inner = outer.next().iterator()

          while !inner.hasNext() {
            if outer.hasNext() {
              // item is empty but there is a next item
              inner = outer.next().iterator()
            } else {
              // item is empty and there is no next item
              return IteratorProtocolSmart(
                hasNextClosure: { return false },
                nextClosure: { fatalError("Array index out of bounds") }
              )
            }
          }
          
          return IteratorProtocolSmart(
            hasNextClosure: {
              return inner.hasNext()
            },
            nextClosure: {
              let next = inner.next()

              while !inner.hasNext() {
                if outer.hasNext() {
                  inner = outer.next().iterator()
                } else {
                  break
                }
              }

              return next
            }
          )
        }
      }
    )
  }
}
