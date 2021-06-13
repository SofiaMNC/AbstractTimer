//
//  ViewController.swift
//  AbstractTimer
//
//  Created by Sofia Chevrolat on 10/06/2021.
//

import UIKit
import SnapKit

class AbstractTimerViewController: UIViewController
{
    var leadingConstraint: ConstraintMakerEditable?
    var trailingConstraint: ConstraintMakerEditable?
    
    var timer: Timer?
    
    lazy var formatter: DateComponentsFormatter =
    {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional // Use the appropriate positioning for the current locale
        formatter.allowedUnits = [ .hour, .minute, .second ] // Units to display in the formatted string
        formatter.zeroFormattingBehavior = [ .pad ] // Pad with zeroes where appropriate for the locale
        return formatter
    }()
    
    // One red square 170 x 170
    lazy var redSquare: SquareShape =
    {
        let redSquare = SquareShape(dimension: 170, withColor: UIColor.red)
        redSquare.contentText.text = NSLocalizedString("Red Square (170x170)",
                                                       comment: "The label text for the top left square")
        redSquare.isAccessibilityElement = true
        redSquare.accessibilityLabel = NSLocalizedString("Red Square (170x170). No action possible",
                                                         comment: "The accessibility label text for the top left square")
        redSquare.contentText.font = UIFont.preferredFont(forTextStyle: .body)
        redSquare.contentText.adjustsFontForContentSizeCategory = true
        redSquare.contentText.textAlignment = .left
        view.addSubview(redSquare)
        
        return redSquare
    }()
    
    // One white rectangle
    lazy var whiteRectangle: RectangleShape =
    {
        let whiteRectangle = RectangleShape(color: UIColor.white)
        whiteRectangle.contentText.text = NSLocalizedString("White Rectangle (20 offset)",
                                                            comment: "The label text for the largest middle rectangle")
        whiteRectangle.isAccessibilityElement = true
        whiteRectangle.accessibilityLabel = NSLocalizedString("White Rectangle (20 offset). Can be longpressed",
                                                          comment: "The accessibility label text for the smallest middle rectangle")
        whiteRectangle.accessibilityHint = NSLocalizedString("Long pressing this shape will reshape it as well as the purple rectangle inside it, and restart the timer until you release your press, at which point the view goes back to normal and the timer restarts.", comment: "The accessibility hint describing what can be done with the white rectangle")
        whiteRectangle.contentText.font = UIFont.preferredFont(forTextStyle: .body)
        whiteRectangle.contentText.adjustsFontForContentSizeCategory = true
        
        let gesture = UILongPressGestureRecognizer(target: self, action:  #selector(self.pressAction(sender:)))
        whiteRectangle.addGestureRecognizer(gesture)
        
        view.addSubview(whiteRectangle)
        
        return whiteRectangle
    }()
    
    // One purple rectangle
    lazy var purpleRectangle: RectangleShape =
    {
        let purpleRectangle = RectangleShape(color: UIColor.purple)
        purpleRectangle.contentText.text = NSLocalizedString("Purple Rectangle",
                                                             comment: "The label text for the smallest middle rectangle")
        purpleRectangle.isAccessibilityElement = true
        /*purpleRectangle.accessibilityLabel = NSLocalizedString("Purple Rectangle. This rectangle will disappear in landscape mode. Can be longpressed.",
                                                          comment: "The accessibility label text for the smallest middle rectangle")*/
        purpleRectangle.accessibilityHint = NSLocalizedString("Long pressing this shape will reshape it as well as the white rectangle around it, and restart the timer until you release your press, at which point the view goes back to normal and the timer restarts.", comment: "Describing what can be done with the purple rectangle")
        purpleRectangle.contentText.font = UIFont.preferredFont(forTextStyle: .caption2)
        purpleRectangle.contentText.adjustsFontForContentSizeCategory = true
        
        let gesture = UILongPressGestureRecognizer(target: self, action:  #selector(self.pressAction(sender:)))
        purpleRectangle.addGestureRecognizer(gesture)
        
        view.addSubview(purpleRectangle)
        
        return purpleRectangle
    }()
    
    // One blue square 120 x 120
    lazy var blueSquare: SquareShape =
    {
        let blueSquare = SquareShape(dimension: 120, withColor: UIColor.blue)
        blueSquare.contentText.text = NSLocalizedString("Blue Square (120x120)",
                                                        comment: "The label text for the bottom right square")
        blueSquare.isAccessibilityElement = true
        blueSquare.accessibilityLabel = NSLocalizedString("Blue Square (120x120). No action possible",
                                                          comment: "The accessibility label text for the bottom right square")
        blueSquare.contentText.font = UIFont.preferredFont(forTextStyle: .body)
        blueSquare.contentText.adjustsFontForContentSizeCategory = true
        blueSquare.contentText.textAlignment = .right
        view.addSubview(blueSquare)
        
        return blueSquare
    }()
    
    lazy var abstractTimer: UILabel =
    {
        let abstractTimer = UILabel(frame: .zero)
        abstractTimer.isAccessibilityElement = true
        abstractTimer.accessibilityLabel = NSLocalizedString("Timer with hours, minutes, seconds and milliseconds. Restart by long pressing the white or purple rectangle, and by releasing the white or purple rectangle (middle of the screen)", comment: "The accessibility label for the timer")
        abstractTimer.font = .init(descriptor: UIFont.preferredFont(forTextStyle: .title3)
                         .fontDescriptor.addingAttributes([
                         .featureSettings: [[
                             UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
                                                        .typeIdentifier: kMonospacedNumbersSelector]]]),
                                                        size: 0)
        abstractTimer.adjustsFontForContentSizeCategory = true
        abstractTimer.textColor = UIColor.white
        view.addSubview(abstractTimer)
        
        return abstractTimer
    }()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        setUpConstraints()
        startTimer()
    }
}

