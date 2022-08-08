//
//  ListExtensions.swift
//  
//
//  Created by Jesse Seidman on 8/8/22.
//

import Foundation

extension List {
  
  subscript(index: Int) -> Element {
    get {
      return element(atIndex: index)
    }
    
    set {
      set(element: newValue, atIndex: index)
    }
  }
}

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
}
