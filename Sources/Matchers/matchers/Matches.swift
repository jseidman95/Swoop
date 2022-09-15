//
//  Matches.swift
//  
//
//  Created by Jesse Seidman on 8/18/22.
//

import Foundation

public class Matches<Y>: Matcher {

  public typealias X = any Matcher<Y>

  private let args: Y

  public init(_ args: Y) {
    self.args = args
  }

  public func matches(item: X) -> Bool {
    return item.matches(item: args)
  }

  public func description() -> String {
    return String(describing: args)
  }

  public func mismatchDescription(item: X) -> String {
    return item.mismatchDescription(item: args)
  }
}

public class Mismatches<Y>: Matcher {

  public typealias X = any Matcher<Y>

  private let args: Y

  public init(_ args: Y) {
    self.args = args
  }

  public func matches(item: X) -> Bool {
    return !item.matches(item: args)
  }

  public func description() -> String {
    return String(describing: args)
  }

  public func mismatchDescription(item: X) -> String {
    return item.mismatchDescription(item: args)
  }
}
