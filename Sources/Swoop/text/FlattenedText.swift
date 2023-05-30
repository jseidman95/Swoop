//
//  FlattenedText.swift
//
//
//  Created by Jesse Seidman on 5/25/23.
//

import Foundation

public class FlattenedText: TextEnvelope {

  public convenience init(scalar: any Scalar<Text>) {
    self.init(
      text: TextOf(
        text: MappedText(
          fnc: FuncSmart { input in
            return input
          },
          text: TextSmart {
            return try scalar.value().asString()
          }
        )
      )
    )
  }
}
