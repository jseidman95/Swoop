//
//  Not.swift
//
//
//  Created by Jesse Seidman on 5/24/23.
//

import Foundation

public class Not: Scalar {
    
    private let origin: any Scalar<Bool>
    
    public init(_ scalar: any Scalar<Bool>) {
        self.origin = scalar
    }
    
    public func value() throws -> Bool {
        return try !origin.value()
    }
}
