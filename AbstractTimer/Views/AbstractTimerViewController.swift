/**
#  AbstractTimerViewController.swift
   AbstractTimer

 **Created by Sofia Chevrolat on 06/10/21.*
 **Copyright © 2021 madimedia. All rights reserved.*
 
 ## Overview
 Main screen of the application.
 When long-pressing 1 of the 2 rectangles, the rectangles resize and the timer restarts.
 Upon release of the long press, the 2 rectangles regain their original dimensions, and the timer restarts.
 2 decorative squares complement the view.
*/

import UIKit
import SnapKit


class AbstractTimerViewController: UIViewController
{
    // MARK: - Properties
    
    /// Used thoughout for the regular positioning of the view
    let spacingValue = 20

    /// Constraints that will vary on touch event
    var leadingConstraint: ConstraintMakerEditable?
    var trailingConstraint: ConstraintMakerEditable?
    
    /// Timer to start / restart on loading and touch event
    var timer: Timer?
    
    /// Formatter used to display timer hour, minute and second count with the
    /// appropriate positioning and 0-padding for the current locale.
    /// NB: millisecond is not an NSCalendar.Unit
    lazy var formatter: DateComponentsFormatter =
    {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [ .hour, .minute, .second ]
        formatter.zeroFormattingBehavior = [ .pad ]
        return formatter
    }()
    
    /// One red Square with dimensions 170 x 170. Content is left-aligned and accessible.
    lazy var redSquare: Square =
    {
        let redSquare = Square(color: UIColor.red, side: 170)
        
        redSquare.setUpContentWith(text: StringConstants.MainScreen.RedSquare.label,
                                   aligned: .left)
        
        redSquare.setUpAccessibilityWith(text: StringConstants.MainScreen.RedSquare.accessibilityLabel)
        
        view.addSubview(redSquare)
        
        return redSquare
    }()
    
    /// One white rectangle. Content is center-aligned and accessible.
    /// The rectangle reacts on long press.
    lazy var whiteRectangle: Rectangle =
    {
        let whiteRectangle = Rectangle(color: UIColor.white)
        
        whiteRectangle.setUpContentWith(text: StringConstants.MainScreen.WhiteRectangle.label)
        
        whiteRectangle.setUpAccessibilityWith(text: StringConstants.MainScreen.WhiteRectangle.accessibilityLabel,
                                              andHint: StringConstants.MainScreen.WhiteRectangle.accessibilityHint)
        
        let gesture = UILongPressGestureRecognizer(target: self,
                                                   action: #selector(self.pressAction(sender:)))
        whiteRectangle.addGestureRecognizer(gesture)
        
        view.addSubview(whiteRectangle)
        
        return whiteRectangle
    }()
    
    /// One purple rectangle. Content is center-aligned and accessible.
    /// The rectangle reacts on long press.
    lazy var purpleRectangle: Rectangle =
    {
        let purpleRectangle = Rectangle(color: UIColor.purple)
        
        purpleRectangle.setUpContentWith(text: StringConstants.MainScreen.PurpleRectangle.label,
                                         aligned: .center, andStyledAs: .caption2)
        
        purpleRectangle.setUpAccessibilityWith(text: StringConstants.MainScreen.PurpleRectangle.accessibilityLabel,
                                               andHint: StringConstants.MainScreen.PurpleRectangle.accessibilityHint)
        
        let gesture = UILongPressGestureRecognizer(target: self,
                                                   action: #selector(self.pressAction(sender:)))
        purpleRectangle.addGestureRecognizer(gesture)
        
        view.addSubview(purpleRectangle)
        
        return purpleRectangle
    }()
    
    /// One blue square with dimensions 120 x 120. Content is right-aligned and accessible.
    lazy var blueSquare: Square =
    {
        let blueSquare = Square(color: UIColor.blue, side: 120)
        
        blueSquare.setUpContentWith(text: StringConstants.MainScreen.BlueSquare.label,
                                    aligned: .right)
        
        blueSquare.setUpAccessibilityWith(text: StringConstants.MainScreen.BlueSquare.accessibilityLabel)
        view.addSubview(blueSquare)
        
        return blueSquare
    }()
    
    /// The timer label. Content is accessible.
    /// It uses a font that is monospaced for numbers, while supporting dynamic type.
    lazy var abstractTimer: UILabel =
    {
        let abstractTimer = UILabel(frame: .zero)
        abstractTimer.isAccessibilityElement = true
        abstractTimer.accessibilityHint = StringConstants.MainScreen.AbstractTimer.accessibilityHint
        abstractTimer.font = .init(descriptor: UIFont.preferredFont(forTextStyle: .title3)
                                                     .fontDescriptor
                                                     .addingAttributes([.featureSettings: [[
                                                                                            UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
                                                                                            .typeIdentifier: kMonospacedNumbersSelector]]]),
                                   size: 0)
        abstractTimer.adjustsFontForContentSizeCategory = true
        abstractTimer.textColor = UIColor.white
        view.addSubview(abstractTimer)
        
        return abstractTimer
    }()
    
    
    // MARK: - Methods
    
    /**
    Set up the background color, the views with their constraints and start the timer.
        - Returns: NA
     */
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        setUpConstraints()
        startTimer()
    }
}

