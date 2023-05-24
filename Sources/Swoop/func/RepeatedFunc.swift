//
//  RepeatedFunc.swift
//
//
//  Created by Jesse Seidman on 5/24/23.
//

public class RepeatedFunc<X, Y>: Func {
    
    private let fnc: any Func<X,Y>
    private let times: Int
    
    public init(fnc: any Func<X,Y>, times: Int) {
        self.fnc = fnc
        self.times = times
    }
    
    public func apply(input: X) throws -> Y {
        if times <= 0 {
            throw StandardException("The number of repetitions must be at least 1")
        }
        
        var result: Y?
        for _ in (0..<times) {
            result = try fnc.apply(input: input)
        }
        
        return result! // logically should never be nil because of check
    }
}
