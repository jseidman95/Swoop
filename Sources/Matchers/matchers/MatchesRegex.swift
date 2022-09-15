//
//  MatchesRegex.swift
//  
//
//  Created by Jesse Seidman on 9/9/22.
//

import Foundation
import Swoop

public class MatchesRegex<T: Text>: MatcherEnvelope<T> {

  public convenience init(regex: Text) {
    self.init(
      matcher: TextMatcher(
        text: regex,
        f: BiFuncSmart { act, txt in
          let regex = try NSRegularExpression(pattern: txt)
          let match = regex.firstMatch(in: act, range: NSRange(act.startIndex..., in: act))
          return match != nil
        },
        expected: "Text matches"
      )
    )
  }

  public convenience init(regex: String) {
    self.init(
      regex: TextSmart { regex }
    )
  }
}
