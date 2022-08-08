//
//  Xor.swift
//  
//
//  Created by Jesse Seidman on 8/7/22.
//

import Foundation

public class Xor: Scalar {
  
  private let scalar: any Scalar<Bool>
  
  private init(_ scalar: any Scalar<Bool>) {
    self.scalar = scalar
  }
  
  public func value() throws -> Bool {
    return try scalar.value()
  }
}

extension Xor {
  
  public convenience init(iterable: any Iterable<any Scalar<Bool>>) {
    self.init(
      Reduced(Joined(item: False(), items: iterable)) { lhs, rhs in
        return (lhs && !rhs) || (!lhs && rhs)
      }
    )
  }
  
  public convenience init(_ scalars: any Scalar<Bool>...) {
    self.init(
      iterable: IterableOf(
        itr: ScalarSmart {
          IteratorOf(scalars)
        }
      )
    )
  }
}
