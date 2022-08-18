//
//  Joined.swift
//  
//
//  Created by Jesse Seidman on 8/7/22.
//

import Foundation

public class Joined<X>: List {

  private var list: any List<X>

  private init(list: any List<X>) {
    self.list = list
  }
  
  public func iterator() -> any IteratorProtocol<X> {
    return list.iterator()
  }
  
  public func add(element: X) {
    list.add(element: element)
  }
  
  public func add(collection: any List<X>) {
    list.add(collection: collection)
  }
  
  public func set(element: X, atIndex index: Int) {
    list.set(element: element, atIndex: index)
  }
  
  public func element(atIndex index: Int) -> X {
    return list.element(atIndex: index)
  }
  
  public func isEmpty() -> Bool {
    return list.isEmpty()
  }
  
  public func count() -> Int {
    return list.count()
  }
}

extension Joined {

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