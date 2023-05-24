//
//  IterableEnvelope.swift
//
//
//  Created by Jesse Seidman on 5/23/23.
//

public class IterableEnvelope<X>: Iterable {
  
  public typealias Element = X

  private let wrapped: any Iterable<X>
  
  public init(iterable: any Iterable<X>) {
    self.wrapped = iterable
  }
  
  public func iterator() -> any IteratorProtocol<X> {
    return wrapped.iterator()
  }
}
