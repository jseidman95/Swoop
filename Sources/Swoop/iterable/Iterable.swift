//
//  Iterable.swift
//  
//
//  Created by Jesse Seidman on 8/2/22.
//

import Foundation

public protocol IteratorProtocol<Element> {
  associatedtype Element

  func hasNext() -> Bool
  func next() -> Element
}

public protocol Iterable<Element> {
  associatedtype Element

  func iterator() -> any IteratorProtocol<Element>
}
