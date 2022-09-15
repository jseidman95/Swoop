//
//  MatcherEnvelope.swift
//  
//
//  Created by Jesse Seidman on 9/8/22.
//

import Foundation

open class MatcherEnvelope<T>: Matcher {

  private let matcher: any Matcher<T>

  init(matcher: any Matcher<T>) {
    self.matcher = matcher
  }

  open func matches(item: T) -> Bool {
    matcher.matches(item: item)
  }

  open func description() -> String {
    matcher.description()
  }

  open func mismatchDescription(item: T) -> String {
    matcher.mismatchDescription(item: item)
  }
}
