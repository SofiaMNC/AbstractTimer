//
//  UIView+Constraint.swift
//  AbstractTimer
//
//  Created by Sofia Chevrolat on 14/06/2021.
//

import Foundation
import UIKit


extension UIView
{

    func constraint(for layoutAttribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        return superview?.constraints.first { itemMatch(constraint: $0, layoutAttribute: layoutAttribute) }
    }

    private func itemMatch(constraint: NSLayoutConstraint, layoutAttribute: NSLayoutConstraint.Attribute) -> Bool {
        if let firstItem = constraint.firstItem as? UIView, let secondItem = constraint.secondItem as? UIView {
            let firstItemMatch = firstItem == self && constraint.firstAttribute == layoutAttribute
            let secondItemMatch = secondItem == self && constraint.secondAttribute == layoutAttribute
            return firstItemMatch || secondItemMatch
        }
        return false
    }
}
