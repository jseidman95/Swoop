//
//  TextEnvelope.swift
//
//
//  Created by Jesse Seidman on 5/23/23.
//

import Foundation

public class EquatableText: TextEnvelope, Equatable {
  
  convenience init(_ text: Text) {
    self.init(text: text)
  }
  
  public static func == (lhs: EquatableText, rhs: EquatableText) -> Bool {
    do {
      let left = try lhs.asString()
      let right = try rhs.asString()
      return left == right
    } catch {
      return false
    }
  }
}
