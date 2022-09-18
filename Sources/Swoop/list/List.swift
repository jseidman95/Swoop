//
//  List.swift
//  
//
//  Created by Jesse Seidman on 8/7/22.
//

import Foundation

public protocol List<Element>: Iterable {
  mutating func add(element: Element)
  mutating func add(collection: any List<Element>)
  mutating func remove(atIndex index: Int) throws
  mutating func set(element: Element, atIndex index: Int) throws

  func element(atIndex index: Int) throws -> Element
  func isEmpty() -> Bool
  func count() -> Int

  func contains(where predicate: (Element) throws -> Bool) rethrows -> Bool
  func contains(allIn l: any List<Element>, where predicate: (Element) throws -> Bool) rethrows -> Bool
}
