//
//  IterableOfInts.swift
//
//
//  Created by Jesse Seidman on 5/23/23.
//

public class IterableOfInts: IterableEnvelope<Int> {
  
  public convenience init(_ values: Int...) {
    self.init(
      iterable: IterableSmart(
        iteratorClosure: {
          return IteratorOfInts(items: values)
        }
      )
    )
  }
}
