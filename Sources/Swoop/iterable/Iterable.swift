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

extension Iterable {
    
    func forEach(_ closure: (Element) throws -> Void) rethrows {
        let i = iterator()
        while i.hasNext() {
            let next = i.next()
            try closure(next)
        }
    }
    
    func sequence() -> AnySequence<Element> {
        return AnySequence {
            let i = iterator()
            return AnyIterator {
                if i.hasNext() {
                    return i.next()
                } else {
                    return nil
                }
            }
        }
    }
}
