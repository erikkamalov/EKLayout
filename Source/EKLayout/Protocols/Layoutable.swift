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

public protocol Layoutable {}

extension Layoutable {
    internal func prepare() {
        guard let view = self as? EKLayoutableView else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    internal func removeConstraints(){
        guard let view = self as? EKLayoutableView else { return }
        let constraints = self.superview?.constraints.filter { $0.firstItem as? UIView == view || $0.secondItem as? UIView == view } ?? []
        superview?.removeConstraints(constraints)
        view.removeConstraints(view.constraints)
    }
    internal var superview: EKLayoutableView? {
        guard let view = self as? EKLayoutableView else { return nil }
        return view.superview
    }
    
    internal var superviewRect:CGRect {
        return superview?.frame ?? screenSize
    }
    
}
