/**
#  HasAccessibleContent.swift
   AbstractTimer

 **Created by Sofia Chevrolat on 06/13/21.*
 **Copyright © 2021 madimedia. All rights reserved.*
 
 ## Overview
 A protocol defining a contract for en entity with accessible text content
 
*/

import Foundation
import UIKit


protocol HasAccessibleTextContent : HasTextContent
{
    /**
    Set up accessibility of the content by providing minimum accessibility information.
     - Parameter ID: the string to use as accessiblity identifier
     - Parameter label: the string to use as accessibility label
     - Parameter hint: the string to use as accessibility hint
     - Returns: NA
     */
    func setUpAccessibilityWith(identifier ID: String,
                                text label: String,
                                andHint hint: String)
}
