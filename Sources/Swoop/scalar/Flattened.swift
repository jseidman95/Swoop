//
//  Flattened.swift
//
//
//  Created by Jesse Seidman on 5/23/23.
//


public class Flattened<X>: ScalarEnvelope<X> {

  public convenience init(_ scalar: any Scalar<any Scalar<X>>) {
    self.init(
      scalar: ScalarSmart {
        try scalar.value().value()
      }
    )
  }
}
