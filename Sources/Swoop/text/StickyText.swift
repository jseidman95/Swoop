//
//  Abbreviated.swift
//
//
//  Created by Jesse Seidman on 5/25/23.
//

import Foundation

public class StickyText: TextEnvelope {
  
  public convenience init(_ text: Text) {
    self.init(
      text: TextOfScalar(
        StickyScalar(
          scalar: ScalarSmart {
            try text.asString()
          }
        )
      )
    )
  }
}

