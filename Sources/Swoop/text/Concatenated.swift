//
//  Concatenated.swift
//
//
//  Created by Jesse Seidman on 5/30/23.
//

import Foundation

public class Concatenated: TextEnvelope {

  public convenience init(txts: any Iterable<Text>) {
    self.init(
      text: JoinedText(
        delimit: TextOf(""),
        texts: txts
      )
    )
  }

  public convenience init(_ strings: String...) {
    self.init(
      txts: MappedIterable(
        FuncSmart { TextOf($0) },
        IterableOf(arr: strings)
      )
    )
  }

  public convenience init(_ txts: Text...) {
    self.init(txts: IterableOf(arr: txts))
  }
}
