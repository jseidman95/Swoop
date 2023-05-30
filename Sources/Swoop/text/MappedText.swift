//
//  MappedText.swift
//
//
//  Created by Jesse Seidman on 5/25/23.
//

import Foundation

public class MappedText: TextEnvelope {

  public convenience init(
    fnc: any Func<String, String>,
    text: Text
  ) {
    self.init(
      text: TextOf(
        text: TextSmart {
          return try fnc.apply(input: text.asString())
        }
      )
    )
  }
}
