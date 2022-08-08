//
//  ListOf.swift
//  
//
//  Created by Jesse Seidman on 8/7/22.
//

import Foundation

public class ListOf<X>: List {

  private var list: any List<X>
  
  private init(list: any List<X>) {
    self.list = list
  }
  
  public func add(element: X) {
    list.add(element: element)
  }
  
  public func add(collection: any List<X>) {
    list.add(collection: collection)
  }
  
  public func isEmpty() -> Bool {
    return list.isEmpty()
  }
  
  public func count() -> Int {
    return list.count()
  }
  
  public func set(element: X, atIndex index: Int) {
    list.set(element: element, atIndex: index)
  }
  
  public func element(atIndex index: Int) -> X {
    return list.element(atIndex: index)
  }
  
  public func iterator() -> any IteratorProtocol<X> {
    return list.iterator()
  }
}

extension ListOf {
  
  public convenience init(itr: any Iterable<X>) {
    self.init(
      list: Array(itemsIn: itr)
    )
  }
  
  public convenience init(src: any IteratorProtocol<X>) {
    self.init(itr: IterableOf(iterator: src))
  }
  
  public convenience init(_ arr: X...) {
    self.init(
      itr: IterableOf(list: arr)
    )
  }
}

extension Array {
  
  init(itemsIn itr: any Iterable<Element>) {
    var items = [Element]()
    let i = itr.iterator()
    while i.hasNext() {
      items.append(i.next())
    }
    
    self.init(items)
  }
}
