//
//  FlattenedFunc.swift
//
//
//  Created by Jesse Seidman on 5/30/23.
//

import Foundation

public class FlattenedFunc<X, Y>: FuncEnvelope<X, Y> {

  public convenience init(sclr: any Func<X, any Scalar<Y>>) {
    self.init(
      fnc: FuncSmart { input in
        try sclr.apply(input: input).value()
      }
    )
  }
}
