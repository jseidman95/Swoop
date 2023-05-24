//
//  Repeated.swift
//
//
//  Created by Jesse Seidman on 5/24/23.
//

import Foundation

public class Repeated<X>: Scalar {
    
    private let scalar: any Scalar<X>
    private let times: Int
    
    public init(scalar: any Scalar<X>, times: Int) {
        self.scalar = scalar
        self.times = times
    }
    
    public func value() throws -> X {
        return try RepeatedFunc(
            fnc: FuncOf(scalar: scalar),
            times: times
        ).apply(input: true)
    }
}
