//
//  EqualsValues.swift
//  
//
//  Created by Jesse Seidman on 9/14/22.
//

import Foundation
import Swoop

public class EqualsValues<E>: MatcherEnvelope<any Iterable<E>> where E: Equatable {

  public convenience init(_ values: any Iterable<E>) {
    self.init(
      matcher: MatcherOf(
        match: FuncSmart { input in
          let org = values.iterator()
          let inp = input.iterator()
          var mismatch = false

          while org.hasNext() && inp.hasNext() {
            if org.next() != inp.next() {
              mismatch = true
            }
          }

          return !mismatch && !org.hasNext() && !inp.hasNext()
        },
        description: TextSmart {
          "All values in \(values) match"
        },
        mismatch: FuncSmart { input in
          "Values in input \(input) don't match values: \(values)"
        }
      )
    )
  }
}
