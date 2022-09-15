//
//  HasString.swift
//  
//
//  Created by Jesse Seidman on 9/6/22.
//

import Foundation
import Swoop

public class HasString<T: Text>: MatcherEnvelope<T> {

  public convenience init(_ string: String) {
    self.init(TextOf(string))
  }

  public convenience init(_ text: Text) {
    self.init(
      matcher: TextMatcher(
        text: text,
        f: BiFuncSmart { act, txt in
          act.contains(txt)
        },
        expected: "Text Containing"
      )
    )
  }
}
