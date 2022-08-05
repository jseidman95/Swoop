//
//  Ternary.swift
//  
//
//  Created by Jesse Seidman on 8/4/22.
//

import Foundation

public class Ternary<T>: Scalar {

  private let val: any Scalar<T>

  private init(val: any Scalar<T>) {
    self.val = val
  }

  public convenience init<U>(
    input: any Scalar<U>,
    condition: any Func<U, Bool>,
    consequent: any Func<U, T>,
    alternative: any Func<U, T>
  ) {
    self.init(
      val: ScalarSmart {
        if try condition.apply(input: input.value()) {
          return try consequent.apply(input: input.value())
        } else {
          return try alternative.apply(input: input.value())
        }
      }
    )
  }

  public convenience init<U>(
    input: U,
    condition: any Func<U, Bool>,
    consequent: any Func<U, T>,
    alternative: any Func<U, T>
  ) {
    self.init(
      input: Constant(input),
      condition: condition,
      consequent: consequent,
      alternative: alternative
    )
  }

  public convenience init(
    condition: any Scalar<Bool>,
    consequent: any Scalar<T>,
    alternative: any Scalar<T>
  ) {
    self.init(
      input: Object(),
      condition: FuncOf(scalar: condition),
      consequent: FuncOf(scalar: consequent),
      alternative: FuncOf(scalar: alternative)
    )
  }

  public convenience init(
    condition: Bool,
    consequent: any Scalar<T>,
    alternative: any Scalar<T>
  ) {
    self.init(
      condition: Constant(condition),
      consequent: consequent,
      alternative: alternative
    )
  }

  public convenience init(
    condition: any Scalar<Bool>,
    consequent: T,
    alternative: T
  ) {
    self.init(
      condition: condition,
      consequent: Constant(consequent),
      alternative: Constant(alternative)
    )
  }

  public convenience init(
    condition: Bool,
    consequent: T,
    alternative: T
  ) {
    self.init(
      condition: condition,
      consequent: Constant(consequent),
      alternative: Constant(alternative)
    )
  }

  public func value() throws -> T {
    return try val.value()
  }
}

private extension Ternary {

  class Object {}
}
