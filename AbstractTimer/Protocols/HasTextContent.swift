/**
#  HasTextContent.swift
   AbstractTimer
 
 **Created by Sofia Chevrolat on 06/13/21.*
 **Copyright © 2021 madimedia. All rights reserved.*
 
 ## Overview
 A protocol defining a contract for an entity with text content
 
*/

import Foundation
import UIKit


protocol HasTextContent
{
    /// The view for the textual content
    var contentText: UILabel { get }
    
    /**
    Set up the text by providing minimum content and styling information.
        - Parameter description: the actual text content
        - Parameter textAlignment: the horizontal text alignment
        - Parameter textStyle: a dynamic type compatible styling option
        - Returns: NA
     */
    func setUpContentWith(text description: String,
                          aligned textAlignment: NSTextAlignment,
                          andStyledAs textStyle: UIFont.TextStyle)
}
