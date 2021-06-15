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


class Rectangle: UIView, HasTextContent, HasCompleteAccessibility
{
    // MARK: - Properties
    
    /// The rectangle's dimensions
    var height: Int = 0
    var width: Int = 0
    
    /// The label to house text, in conformance with the HasAccessibleTextContent
    /// protocol
    lazy var contentText: UILabel =
    {
        let contentText = UILabel()
        contentText.textAlignment = .center
        contentText.numberOfLines = 0
        contentText.lineBreakMode = .byWordWrapping
        
        self.addSubview(contentText)
        
        return contentText
    }()
     
    
    // MARK: - Initializers
    
    /**
     Convenience initializer dictating the dimensions and color of the Rectangle
        - Parameter color: the color to give the Rectangle
        - Parameter height: the height of the Rectangle
        - Parameter width: the width of the Rectangle
        - Returns: an instance of a Rectangle with the desired configuration
     */
    init(color: UIColor, height: Int = 0, width: Int = 0)
    {
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: height))
        
        self.height = height
        self.width = width
        self.backgroundColor = color
    }
    
    /// Required initializer
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
    }

    
    // MARK: - Methods
    
    /**
    Set up the text by providing minimum content and styling information.
        - Parameter description: the actual text content
        - Parameter textAlignment: the horizontal text alignment
        - Parameter textStyle: a dynamic type compatible styling option
        - Returns: NA
     */
    func setUpContentWith(text description: String,
                          aligned textAlignment: NSTextAlignment = .center,
                          andStyledAs textStyle: UIFont.TextStyle = .body)
    {
        contentText.text = description
        contentText.font = UIFont.preferredFont(forTextStyle: textStyle)
        contentText.adjustsFontForContentSizeCategory = true
        contentText.textAlignment = textAlignment
    }
    
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
