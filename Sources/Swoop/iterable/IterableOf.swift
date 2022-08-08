//
//  IterableOf.swift
//  
//
//  Created by Jesse Seidman on 8/3/22.
//

import Foundation

public class IterableOf<X>: Iterable {

  private let itr: any Scalar<any IteratorProtocol<X>>

  public init(itr: any Scalar<any IteratorProtocol<X>>) {
    self.itr = itr
  }

  public func iterator() -> any IteratorProtocol<X> {
    return Unchecked(itr).value()
  }
}

extension IterableOf {

  public convenience init(iterator: any IteratorProtocol<X>) {
    self.init(
      itr: ScalarSmart {
        return iterator
      }
    )
  }
  
  public convenience init(list: any List<X>) {
    self.init(
      iterator: IteratorOf(list: list)
    )
  }

  public convenience init(_ items: X...) {
    self.init(list: items)
  }
}
