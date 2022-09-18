//
//  ListExtensions.swift
//  
//
//  Created by Jesse Seidman on 8/8/22.
//

import Foundation

extension Array: List {

  public mutating func set(element: Element, atIndex index: Int) {
    self[index] = element
  }
  
  public func element(atIndex index: Int) -> Element {
    return self[index]
  }
  
  public mutating func add(element: Element) {
    append(element)
  }
  
  public mutating func add(collection: any List<Element>) {
    let itr = collection.iterator()
    while itr.hasNext() {
      add(element: itr.next())
    }
  }
  
  public func isEmpty() -> Bool {
    return self.isEmpty
  }
  
  public func count() -> Int {
    return self.count
  }

  public func contains(allIn l: any List<Element>, where predicate: (Element) throws -> Bool) rethrows -> Bool {
    let i = l.iterator()
    var contains = false
    while i.hasNext() {
      let n = i.next()
      let c = try predicate(n)
      contains = contains || c
    }

    return contains
  }

  public mutating func remove(atIndex index: Int) {
    remove(at: index)
  }
}
