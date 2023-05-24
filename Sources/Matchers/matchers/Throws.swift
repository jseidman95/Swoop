//
//  Throws.swift
//
//
//  Created by Jesse Seidman on 5/23/23.
//

import Swoop

public class Throws<T>: Matcher {
  
  private let matcher: any Matcher<String>
  private let t: AnyClass.Type
  
  public init(matcher: any Matcher<String>, type: AnyClass.Type) {
    self.matcher = matcher
    self.t = type
  }
  
  public func matches(item: any Scalar<T>) -> Bool {
    var matches: Bool
    do {
      _ = try item.value()
      matches = false
    } catch let error {
      // This can prob be done better but idk how
      if type(of: type(of: error)) == t && matcher.matches(item: (error as? Exception)?.description() ?? "") {
        matches = true
      } else {
        matches = false
      }
    }
    
    return matches
  }
  
  public func description() -> String {
    return "Exception has type \(t) and message matches \(matcher.description())"
  }
  
  public func mismatchDescription(item: any Scalar<T>) -> String {
    return "Exception doesn't match or exception wasn't thrown"
  }
}

extension Throws {
  
  public convenience init(msg: String, type: AnyClass.Type) {
    self.init(matcher: IsEqual(value: msg), type: type)
  }
  
  public convenience init(type: AnyClass.Type) {
    self.init(matcher: IsAnything(), type: type)
  }
}
