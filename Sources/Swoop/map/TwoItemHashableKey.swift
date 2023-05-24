//
//  TwoItemHashableKey.swift
//
//
//  Created by Jesse Seidman on 5/24/23.
//

public class TwoItemHashableKey<X: Hashable, Y: Hashable>: Hashable {

  private let value: Int
  
  public init(value: Int) {
    self.value = value
  }
  
  public convenience init(first: X, second: Y) {
    self.init(
      value: {
        var hasher = Hasher()
        first.hash(into: &hasher)
        second.hash(into: &hasher)
        return hasher.finalize()
      }()
    )
  }
  
  public static func == (lhs: TwoItemHashableKey<X, Y>, rhs: TwoItemHashableKey<X, Y>) -> Bool {
    return lhs.value == rhs.value
  }
  
  public var hashValue: Int {
    return value
  }
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(value)
  }
}
