//
//  JoinedText.swift
//
//
//  Created by Jesse Seidman on 5/25/23.
//

import Foundation

public class JoinedText: TextEnvelope {

  public convenience init(
    delimit: Text,
    texts: any Iterable<Text>
  ) {
    self.init(
      text: TextOf(
        text: StickyText(
          TextSmart {
            var string = ""
            for (i, text) in texts.sequence().enumerated() {
              string.append("\(i == 0 ? "" : try delimit.asString())\(try text.asString())")
            }
            
            return string
          }
        )
      )
    )
  }
  
  public convenience init(delimit: String, _ texts: Text...) {
    self.init(
      delimit: TextOf(delimit),
      texts: IterableOf(arr: texts)
    )
  }

  public convenience init(delimit: Text, _ texts: Text...) {
    self.init(delimit: delimit, texts: IterableOf(arr: texts))
  }

  public convenience init(delimit: String, strings: any Iterable<String>) {
    self.init(
      delimit: TextOf(delimit),
      texts: MappedIterable(
        FuncSmart { TextOf($0) },
        strings
      )
    )
  }

  public convenience init(delimit: String, _ strings: String...) {
    self.init(delimit: delimit, strings: IterableOf(arr: strings))
  }
  
  public convenience init(_ strings: String...) {
    self.init(delimit: "", strings: strings)
  }
  
  public convenience init(_ texts: Text...) {
    self.init(delimit: TextOf(""), texts: IterableOf(arr: texts))
  }
}
