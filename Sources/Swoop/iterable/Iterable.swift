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
  func next() -> Element
}

public protocol Iterable<Element> {
  associatedtype Element

  func iterator() -> any IteratorProtocol<Element>
}

public class IterableSmart<X>: Iterable {
  
  private let iteratorClosure: () -> any IteratorProtocol<X>
  
  init(iteratorClosure: @escaping () -> any IteratorProtocol<X>) {
    self.iteratorClosure = iteratorClosure
  }
  
  public func iterator() -> any IteratorProtocol<X> {
    return iteratorClosure()
  }
}

public class IteratorProtocolSmart<X>: IteratorProtocol {
  
  private let hasNextClosure: () -> Bool
  private let nextClosure: () -> X
  
  public init(hasNextClosure: @escaping () -> Bool, nextClosure: @escaping () -> X) {
    self.hasNextClosure = hasNextClosure
    self.nextClosure = nextClosure
  }
  
  public func hasNext() -> Bool {
    return hasNextClosure()
  }
  
  public func next() -> X {
    return nextClosure()
  }
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

    func next() -> Element {
      currentIndex += 1

      if currentIndex >= arr.count {
        fatalError("Array Index out of bounds")
      }

      return arr[currentIndex]
    }
  }
}
