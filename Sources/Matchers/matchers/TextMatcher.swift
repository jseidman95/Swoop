//
//  TextMatcher.swift
//  
//
//  Created by Jesse Seidman on 8/18/22.
//

import Foundation
import Swoop

public class TextMatcher<T: Text>: Matcher {

  private let matcher: any Matcher<String>

  public init(matcher: any Matcher<String>) {
    self.matcher = matcher
  }

  public func matches(item: T) -> Bool {
    return matcher.matches(item: try! item.asString())
  }

  public func description() -> String {
    return matcher.description()
  }

  public func mismatchDescription(item: T) -> String {
    return matcher.mismatchDescription(item: try! item.asString())
  }
}

public extension TextMatcher {

  convenience init(
    text: Text,
    f: any BiFunc<String, String, Bool>,
    expected: String,
    actual: String
  ) {
    self.init(
      matcher: MatcherOf(
        match: FuncSmart { act in
          return try f.apply(
            first: act,
            second: text.asString()
          )
        },
        description: TextSmart {
          return try "\(expected) \(text.asString())"
        },
        mismatch: FuncSmart { act in
          return "\(actual) \(act)"
        }
      )
    )
  }

  convenience init(
    text: Text,
    f: any BiFunc<String, String, Bool> ,
    expected: String
  ) {
    self.init(
      text: text,
      f: f,
      expected: expected,
      actual: "was Text with value"
    )
  }
}
