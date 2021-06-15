/**
#  StringConstants.swift
   AbstractTimer

 **Created by Sofia Chevrolat on 06/13/21.*
 **Copyright © 2021 madimedia. All rights reserved.*

 ## Overview
All the app's string constants, grouped by screen and views.
 
 */

import Foundation

struct StringConstants
{
    /// The string litterals used by AbstractTimerLabel
    struct AbstractTimerLabel
    {
        static let defaultLabel = NSLocalizedString("No content provided",
                                                    comment: "Default value for an AbstractTimerLabel")
    }
    
    /// The string litterals for the main screen AbstractTimerViewController
    struct MainScreen
    {
        /// The string litterals for the AbstractTimerVC's red Square
        struct RedSquare
        {
            static let label = NSLocalizedString("Red Square (170x170)",
                                                 comment: "The label text for the top left square")
            
            static let accessibilityID = "RedSquare"
            
            static let accessibilityLabel = NSLocalizedString("Red Square (170x170).",
                                                              comment: "The accessibility label text for the top left square")
        }
        
        /// The string litterals for the AbstractTimerVC's white Rectangle
        struct WhiteRectangle
        {
            static let label = NSLocalizedString("White Rectangle (20 offset)",
                                                 comment: "The label text for the largest middle rectangle")
            
            static let accessibilityID = "WhiteRectangle"
            
            static let accessibilityLabel = NSLocalizedString("White Rectangle (20 offset). Can be tapped",
                                                              comment: "The accessibility label text for the smallest middle rectangle")
            static let accessibilityHint = NSLocalizedString("A tap on this shape will make it resize, as well as the purple rectangle it contains, and restart the timer.",
                                                             comment: "The accessibility hint describing what can be done with the white rectangle")

        }
        
        /// The string litterals for the AbstractTimerVC's purple Rectangle
        struct PurpleRectangle
        {
            static let label = NSLocalizedString("Purple Rectangle",
                                                 comment: "The label text for the smallest middle rectangle")
            
            static let accessibilityID = "PurpleRectangle"

            static let accessibilityLabel = NSLocalizedString("Purple Rectangle. This rectangle will disappear in landscape mode. Can be tapped.",
                                                              comment: "The accessibility label text for the smallest middle rectangle")
            
            static let accessibilityHint = NSLocalizedString("A tap on this shape will make it resize, as well as the white rectangle around it, and restart the timer.",
                                                             comment: "Describing what can be done with the purple rectangle")
        }
        
        /// The string litterals for the AbstractTimerVC's blue Square
        struct BlueSquare
        {
            static let label = NSLocalizedString("Blue Square (120x120)",
                                                 comment: "The label text for the bottom right square")
            
            static let accessibilityID = "BlueSquare"

            static let accessibilityLabel = NSLocalizedString("Blue Square (120x120).",
                                                              comment: "The accessibility label text for the bottom right square")
        }
        
        /// The string litterals for the AbstractTimerVC's timer UILabel
        struct AbstractTimer
        {
            static let accessibilityHint = NSLocalizedString("Timer with hours, minutes, seconds and milliseconds. Restart by tapping the white or purple rectangle (middle of the screen)",
                                                              comment: "The accessibility hint for the timer")
        }
    }
}
