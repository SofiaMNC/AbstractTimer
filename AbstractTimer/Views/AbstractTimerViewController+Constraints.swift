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
         - have a leading constraint of 10 with regards to the red Square's leading edge
         - have a trailing constraint of 10 with regards to the red Square's trailing edge
         - be vertically centered inside the red Square
        */
        redSquare.contentText.snp.makeConstraints
        {
            make
            in
            make.leading.equalTo(redSquare.snp.leading).offset(spacingValue/2)
            make.trailing.equalTo(redSquare.snp.trailing).offset(-spacingValue/2)
            make.centerY.equalToSuperview()
        }
        
        
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
         - have a leading constraint of 20 with regards to the blue Square's leading edge
         - have a trailing constraint of 20 with regards to the blue Square's trailing edge
         - be vertically centered inside the blue Square
        */
        blueSquare.contentText.snp.makeConstraints
        {
            make
            in
            make.trailing.equalTo(blueSquare.snp.trailing).offset(-spacingValue)
            make.leading.equalTo(blueSquare.snp.leading).offset(spacingValue)
            make.centerY.equalToSuperview()
        }
        
        
        // Constraints for the white Rectangle
        // Must be centered in the screen with a 20 pt offset
        // from all other shapes and boundaries

        /** The white Rectangle should have:
         - a top constraint of 20 with regards to the bottom of the red Square
         - a leading constraint of 20 with regards to the leading edge of the safe area
         - a trailing constraint of 20 with regards to the trailing edge of the safe area
         - a bottom constraint of 20 with regards to the top of the blue Square
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
         - be horizontally centered
         - be vertically centered
         - have a trailing constraint of 20 with regards to the white Rectangle's trailing edge
         - have a leading constraint of 20 with regards to the white Rectangle's leading edge
        */
        whiteRectangle.contentText.snp.makeConstraints
        {
            make
            in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.trailing.equalTo(whiteRectangle.snp.trailing).offset(-spacingValue)
            make.leading.equalTo(whiteRectangle.snp.leading).offset(spacingValue)
        }
        
        
        // Constraints for the purple rectangle
        // Must be located inside the white Rectangle with a 20 pt offset all around
        
        /** The purple Rectangle should have:
         - a leading constraint of 20 with regards to the white Rectangle's leading edge
         - a trailing constraint of 20 with regards to the white Rectangle's trailing edge
         - a top constraint of 20 with regards to the bottom edge of the white Rectangle's label.
         - a bottom constraint of 20 with regards to the white Rectangle's bottom edge.
         
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
            make.bottom.equalTo(whiteRectangle.snp.bottom).offset(-spacingValue).priority(.medium)
        }
        
        /** The purple Rectangle's label should:
         - be horizontally centered
         - be vertically centered
         - have a trailing constraint of 20 with regards to the purple Rectangle's trailing edge
         - have a leading constraint of 20 with regards to the purple Rectangle's leading edge
        */
        purpleRectangle.contentText.snp.makeConstraints
        {
            make
            in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.trailing.equalTo(purpleRectangle.snp.trailing).offset(-spacingValue)
            make.leading.equalTo(purpleRectangle.snp.leading).offset(spacingValue)
        }
        
        
        // Constraints for the timer label
        // Must be located on the bottom left corner
        
        /** The timer label should have:
         - a leading constraint of 20 with regards to the leading edge of the safe area
         - a bottom constraint of 20 with regards to the bottom edge of the safe area
        */
        abstractTimer.snp.makeConstraints
        {
            make
            in
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(spacingValue)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-spacingValue)
        }
    }
    
    // MARK: - Updating constraints for touch events
    
    /**
    The white rectangle must now have:
     - its leading edge aligned with the red Square's traililng edge
     - its trailing edge aligned with the blue Square's leading edge
        - Returns: NA
     
     NB: Since we are using SnapKit's updateConstraints so as to not have to remake all constraints,
        only the offset can be updated. The constraints must otherwise remain as-is.
     */
    func updateConstraintsForPress()
    {
        whiteRectangle.snp.updateConstraints
        {
            make
            in
            leadingConstraint = make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(redSquare.width)
            trailingConstraint = make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-blueSquare.width)
        }
    }
    
    /**
    The white rectangle must now return to its original constraints.
        - Returns: NA
     
     NB: Since we are using SnapKit's updateConstraints so as to not have to remake all constraints,
        only the offset can be updated. The constraints must otherwise remain as-is.
     */
    func updateConstraintsForRelease()
    {
        whiteRectangle.snp.updateConstraints
        {
            make
            in
            leadingConstraint = make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(spacingValue)
            trailingConstraint = make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-spacingValue)
        }
    }
}
