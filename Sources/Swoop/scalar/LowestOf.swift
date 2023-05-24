//
//  LengthOf.swift
//
//
//  Created by Jesse Seidman on 5/24/23.
//

import Foundation

public class LowestOf<T: Comparable>: ScalarEnvelope<T> {
    
    public convenience init(_ scalars: any Scalar<T>...) {
        self.init(iterable: IterableOf(arr: scalars))
    }
    
    public convenience init(_ items: T...) {
        self.init(
            iterable: MappedIterable(
                FuncSmart { item in ScalarSmart { item } },
                items
            )
        )
    }

    public convenience init(iterable: any Iterable<any Scalar<T>>) {
        self.init(
            scalar: Reduced(
                iterable,
                closure: { first, second in
                    let val: T
                    if first < second {
                        val = first
                    } else {
                        val = second
                    }
                    
                    return val
                }
            )
        )
    }
}
