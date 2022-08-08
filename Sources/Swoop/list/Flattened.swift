////
////  Flattened.swift
////  
////
////  Created by Jesse Seidman on 8/8/22.
////
//
//import Foundation
//
//public class Flattened<X>: List {
//  
//  private var list: any List<X>
//
//  private init(list: any List<X>) {
//    self.list = list
//  }
//  
//  public func iterator() -> any IteratorProtocol<X> {
//    return list.iterator()
//  }
//  
//  public func add(element: X) {
//    list.add(element: element)
//  }
//  
//  public func add(collection: any List<X>) {
//    list.add(collection: collection)
//  }
//  
//  public func set(element: X, atIndex index: Int) {
//    list.set(element: element, atIndex: index)
//  }
//  
//  public func element(atIndex index: Int) -> X {
//    return list.element(atIndex: index)
//  }
//  
//  public func isEmpty() -> Bool {
//    return list.isEmpty()
//  }
//  
//  public func count() -> Int {
//    return list.count()
//  }
//}
//
//extension Flattened {
//  
//  public convenience init(_ src: any Iterable<X>) {
//    self.init(
//      list: ListOf(
//        itr: IterableSmart {
//          let i = src.iterator()
//          [].flatMap(<#T##transform: (Any) throws -> Sequence##(Any) throws -> Sequence#>)
//        }
//      )
//    )
//  }
//}
