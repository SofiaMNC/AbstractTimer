/**
# AbstractTimerViewController+Logic.swift
  AbstractTimer

 **Created by Sofia Chevrolat on 06/12/21.*
 **Copyright © 2021 madimedia. All rights reserved.*
 
 ## Overview
 An extension to AbstractTimerViewController to house the logic

*/

import Foundation
import UIKit


extension AbstractTimerViewController
{
    /**
    Start the timer anew after invalidating the current one if it is set.
        - Returns: NA
     */
    func startTimer()
    {
        timer?.invalidate()
        
        let startDate = Date()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true)
        {
            timer
            in
            
            /// Get duration since start date
            let duration: TimeInterval = Date().timeIntervalSince(startDate)
            
            /// Format duration according to locale with hour, minutes, seconds
            /// (milliseconds is not available as a NSCalendar.Unit
            let standardDuration = self.formatter.string(from: duration)
            
            /// Get milliseconds as an 3 digit Int
            let (_, fractionalPart) = modf(duration)
            let milliseconds = Int(fractionalPart * 1000)
            
            /// Set final timer string with all components
            self.abstractTimer.text = standardDuration! + ".\(milliseconds)"
        }
    }
    
    /**
    Updating constraints and start timer on long press and release of long press
        - Parameter sender: the long press gesture recognizer
        - Returns: NA
     */
    @objc func pressAction(sender : UILongPressGestureRecognizer)
    {
        if sender.state == .began
        {
            updateConstraintsForPress()
        }
        else if sender.state == .ended
        {
            updateConstraintsForRelease()
        }
        
        startTimer()
    }
    
    /**
    Hide the purple Rectangle when in landscape mode.
        - Parameter newCollection: The traits to be applied to the container.
        - Parameter coordinator: The transition coordinator object managing the trait change.
        - Returns: NA
     */
    override func willTransition(to newCollection: UITraitCollection,
                                 with coordinator: UIViewControllerTransitionCoordinator)
    {
        super.willTransition(to: newCollection, with: coordinator)
        
        purpleRectangle.isHidden = UIDevice.current.orientation.isLandscape
    }
}
