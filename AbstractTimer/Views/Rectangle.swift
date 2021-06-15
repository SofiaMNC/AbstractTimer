/**
#  Rectangle.swift
   AbstractTimer
 
 **Created by Sofia Chevrolat on 06/10/21.*
 **Copyright © 2021 madimedia. All rights reserved.*
 
 ## Overview
 A class describing a rectangle. A subclass of UIVIew, it conforms to the HasAccessibleTextContent protocol
*/

import Foundation
import UIKit


class Rectangle: UIView, HasCompleteAccessibility
{
    // MARK: - Properties
    
    /// The rectangle's dimensions
    var height: Int = 0
    var width: Int = 0
    
    /// The label to house text, in conformance with the HasAccessibleTextContent
    /// protocol
    var contentText: DynamicTypeLabel!
     
    
    // MARK: - Initializers
    
    /**
     Convenience initializer dictating the dimensions and color of the Rectangle
        - Parameter description: the description to display in the Rectangle
        - Parameter color: the color to give the Rectangle
        - Parameter height: the height of the Rectangle
        - Parameter width: the width of the Rectangle
        - Returns: an instance of a Rectangle with the desired configuration
     */
    init(labelled description: DynamicTypeLabel, withColor color: UIColor, height: Int = 0, width: Int = 0)
    {
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: height))
        
        self.height = height
        self.width = width
        self.backgroundColor = color
        
        self.contentText = description
        self.addSubview(contentText)
    }
    
    /// Required initializer
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
        
        self.contentText = DynamicTypeLabel()
        self.addSubview(contentText)
    }

    
    // MARK: - Methods
    
    /**
    Set up accessibility of the Rectangle by providing minimum accessibility information.
        - Parameter ID: the string to use as accessiblity identifier
        - Parameter label: the string to use as accessibility label
        - Parameter hint: the string to use as accessibility hint
        - Returns: NA
     */
    func setUpAccessibilityWith(identifier ID: String, text label: String, andHint hint: String = "")
    {
        self.accessibilityIdentifier = ID
        self.accessibilityLabel = label
        self.accessibilityHint = hint
        self.isAccessibilityElement = true
    }
}
