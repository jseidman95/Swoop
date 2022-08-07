//
//  StandardException.swift
//  
//
//  Created by Jesse Seidman on 8/2/22.
//

import Foundation

public class StandardException: Exception, Error {

  private let message: String

  public init(_ message: String) {
    self.message = message
  }

  public func description() -> String {
    return message
  }
}

extension StandardException {
  
  public convenience init(_ message: String, wrapping exception: Exception) {
    self.init(
      "\(message)\n\(exception.description())"
    )
  }
}
