//
//  Abbreviated.swift
//
//
//  Created by Jesse Seidman on 5/24/23.
//

import Foundation

public class Abbreviated: TextEnvelope {
  
  private static let maxWidth = 80
  
  private static let ellipses = "..."
  
  public convenience init(_ text: Text, max: Int) {
    self.init(
      text: FlattenedText(
        scalar: Ternary(
          ScalarOf(
            ScalarSmart {
              return StickyText(text)
            }
          ),
          FuncSmart { t in
            try LengthOf(t).value() <= max
          },
          FuncSmart { t in
            return t
          },
          FuncSmart { t in
            return JoinedText(
              Sub(
                text: t,
                start: 0,
                finish: max - Abbreviated.ellipses.count - 1
              ),
              TextOf(Abbreviated.ellipses)
            )
          }
        )
      )
    )
  }
  
  public convenience init(_ text: String, max: Int) {
    self.init(TextOf(text), max: max)
  }
  
  public convenience init(_ text: Text) {
    self.init(text, max: Abbreviated.maxWidth);
  }

  public convenience init(_ text: String) {
    self.init(TextOf(text))
  }
}

