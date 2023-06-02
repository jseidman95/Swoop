//
//  Lowered.swift
//
//
//  Created by Jesse Seidman on 9/18/22.
//

import Foundation

public class Lowered: TextEnvelope {
  
  public convenience init(_ text: Text) {
    self.init(
      text: TextSmart {
        return try text.asString().lowercased()
      }
    )
  }
}
