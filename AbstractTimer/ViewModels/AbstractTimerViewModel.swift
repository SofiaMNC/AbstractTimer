//
//  AbstractTimerViewModel.swift
//  AbstractTimer
//
//  Created by Sofia Chevrolat on 14/06/2021.
//

import Foundation


public class AbstractTimerViewModel
{
    /// Formatter used to display timer hour, minute and second count with the
    /// appropriate positioning and 0-padding for the current locale.
    /// NB: millisecond is not an NSCalendar.Unit
    private let formatter: DateComponentsFormatter =
    {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [ .hour, .minute, .second ]
        formatter.zeroFormattingBehavior = [ .pad ]
        return formatter
    }()
    
    /// Timer to start / restart on loading and touch event
    private var timer: Timer?
    let timerLabel = Box("00:00:00.000")
    
    
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
            self.timerLabel.value = standardDuration! + ".\(milliseconds)"
        }
    }
}
