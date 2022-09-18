//
//  LinkedList.swift
//  
//
//  Created by Jesse Seidman on 9/15/22.
//

import Foundation

public class LinkedList<X>: List {

  private let head: Node<X>
  private let tail: Node<X>
  private var size: Int

  private init(head: Node<X>, tail: Node<X>) {
    self.head = head
    self.tail = tail
  }

  private convenience init() {
    self.init(
      head: Node(value: <#T##X#>, next: <#T##Node<X>#>),
      tail: <#T##Node<X>#>
    )
  }

  public func add(element: X) {}
  public func add(collection: any List<X>) {}
  public func remove(atIndex index: Int) throws {}
  public func set(element: X, atIndex index: Int) throws {}

  public func element(atIndex index: Int) throws -> X {}
  public func isEmpty() -> Bool {}
  public func count() -> Int {}

  public func contains(where predicate: (X) throws -> Bool) rethrows -> Bool {}
  public func contains(allIn l: any List<X>, where predicate: (X) throws -> Bool) rethrows -> Bool {}
}

public extension LinkedList {

  class Node<X> {

    private let value: X
    private let next: Node<X>

    init(value: X, next: Node<X>) {
      self.value = value
      self.next = next
    }
  }
}
