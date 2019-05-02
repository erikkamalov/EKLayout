//  MIT License
//
//  Copyright (c) 2019 Erik Kamalov <ekamalov967@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit


public protocol Value {}

extension Int: Value {}

extension Float: Value {}

extension Double: Value {}

extension CGFloat: Value {}

extension Percent: Value {}



extension Value {
    
    var toCGFloat:CGFloat {
        switch self {
        case let value as CGFloat: return value
        case let value as Double: return CGFloat(value)
        case let value as Float: return CGFloat(value)
        case let value as Int: return CGFloat(value)
        default:
            assert(false, "NumberConvertible convert cast failed! Please check Percent")
            return 0
        }
    }
}


/// This struct used for calculating percent
public struct Percent {
    let value: CGFloat
    
    public func of(_ value: CGFloat) -> CGFloat {
        return value * self.value / 100
    }
}

postfix operator %

public postfix func % (v: CGFloat) -> Percent {
    return Percent(value: v)
}




