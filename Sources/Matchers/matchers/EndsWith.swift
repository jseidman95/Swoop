//
//  EndsWith.swift
//
//
//  Created by Jesse Seidman on 9/6/22.
//

import Foundation
import Swoop

public class EndsWith<T: Text>: MatcherEnvelope<T> {

  public convenience init(text: Text) {
    self.init(
      matcher: TextMatcher(
        text: text,
        f: BiFuncSmart { act, txt in
          act.hasSuffix(try text.asString())
        },
        expected: "Text ending with"
      )
    )
  }

  public convenience init(string: String) {
    self.init(text: TextOf(string))
  }
}
