/**
#  DynamicTypeLabel.swift
   AbstractTimer
 
 ## Overview
 A class for a UILabel using TextStyle
 
*/

import Foundation
import UIKit


public class DynamicTypeLabel: UILabel
{
    // MARK: - Initializers
    
    /// Convenience initializers
    init()
    {
        super.init(frame: .zero)
        
        setUpContentWith(text: StringConstants.AbstractTimerLabel.defaultLabel)
    }
    
    /**
     Convenience initializer dictating the dimensions and color of the Rectangle
        - Parameter description: the description to display in the label
        - Parameter textAlignment: the horizontal text alignment
        - Parameter textStyle: a dynamic type compatible styling option
        - Returns: an instance of a DynamicTypeLabel with the desired configuration
     */
    init(withContent description: String,
         aligned textAlignment: NSTextAlignment = .center,
         andStyledAs textStyle: UIFont.TextStyle = .body)
    {
        super.init(frame: .zero)
        
        setUpContentWith(text: description,
                         aligned: textAlignment,
                         andStyledAs: textStyle)
    }
    
    /// Required initializer
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
        
        setUpContentWith(text: StringConstants.AbstractTimerLabel.defaultLabel)
    }
    
    
    // MARK: - Properties
    
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
        text = description
        
        font = UIFont.preferredFont(forTextStyle: textStyle)
        self.adjustsFontForContentSizeCategory = true
        
        self.textAlignment = textAlignment
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
    }
}
