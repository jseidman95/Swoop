//
//  Iterable.swift
//  
//
//  Created by Jesse Seidman on 8/2/22.
//

import Foundation

public protocol IteratorProtocol<Element> {
  associatedtype Element

  func hasNext() -> Bool
  func next() throws -> Element
}

public protocol Iterable<Element> {
  associatedtype Element

  func iterator() -> any IteratorProtocol<Element>
}

extension Array: Iterable {

  public func iterator() -> any IteratorProtocol<Element> {
    Iterator(arr: self)
  }

  class Iterator<Element>: IteratorProtocol {

    private var currentIndex: Int
    private let arr: Array<Element>

    init(
      currentIndex: Int = -1,
      arr: Array<Element>
    ) {
      self.currentIndex = currentIndex
      self.arr = arr
    }

    func hasNext() -> Bool {
      return (currentIndex + 1) < arr.count
    }

    func next() throws -> Element {
      currentIndex += 1

      if currentIndex >= arr.count {
        throw StandardException("Array Index out of bounds")
      }

      return arr[currentIndex]
    }
  }
}
