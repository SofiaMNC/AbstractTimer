//
//  AbstractTimerViewController+Logic.swift
//  AbstractTimer
//
//  Created by Sofia Chevrolat on 12/06/2021.
//

import Foundation
import UIKit

extension AbstractTimerViewController
{
    func startTimer()
    {
        timer?.invalidate()
        
        let startDate = Date()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true)
        {
            timer
            in
                        
            let duration: TimeInterval = Date().timeIntervalSince(startDate)
            
            let standardDuration = self.formatter.string(from: duration)
            
            let (_, fractionalPart) = modf(duration)
            let milliseconds = Int(fractionalPart * 1000)
            
            self.abstractTimer.text = standardDuration! + ".\(milliseconds)"
        }
    }
    
    @objc func pressAction(sender : UILongPressGestureRecognizer)
    {
        if sender.state == .began
        {
            updateConstraintsForPress()
            startTimer()
        }
        else if sender.state == .ended
        {
            updateConstraintsForRelease()
            startTimer()
        }
    }
}
