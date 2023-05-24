//
//  StickyBiFunc.swift
//
//
//  Created by Jesse Seidman on 5/24/23.
//

public class StickyBiFunc<X: Hashable, Y: Hashable, Z>: BiFunc {
  
  private let biFunc: any BiFunc<X, Y, Z>
  private var cache: Dictionary<TwoItemHashableKey<X,Y>,Z>
  private let size: Int
  
  public init(
    biFunc: any BiFunc<X, Y, Z>,
    cache: Dictionary<TwoItemHashableKey<X, Y>, Z>,
    size: Int
  ) {
    self.biFunc = biFunc
    self.cache = cache
    self.size = size
  }
  
  public convenience init(
    biFunc: any BiFunc<X, Y, Z>,
    size: Int = .max
  ) {
    self.init(
      biFunc: biFunc,
      cache: [:],
      size: size
    )
  }
  
  public func apply(first: X, second: Y) throws -> Z {
    let key = TwoItemHashableKey(first: first, second: second)
    var iterator = cache.makeIterator()
    
    while cache.count > size {
      cache.removeValue(forKey: iterator.next()!.key)
    }
    
    if cache[key] == nil {
      cache[key] = try biFunc.apply(first: first, second: second)
    }
    
    return cache[key]!
  }
}
