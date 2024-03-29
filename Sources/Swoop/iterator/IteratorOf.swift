//
//  IteratorOf.swift
//  
//
//  Created by Jesse Seidman on 8/3/22.
//

import Foundation

public class IteratorOf<T>: IteratorProtocol {

  private var position: Int
  private let list: any List<T>
  
  public init(list: any List<T>) {
    self.list = list
    self.position = 0
  }

  public func hasNext() -> Bool {
    position < list.count()
  }

  public func next() -> T {
    if !hasNext() {
      fatalError("Iterator is empty!")
    }

    let pos = position
    position += 1
    return try! list.element(atIndex: pos)
  }
}

extension IteratorOf {
  
  public convenience init(arr: [T]) {
    self.init(list: arr)
  }

  public convenience init(_ items: T...) {
    self.init(arr: items)
  }
}
