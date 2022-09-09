//
//  Text.swift
//  
//
//  Created by Jesse Seidman on 8/2/22.
//

import Foundation

public protocol Text {
  func asString() throws -> String
}

public class TextSmart: Text {
  
  private let asStringClosure: () throws -> String
  
  public init(asStringClosure: @escaping () throws -> String) {
    self.asStringClosure = asStringClosure
  }
  
  public func asString() throws -> String {
    return try asStringClosure()
  }
}
