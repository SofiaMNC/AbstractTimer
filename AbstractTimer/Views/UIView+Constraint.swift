/**
#  UIView+Constraint.swift
   AbstractTimer
 
 ## Overview
 Extension to provide the constraints for a given view
 
*/

import Foundation
import UIKit


extension UIView
{

    /**
    Get the view's NSLayoutConstraint for the chosen attribute
        - Parameter layoutAttribute: the attribute for which to get the constraint
        - Returns: NSLayoutConstraint
     */
    func constraint(for layoutAttribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint?
    {
        return superview?.constraints.first { itemMatch(constraint: $0, layoutAttribute: layoutAttribute) }
    }

    /**
    Finding the constraints for a given attribute
        - Parameter sender: the long press gesture recognizer
        - Returns: NA
     */
    private func itemMatch(constraint: NSLayoutConstraint, layoutAttribute: NSLayoutConstraint.Attribute) -> Bool
    {
        if let firstItem = constraint.firstItem as? UIView,
           let secondItem = constraint.secondItem as? UIView
        {
            let firstItemMatch = (firstItem == self) && (constraint.firstAttribute == layoutAttribute)
            let secondItemMatch = (secondItem == self) && (constraint.secondAttribute == layoutAttribute)
            
            return firstItemMatch || secondItemMatch
        }
        
        return false
    }
}
