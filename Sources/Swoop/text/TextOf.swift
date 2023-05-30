//
//  TextOf.swift
//  
//
//  Created by Jesse Seidman on 8/8/22.
//

import Foundation

public class TextOf: Text {
  
  private let text: Text
  
  public init(text: Text) {
    self.text = text
  }
  
  public func asString() throws -> String {
    return try text.asString()
  }
}

extension TextOf {
  
  public convenience init(_ string: String) {
    self.init(
      text: TextSmart {
        string
      }
    )
  }
}
