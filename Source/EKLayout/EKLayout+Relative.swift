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

extension EKLayout {
    // MARK: - Public methods
    @discardableResult
    public func left(of relativeView: Layoutable, _ offset:Value = 0, aligned: EKLayoutAttribute = .left, relation: EKLayoutRelation = .equal) -> EKLayout {
        self.addRelativeConstraint(.left, of: relativeView, aligned: aligned, offset.toCGFloat, relation: relation)
        return self
    }
    
    @discardableResult
    public func right(of relativeView: Layoutable, _ offset:Value = 0, aligned: EKLayoutAttribute = .right, relation: EKLayoutRelation = .equal) -> EKLayout {
        self.addRelativeConstraint(.right, of: relativeView, aligned: aligned, -offset.toCGFloat, relation: relation)
        return self
    }
    
    @discardableResult
    public func top(of relativeView: Layoutable,_ offset:Value = 0, aligned: EKLayoutAttribute = .top, relation: EKLayoutRelation = .equal) -> EKLayout {
        self.addRelativeConstraint(.top, of: relativeView, aligned: aligned, offset.toCGFloat, relation: relation)
        return self
    }
    
    @discardableResult
    public func bottom(of relativeView: Layoutable, _ offset:Value = 0, aligned: EKLayoutAttribute = .bottom, relation: EKLayoutRelation = .equal) -> EKLayout {
        self.addRelativeConstraint(.bottom, of: relativeView, aligned: aligned, -offset.toCGFloat, relation: relation)
        return self
    }
    
    @discardableResult
    public func centerX(of relativeView: Layoutable, _ offset:Value = 0, aligned: EKLayoutAttribute = .centerX, relation: EKLayoutRelation = .equal) -> EKLayout {
        self.addRelativeConstraint(.centerX, of: relativeView, aligned: aligned, offset.toCGFloat, relation: relation)
        return self
    }
    
    @discardableResult
    public func centerY(of relativeView: Layoutable, _ offset:Value = 0, aligned: EKLayoutAttribute = .centerY, relation: EKLayoutRelation = .equal) -> EKLayout {
        self.addRelativeConstraint(.centerY, of: relativeView, aligned: aligned, offset.toCGFloat, relation: relation)
        return self
    }
    
    
    // MARK: - Private methods
    private func addRelativeConstraint(_ newViewAttribute: EKLayoutAttribute, of relativeView: Layoutable,
                                       aligned: EKLayoutAttribute = .notAnAttribute ,  _ offset:CGFloat, relation: EKLayoutRelation){
        let const = Constraint(newView: self.view, newViewAttribute: newViewAttribute, relativeView: relativeView,
                               relativeAttribute: aligned, value: offset, relation: relation)
        self.repository.addProdConst(constraint: const)
    }
}

