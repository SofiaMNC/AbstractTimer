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
    private let viewModel = AbstractTimerViewModel()
    
    /// Keeps track of the resizing state of the view
    var resized: Bool = false
    
    /// Values for sizing and positioning of the views
    let spacingValue = 20
    let redSquareSide = 170
    let blueSquareSide = 120

    /// Constraints that will vary on touch event
    var leadingConstraint: ConstraintMakerEditable?
    var trailingConstraint: ConstraintMakerEditable?
    
    /// One red Square with dimensions 170 x 170. Content is left-aligned and accessible.
    lazy var redSquare: Square =
    {
        let redSquareLabel = DynamicTypeLabel(withContent: StringConstants.MainScreen.RedSquare.label,
                                             aligned: .left)
        
        let redSquare = Square(labelled: redSquareLabel, withColor: UIColor.red, andDimension: redSquareSide)
        
        redSquare.setUpAccessibilityWith(identifier: StringConstants.MainScreen.RedSquare.accessibilityID,
                                         text: StringConstants.MainScreen.RedSquare.accessibilityLabel)
                        
        view.addSubview(redSquare)
        
        return redSquare
    }()
    
    /// One white rectangle. Content is center-aligned and accessible.
    /// The rectangle reacts on long press.
    lazy var whiteRectangle: Rectangle =
    {
        let whiteRectangleLabel = DynamicTypeLabel(withContent: StringConstants.MainScreen.WhiteRectangle.label)
        
        let whiteRectangle = Rectangle(labelled: whiteRectangleLabel, withColor: UIColor.white)
                
        whiteRectangle.setUpAccessibilityWith(identifier: StringConstants.MainScreen.WhiteRectangle.accessibilityID,
                                              text: StringConstants.MainScreen.WhiteRectangle.accessibilityLabel,
                                              andHint: StringConstants.MainScreen.WhiteRectangle.accessibilityHint)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.pressAction(sender:)))
        whiteRectangle.addGestureRecognizer(gesture)
        
        view.addSubview(whiteRectangle)
        
        return whiteRectangle
    }()
    
    /// One purple rectangle. Content is center-aligned and accessible.
    /// The rectangle reacts on long press.
    lazy var purpleRectangle: Rectangle =
    {
        let purpleRectangleLabel = DynamicTypeLabel(withContent: StringConstants.MainScreen.PurpleRectangle.label,
                                                   aligned: .center,
                                                   andStyledAs: .caption2)
        
        let purpleRectangle = Rectangle(labelled: purpleRectangleLabel, withColor: UIColor.purple)
        
        purpleRectangle.setUpAccessibilityWith(identifier: StringConstants.MainScreen.PurpleRectangle.accessibilityID,
                                               text: StringConstants.MainScreen.PurpleRectangle.accessibilityLabel,
                                               andHint: StringConstants.MainScreen.PurpleRectangle.accessibilityHint)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.pressAction(sender:)))
        purpleRectangle.addGestureRecognizer(gesture)
        
        view.addSubview(purpleRectangle)
        
        return purpleRectangle
    }()
    
    /// One blue square with dimensions 120 x 120. Content is right-aligned and accessible.
    lazy var blueSquare: Square =
    {
        let blueSquareLabel = DynamicTypeLabel(withContent: StringConstants.MainScreen.BlueSquare.label,
                                              aligned: .right)
        
        let blueSquare = Square(labelled: blueSquareLabel, withColor: UIColor.blue, andDimension: blueSquareSide)
        
        blueSquare.setUpAccessibilityWith(identifier: StringConstants.MainScreen.BlueSquare.accessibilityID,
                                          text: StringConstants.MainScreen.BlueSquare.accessibilityLabel)
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
        abstractTimer.textAlignment = .center
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
        
        viewModel.timerLabel.bind
        {
            [weak self] timerLabel
            in
            self?.abstractTimer.text = timerLabel
        }
        
        viewModel.startTimer()
    }
    
    /**
    Updating constraints and start timer on long press and release of long press
        - Parameter sender: the long press gesture recognizer
        - Returns: NA
     */
    @objc func pressAction(sender : UITapGestureRecognizer)
    {
        updateConstraintsForTap()
        
        resized = !resized
        
        viewModel.startTimer()
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

