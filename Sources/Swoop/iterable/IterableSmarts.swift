//
//  IterableSmarts.swift
//  
//
//  Created by Jesse Seidman on 8/8/22.
//

import Foundation

public class IterableSmart<X>: Iterable {
  
  private let iteratorClosure: () -> any IteratorProtocol<X>
  
  public init(iteratorClosure: @escaping () -> any IteratorProtocol<X>) {
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
