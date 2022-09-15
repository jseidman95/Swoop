//
//  Matcher.swift
//  
//
//  Created by Jesse Seidman on 8/4/22.
//

import Foundation
import Swoop

public protocol Matcher<T> {
  associatedtype T

  func matches(item: T) -> Bool
  func description() -> String
  func mismatchDescription(item: T) -> String
}
