//
//  HighestOf.swift
//
//
//  Created by Jesse Seidman on 5/24/23.
//

import Foundation

public class HighestOf<T: Comparable>: ScalarEnvelope<T> {
  
  public convenience init(_ items: T...) {
    self.init(
      iterable: MappedIterable(
        FuncSmart { item in return ScalarSmart { item } },
        items
      )
    )
  }
  
  public convenience init(_ scalars: any Scalar<T>...) {
    self.init(
      iterable: IterableOf(list: scalars)
    )
  }
  
  public convenience init(iterable: any Iterable<any Scalar<T>>) {
    self.init(
      scalar: Reduced(
        iterable,
        function: BiFuncSmart { first, second in
          let val: T
          if first > second {
            val = first
          } else {
            val = second
          }
          
          return val
        }
      )
    )
  }
}
