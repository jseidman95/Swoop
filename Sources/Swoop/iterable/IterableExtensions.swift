//
//  IterableExtensions.swift
//  
//
//  Created by Jesse Seidman on 8/8/22.
//

import Foundation

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

    func next() -> Element {
      currentIndex += 1

      if currentIndex >= arr.count {
        fatalError("Array Index out of bounds")
      }

      return arr[currentIndex]
    }
  }
}
