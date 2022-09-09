//
//  UncheckedText.swift
//  
//
//  Created by Jesse Seidman on 8/23/22.
//

import Foundation

public class UncheckedText: Text {

  private let text: Text
  private let fallback: any Func<Exception, String>

  public init(text: Text, fallback: any Func<Exception, String>) {
    self.text = text
    self.fallback = fallback
  }

  public func asString() -> String {
    return ":"
  }
}
