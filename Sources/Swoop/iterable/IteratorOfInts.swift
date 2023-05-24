//
//  IterableEnvelope.swift
//
//
//  Created by Jesse Seidman on 5/23/23.
//

import Foundation

public class IteratorOfInts: IteratorProtocol {

  private let items: [Int]
  private var position: Int
  
  public init(items: [Int], position: Int) {
    self.items = items
    self.position = position
  }
  
  public func hasNext() -> Bool {
    position < items.count()
  }
  
  public func next() -> Int {
    let pos = position
    position += 1
    
    return items[pos]
  }
}

public extension IteratorOfInts {
  
  public convenience init(items: [Int]) {
    self.init(items: items, position: 0)
  }
}
