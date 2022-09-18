//
//  ListEnvelope.swift
//  
//
//  Created by Jesse Seidman on 9/14/22.
//

import Foundation

open class ListEnvelope<E>: List {

  private var list: any List<E>

  init(list: any List<E>) {
    self.list = list
  }

  open func add(element: E) {
    list.add(element: element)
  }

  open func add(collection: any List<E>) {
    list.add(collection: collection)
  }

  open func set(element: E, atIndex index: Int) throws {
    try list.set(element: element, atIndex: index)
  }

  open func element(atIndex index: Int) throws -> E {
    return try list.element(atIndex: index)
  }

  open func isEmpty() -> Bool {
    return list.isEmpty()
  }

  open func count() -> Int {
    return list.count()
  }

  open func contains(where predicate: (E) throws -> Bool) rethrows -> Bool {
    return try list.contains(where: predicate)
  }

  open func contains(allIn l: any List<E>, where predicate: (E) throws -> Bool) rethrows -> Bool {
    return try list.contains(allIn: l, where: predicate)
  }

  open func iterator() -> any IteratorProtocol<E> {
    return list.iterator()
  }

  open func remove(atIndex index: Int) throws {
    try list.remove(atIndex: index)
  }
}
