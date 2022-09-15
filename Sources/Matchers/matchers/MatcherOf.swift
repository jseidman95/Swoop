//
//  MatcherOf.swift
//  
//
//  Created by Jesse Seidman on 8/18/22.
//

import Foundation
import Swoop

public class MatcherOf<T>: Matcher {

  private let match: any Func<T, Bool>
  private let desc: Text
  private let mismatch: any Func<T, String>

  public init(match: any Func<T, Bool>, description: Text, mismatch: any Func<T, String>) {
    self.match = match
    self.desc = description
    self.mismatch = mismatch
  }

  public func matches(item: T) -> Bool {
    return UncheckedFunc(match).apply(input: item)
  }

  public func description() -> String {
    return try! desc.asString()
  }

  public func mismatchDescription(item: T) -> String {
    return try! mismatch.apply(input: item)
  }
}
