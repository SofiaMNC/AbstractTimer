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
    
    lazy var formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional // Use the appropriate positioning for the current locale
        formatter.allowedUnits = [ .hour, .minute, .second ] // Units to display in the formatted string
        formatter.zeroFormattingBehavior = [ .pad ] // Pad with zeroes where appropriate for the locale
        return formatter
    }()
    
    // One red square 170 x 170
    lazy var redSquare: SquareShape = {
        let redSquare = SquareShape(dimension: 170, withColor: UIColor.red)
        redSquare.contentText.text = "Red Square (170x170)"
        redSquare.contentText.font = UIFont.preferredFont(forTextStyle: .body)
        redSquare.contentText.adjustsFontForContentSizeCategory = true
        redSquare.contentText.textAlignment = .left
        view.addSubview(redSquare)
        
        return redSquare
    }()
    
    // One white rectangle
    lazy var whiteRectangle: RectangleShape = {
        let whiteRectangle = RectangleShape(color: UIColor.white)
        whiteRectangle.contentText.text = "White Rectangle (20 offset)"
        whiteRectangle.contentText.font = UIFont.preferredFont(forTextStyle: .body)
        whiteRectangle.contentText.adjustsFontForContentSizeCategory = true
        
        let gesture = UILongPressGestureRecognizer(target: self, action:  #selector(self.pressAction(sender:)))
        whiteRectangle.addGestureRecognizer(gesture)
        
        view.addSubview(whiteRectangle)
        
        return whiteRectangle
    }()
    
    // One purple rectangle
    lazy var purpleRectangle: RectangleShape = {
        let purpleRectangle = RectangleShape(color: UIColor.purple)
        purpleRectangle.contentText.text = "Purple Rectangle"
        purpleRectangle.contentText.font = UIFont.preferredFont(forTextStyle: .caption2)
        purpleRectangle.contentText.adjustsFontForContentSizeCategory = true
        
        let gesture = UILongPressGestureRecognizer(target: self, action:  #selector(self.pressAction(sender:)))
        purpleRectangle.addGestureRecognizer(gesture)
        
        view.addSubview(purpleRectangle)
        
        return purpleRectangle
    }()
    
    // One blue square 120 x 120
    lazy var blueSquare: SquareShape = {
        let blueSquare = SquareShape(dimension: 120, withColor: UIColor.blue)
        blueSquare.contentText.text = "Blue Square (120x120)"
        blueSquare.contentText.font = UIFont.preferredFont(forTextStyle: .body)
        blueSquare.contentText.adjustsFontForContentSizeCategory = true
        blueSquare.contentText.textAlignment = .right
        view.addSubview(blueSquare)
        
        return blueSquare
    }()
    
    lazy var abstractTimer: UILabel = {
        let abstractTimer = UILabel(frame: .zero)
        abstractTimer.text = "00:10:00.0000"
        // TODO: Use monospaced font while respecting accessibility
        abstractTimer.font = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: .regular)
        abstractTimer.font = UIFont.preferredFont(forTextStyle: .title3)
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

