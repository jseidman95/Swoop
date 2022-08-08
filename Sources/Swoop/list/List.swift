//
//  List.swift
//  
//
//  Created by Jesse Seidman on 8/7/22.
//

import Foundation

public protocol List<Element>: Iterable {
  associatedtype Element
  
  mutating func add(element: Element)
  mutating func add(collection: any List<Element>)
  mutating func set(element: Element, atIndex index: Int)
  func element(atIndex index: Int) -> Element
  func isEmpty() -> Bool
  func count() -> Int
}
