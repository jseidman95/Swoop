//
//  Sub.swift
//
//
//  Created by Jesse Seidman on 5/25/23.
//

import Foundation

public class Sub: TextEnvelope {
  
  public convenience init(
    text: Text,
    start: any Func<String, Int>,
    end: any Func<String, Int>
  ) {
    self.init(
      text: MappedText(
        fnc: FuncSmart { origin in
          let begin = try start.apply(input: origin)
          if begin < 0 {
            throw StandardException("begin must be greater than zero")
          }
          
          let finish = try end.apply(input: origin)
          
          if begin > finish {
            throw StandardException("begin: \(begin) must be less than finish: \(finish)")
          }
          
          if finish >= origin.count {
            throw StandardException("finish: \(finish) must be less than count: \(origin.count)")
          }

          return String(
            origin[origin.index(origin.startIndex, offsetBy: begin)...origin.index(origin.startIndex, offsetBy: finish)]
          )
        },
        text: text
      )
    )
  }

  public convenience init(
    text: Text,
    start: any Scalar<Int>,
    finish: any Func<String, Int>
  ) {
    self.init(
      text: text,
      start: FuncOf(scalar: start),
      end: finish
    )
  }

  public convenience init(
    text: Text,
    start: any Scalar<Int>,
    finish: any Scalar<Int>
  ) {
    self.init(
      text: text,
      start: FuncOf(scalar: start),
      end: FuncOf(scalar: finish)
    )
  }

  public convenience init(
    text: Text,
    start: Int,
    finish: any Func<String, Int>
  ) {
    self.init(
      text: text,
      start: Constant(start),
      finish: finish
    )
  }

  public convenience init(
    text: Text,
    start: Int,
    finish: any Scalar<Int>
  ) {
    self.init(
      text: text,
      start: Constant(start),
      finish: finish
    )
  }

  public convenience init(
    text: Text,
    start: Int,
    final: Int
  ) {
    self.init(
      text: text,
      start: Constant(start),
      finish: Constant(final)
    )
  }

  public convenience init(
    text: Text,
    start: any Func<String, Int>
  ) {
    self.init(
      text: text,
      start: start,
      end: FuncSmart {
        $0.count - 1
      }
    )
  }

  public convenience init(
    text: Text,
    start: any Scalar<Int>
  ) {
    self.init(
      text: text,
      start: FuncOf(scalar: start)
    )
  }

  public convenience init(
    text: Text,
    start: Int
  ) {
    self.init(
      text: text,
      start: Constant(start)
    )
  }

  public convenience init(
    text: String,
    start: Int,
    finish: Int
  ) {
    self.init(
      text: TextOf(text),
      start: start,
      finish: finish
    )
  }

  public convenience init(
    text: String,
    start: Int
  ) {
    self.init(
      text: TextOf(text),
      start: start
    )
  }
}
