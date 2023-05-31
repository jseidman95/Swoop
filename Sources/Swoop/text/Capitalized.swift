//
//  Capitalized.swift
//
//
//  Created by Jesse Seidman on 5/25/23.
//

import Foundation

public class Capitalized: TextEnvelope {

  public convenience init(_ text: Text) {
    self.init(
      text: FlattenedText(
        scalar: Ternary(
          ScalarSmart({ return StickyText(text)}),
          FlattenedFunc(
            sclr: FuncSmart { x in
              IsBlank(x)
            }
          ),
          FuncSmart { t in
            return t
          },
          FuncSmart { t in
            Concatenated(
              TextSmart {
                let str = try t.asString()
                return str[str.startIndex].uppercased()
              },
              TextSmart {
                try Ternary(
                  t,
                  FuncSmart { x in
                    return try LengthOf(x).value() == 1
                  },
                  FuncSmart<Text, Text> { _ in TextOf("") },
                  FuncSmart<Text, Text> { Sub(text: $0, start: 1) }
                ).value().asString()
              }
            )
          }
        )
      )
    )
  }
}
