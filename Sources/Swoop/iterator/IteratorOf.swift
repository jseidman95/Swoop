//
//  IteratorOf.swift
//  
//
//  Created by Jesse Seidman on 8/3/22.
//

import Foundation

public class IteratorOf<T>: IteratorProtocol {

  private var position: Int
  private let list: [T]

  public init(_ list: [T]) {
    self.list = list
    self.position = 0
  }

  public func hasNext() -> Bool {
    position < list.count
  }

  public func next() throws -> T {
    if !hasNext() {
      throw StandardException("Iterator is empty!")
    }

    let pos = position
    position += 1
    return list[pos]
  }
}
