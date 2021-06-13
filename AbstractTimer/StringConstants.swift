//
//  StringConstants.swift
//  AbstractTimer
//
//  Created by Sofia Chevrolat on 13/06/2021.
//

import Foundation

struct StringConstants
{
    struct MainScreen
    {
        struct RedSquare
        {
            static let label = NSLocalizedString("Red Square (170x170)",
                                                 comment: "The label text for the top left square")
            static let accessibilityLabel = NSLocalizedString("Red Square (170x170).",
                                                              comment: "The accessibility label text for the top left square")
        }
        
        struct WhiteRectangle
        {
            static let label = NSLocalizedString("White Rectangle (20 offset)",
                                                 comment: "The label text for the largest middle rectangle")
            static let accessibilityLabel = NSLocalizedString("White Rectangle (20 offset). Can be longpressed",
                                                              comment: "The accessibility label text for the smallest middle rectangle")
            static let accessibilityHint = NSLocalizedString("Long pressing this shape will reshape it as well as the purple rectangle inside it, and restart the timer until you release your press, at which point the view goes back to normal and the timer restarts.",
                                                             comment: "The accessibility hint describing what can be done with the white rectangle")

        }
        
        struct PurpleRectangle
        {
            static let label = NSLocalizedString("Purple Rectangle",
                                                 comment: "The label text for the smallest middle rectangle")
            static let accessibilityLabel = NSLocalizedString("Purple Rectangle. This rectangle will disappear in landscape mode. Can be longpressed.",
                                                              comment: "The accessibility label text for the smallest middle rectangle")
            static let accessibilityHint = NSLocalizedString("Long pressing this shape will reshape it as well as the white rectangle around it, and restart the timer until you release your press, at which point the view goes back to normal and the timer restarts.",
                                                             comment: "Describing what can be done with the purple rectangle")
        }
        
        struct BlueSquare
        {
            static let label = NSLocalizedString("Blue Square (120x120)",
                                                 comment: "The label text for the bottom right square")
            static let accessibilityLabel = NSLocalizedString("Blue Square (120x120).",
                                                              comment: "The accessibility label text for the bottom right square")
        }
        
        struct AbstractTimer
        {
            static let accessibilityLabel = NSLocalizedString("Timer with hours, minutes, seconds and milliseconds. Restart by long pressing the white or purple rectangle, and by releasing the white or purple rectangle (middle of the screen)",
                                                              comment: "The accessibility label for the timer")
        }
    }
}
