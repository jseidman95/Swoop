//
//  IsText.swift
//  
//
//  Created by Jesse Seidman on 8/18/22.
//

import Foundation
import Swoop

public class IsText<T: Text>: MatcherEnvelope<T> {

  public convenience init(_ text: Text) {
    self.init(
      matcher: TextMatcher(
        text: text,
        f: BiFuncSmart { act, txt in
          return act == txt
        },
        expected: "Text with value"
      )
    )
  }

  public convenience init(string: String) {
    self.init(TextOf(string))
  }
}
