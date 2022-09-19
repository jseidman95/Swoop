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

  public func value() throws -> T {
    return try val.value()
  }
}

extension Ternary {
  
  private class Object {}
  
  public convenience init<U>(
    _ input: any Scalar<U>,
    _ condition: any Func<U, Bool>,
    _ consequent: any Func<U, T>,
    _ alternative: any Func<U, T>
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
    _ input: U,
    _ condition: any Func<U, Bool>,
    _ consequent: any Func<U, T>,
    _ alternative: any Func<U, T>
  ) {
    self.init(
      Constant(input),
      condition,
      consequent,
      alternative
    )
  }

  public convenience init(
    _ condition: any Scalar<Bool>,
    _ consequent: any Scalar<T>,
    _ alternative: any Scalar<T>
  ) {
    self.init(
      Object(),
      FuncOf(scalar: condition),
      FuncOf(scalar: consequent),
      FuncOf(scalar: alternative)
    )
  }

  public convenience init(
    _ condition: Bool,
    _ consequent: any Scalar<T>,
    _ alternative: any Scalar<T>
  ) {
    self.init(
      Constant(condition),
      consequent,
      alternative
    )
  }

  public convenience init(
    _ condition: any Scalar<Bool>,
    _ consequent: T,
    _ alternative: T
  ) {
    self.init(
      condition,
      Constant(consequent),
      Constant(alternative)
    )
  }

  public convenience init(
    _ condition: Bool,
    _ consequent: T,
    _ alternative: T
  ) {
    self.init(
      condition,
      Constant(consequent),
      Constant(alternative)
    )
  }
}
