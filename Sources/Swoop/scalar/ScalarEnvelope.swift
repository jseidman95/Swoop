//
//  ScalarEnvelope.swift
//
//
//  Created by Jesse Seidman on 5/23/23.
//

public class ScalarEnvelope<X>: Scalar {
  
  private let scalar: any Scalar<X>
  
  init(scalar: any Scalar<X>) {
    self.scalar = scalar
  }
  
  public func value() throws -> X {
    return try scalar.value()
  }
}
