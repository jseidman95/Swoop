//
//  IsBlank.swift
//  
//
//  Created by Jesse Seidman on 9/8/22.
//

import Foundation
import Swoop

public class IsBlank<T: Text>: MatcherEnvelope<T> {

  public convenience init() {
    self.init(
      matcher: TextMatcher(
        text: TextSmart { "" },
        f: BiFuncSmart { $0 == $1 },
        expected: "expected string to be empty"
      )
    )
  }
}
