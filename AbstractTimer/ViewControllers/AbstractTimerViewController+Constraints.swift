/**
#  AbstractTimerViewController+Constraints.swift
   AbstractTimer

 **Created by Sofia Chevrolat on 06/10/21.*
 **Copyright © 2021 madimedia. All rights reserved.*
 
 ## Overview
 An extension to AbstractTimerViewController to house constraints-related functionality
*/

import Foundation
import SnapKit
import UIKit


extension AbstractTimerViewController
{
    // MARK: - Setting up the constraints
    
    /**
    Set up the constraints for all the views in the view controller
        - Returns: NA
     */
    func setUpConstraints()
    {
        // Constraints for the red Square
        // Must be located in the top left corner
        
        /** The red Square should have:
         - the correct dimensions as indicated in its properties
         - a top constraint of 0 with regards to the top edge of the safe area
         - a leading constraint of 0 with regards to the leading edge of the safe area
        */
        redSquare.snp.makeConstraints
        {
            make
            in
            make.width.height.equalTo(redSquare.width)
            make.top.leading.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        /** The red Square's label should :
         - have a leading constraint of _spacingValue_ with regards to the red Square's leading edge
         - have a trailing constraint of _spacingValue_ with regards to the red Square's trailing edge
         - be vertically centered inside the red Square
        */
        setLabelConstraintsFor(redSquare)
            
        
        // Constraints for the blue Square
        // Must be located in the bottom right corner
        
        /** The blue Square should have:
         - the correct dimensions as indicated in its properties
         - a trailing constraint of 0 with regards to the traililng edge of the safe area
         - a bottom constraint of 0 with regards to the bottom edge of the safe area
        */
        blueSquare.snp.makeConstraints
        {
            make
            in
            make.width.height.equalTo(blueSquare.width)
            make.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        /** The blue Square's label should:
         - have a leading constraint of _spacingValue_ with regards to the blue Square's leading edge
         - have a trailing constraint of _spacingValue_ with regards to the blue Square's trailing edge
         - be vertically centered inside the blue Square
        */
        setLabelConstraintsFor(blueSquare)
        
        
        // Constraints for the white Rectangle
        // Must be centered in the screen with an offset
        // from all other shapes and boundaries

        /** The white Rectangle should have:
         - a top constraint of _spacingValue_ with regards to the bottom of the red Square
         - a leading constraint of _spacingValue_ with regards to the leading edge of the safe area
         - a trailing constraint of _spacingValue_ with regards to the trailing edge of the safe area
         - a bottom constraint of _spacingValue_ with regards to the top of the blue Square
        */
        whiteRectangle.snp.makeConstraints
        {
            make
            in
            make.top.equalTo(redSquare.snp.bottom).offset(spacingValue)
            leadingConstraint = make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(spacingValue)
            trailingConstraint = make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-spacingValue)
            make.bottom.equalTo(blueSquare.snp.top).offset(-spacingValue)
        }
        
        /** The white Rectangle's label should:
         - be horizontally and vertically centered
         - have a leading constraint of _spacingValue_ with regards to the white Rectangle's leading edge
         - have a trailing constraint of _spacingValue_ with regards to the white Rectangle's trailing edge
        */
        setLabelConstraintsFor(whiteRectangle, asLargeAsPossible: false)
        
        
        // Constraints for the purple rectangle
        // Must be located inside the white Rectangle with an offset all around
        
        /** The purple Rectangle should have:
         - a leading constraint of _spacingValue_ with regards to the white Rectangle's leading edge
         - a trailing constraint of _spacingValue_ with regards to the white Rectangle's trailing edge
         - a top constraint of _spacingValue_ with regards to the bottom edge of the white Rectangle's label.
         - a bottom constraint of _spacingValue_ with regards to the white Rectangle's bottom edge.
         
         NB: the top and bottom constraints must have a lesser priority than the other constraints since they must yield
            to the other constraints in landscape mode, when the purple rectangle must be hidden.
        */
        purpleRectangle.snp.makeConstraints
        {
            make
            in
            make.leading.equalTo(whiteRectangle).offset(spacingValue)
            make.trailing.equalTo(whiteRectangle).offset(-spacingValue)
            make.top.equalTo(whiteRectangle.contentText.snp.bottom).offset(spacingValue).priority(.medium)
            make.bottom.equalTo(whiteRectangle).offset(-spacingValue).priority(.medium)
        }
        
        /** The purple Rectangle's label should:
         - be horizontally centered
         - be vertically centered
         - have a leading constraint of _spacingValue_ with regards to the purple Rectangle's leading edge
         - have a trailing constraint of _spacingValue_ with regards to the purple Rectangle's trailing edge
        */
        setLabelConstraintsFor(purpleRectangle)
        
        
        // Constraints for the timer label
        // Must be located on the bottom left corner
        
        /** The timer label should have:
         - a leading constraint of _spacingValue_ with regards to the leading edge of the safe area
         - a bottom constraint of _spacingValue_ with regards to the bottom edge of the safe area
        */
        abstractTimer.snp.makeConstraints
        {
            make
            in
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(spacingValue)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-spacingValue)
        }
    }
    
    /**
     Set the constraints for label inside a HasAccessibleTextContent protocol-conforming shape.
     - Parameter shape: an HasAccessibleTextContent protocol-conforming shape
     - Parameter largest: should the label take the whole available space
     - Returns: NA
    */
    func setLabelConstraintsFor(_ shape: HasCompleteAccessibility, asLargeAsPossible largest: Bool = true)
    {
        shape.contentText.snp.makeConstraints
        {
            make
            in
            
            if largest
            {
                let cgfloatSpacingValue = CGFloat(spacingValue)
                
                make.edges.equalToSuperview().inset(UIEdgeInsets(top: cgfloatSpacingValue,
                                                                 left: cgfloatSpacingValue,
                                                                 bottom: cgfloatSpacingValue,
                                                                 right: cgfloatSpacingValue))
            }
            else
            {
                make.center.equalToSuperview()
                make.leading.equalToSuperview().offset(spacingValue)
                make.trailing.equalToSuperview().offset(-spacingValue)
            }
        }
    }
    
    // MARK: - Updating constraints for touch events
    
    /**
    If resized, the white rectangle must have:
     - its leading edge aligned with the red Square's traililng edge
     - its trailing edge aligned with the blue Square's leading edge
        - Returns: NA
     
     NB: Since we are using SnapKit's updateConstraints so as to not have to remake all constraints,
        only the offset can be updated. The constraints must otherwise remain as-is.
     */
    func updateConstraintsForTap()
    {
        let newLeadingValue = resized ? spacingValue : redSquare.width
        let newTrailingValue = resized ? spacingValue : blueSquare.width
    
        whiteRectangle.snp.updateConstraints
        {
            make
            in
            leadingConstraint = make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(newLeadingValue)
            trailingConstraint = make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-newTrailingValue)
        }
    }
}
