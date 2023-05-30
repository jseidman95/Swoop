//
//  TextEnvelope.swift
//  
//
//  Created by Jesse Seidman on 9/18/22.
//

import Foundation

public class TextEnvelope: Text {
  
  private let text: Text
  
  internal init(text: Text) {
    self.text = text
  }
  
  public func asString() throws -> String {
    return try text.asString()
  }
}
