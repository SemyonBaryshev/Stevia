//
//  Stevia+Position.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public extension UIView {
    /** Sets the left margin for a view.

     Example Usage :

     label.steviaLeft(20)
     label.steviaLeft(<=20)
     label.steviaLeft(>=20)
     label.steviaLeft(20%)

     - Returns: Itself for chaining purposes
     */
    @discardableResult
    func steviaLeft(_ points: CGFloat) -> UIView {
        return position(.left, points: points)
    }

    /** Sets the right margin for a view.

     Example Usage :

     label.steviaRight(20)
     label.steviaRight(<=20)
     label.steviaRight(>=20)
     label.steviaRight(20%)

     - Returns: Itself for chaining purposes
     */
    @discardableResult
    func steviaRight(_ points: CGFloat) -> UIView {
        return position(.right, points: -points)
    }

    /** Sets the top margin for a view.

     Example Usage :

     label.steviaTop(20)
     label.steviaTop(<=20)
     label.steviaTop(>=20)
     label.steviaTop(20%)

     - Returns: Itself for chaining purposes
     */
    @discardableResult
    func steviaTop(_ points: CGFloat) -> UIView {
        return position(.top, points: points)
    }

    /** Sets the bottom margin for a view.

     Example Usage :

     label.steviaBottom(20)
     label.steviaBottom(<=20)
     label.steviaBottom(>=20)
     label.steviaBottom(20%)

     - Returns: Itself for chaining purposes
     */
    @discardableResult
    func steviaBottom(_ points: CGFloat) -> UIView {
        return position(.bottom, points: -points)
    }

    /** Sets the left margin for a view.

     Example Usage :

     label.steviaLeft(20)
     label.steviaLeft(<=20)
     label.steviaLeft(>=20)
     label.steviaLeft(20%)

     - Returns: Itself for chaining purposes
     */
    @discardableResult
    func steviaLeft(_ fm: SteviaFlexibleMargin) -> UIView {
        return position(.left, relatedBy: fm.relation, points: fm.points)
    }

    /** Sets the right margin for a view.

     Example Usage :

     label.steviaRight(20)
     label.steviaRight(<=20)
     label.steviaRight(>=20)
     label.steviaRight(20%)

     - Returns: Itself for chaining purposes
     */
    @discardableResult
    func steviaRight(_ fm: SteviaFlexibleMargin) -> UIView {
        // For right this should be inverted.
        var n = SteviaFlexibleMargin()
        n.points = -fm.points
        if fm.relation == .greaterThanOrEqual {
            n.relation = .lessThanOrEqual
        }
        if fm.relation == .lessThanOrEqual {
            n.relation = .greaterThanOrEqual
        }
        return position(.right, relatedBy: n.relation, points: n.points)
    }

    /** Sets the top margin for a view.

     Example Usage :

     label.steviaTop(20)
     label.steviaTop(<=20)
     label.steviaTop(>=20)
     label.steviaTop(20%)

     - Returns: Itself for chaining purposes
     */
    @discardableResult
    func steviaTop(_ fm: SteviaFlexibleMargin) -> UIView {
        return position(.top, relatedBy: fm.relation, points: fm.points)
    }

    /** Sets the bottom margin for a view.

     Example Usage :

     label.steviaBottom(20)
     label.steviaBottom(<=20)
     label.steviaBottom(>=20)
     label.steviaBottom(20%)

     - Returns: Itself for chaining purposes
     */
    @discardableResult
    func steviaBottom(_ fm: SteviaFlexibleMargin) -> UIView {
        // For bottom this should be inverted.
        var n = SteviaFlexibleMargin()
        n.points = -fm.points
        if fm.relation == .greaterThanOrEqual {
            n.relation = .lessThanOrEqual
        }
        if fm.relation == .lessThanOrEqual {
            n.relation = .greaterThanOrEqual
        }
        return position(.bottom, relatedBy: n.relation, points: n.points)
    }

    fileprivate func position(_ position: NSLayoutConstraint.Attribute,
                              relatedBy: NSLayoutConstraint.Relation = .equal,
                              points: CGFloat) -> UIView {
        if let spv = superview {
            let c = constraint(item: self, attribute: position,
                               relatedBy: relatedBy,
                               toItem: spv,
                               constant: points)
            spv.addConstraint(c)
        }
        return self
    }
}
