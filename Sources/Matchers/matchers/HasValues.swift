//
//  HasValues.swift
//  
//
//  Created by Jesse Seidman on 8/18/22.
//

import Foundation
import Swoop

public class HasValues<X: Equatable>: MatcherEnvelope<any Iterable<X>> {

  public convenience init(expected: any Iterable<X>) {
    self.init(
      matcher: MatcherOf(
        match: FuncSmart { actual in
          let ac = ListOf(itr: actual)

          return ac.contains(
            allIn: ListOf(itr: expected),
            where: { e in
              return ac.contains(where: { $0 == e })
            }
          )
        },
        description: TextOf("contains \(expected)"),
        mismatch: FuncSmart { actual in
          return "was \(actual)"
        }
      )
    )
  }

  public convenience init(_ e: X...) {
    self.init(expected: IterableOf(arr: e))
  }
}
