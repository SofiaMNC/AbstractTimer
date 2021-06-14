/**
#  Square.swift
   AbstractTimer
 
 **Created by Sofia Chevrolat on 06/10/21.*
 **Copyright © 2021 madimedia. All rights reserved.*
 
 ## Overview
 A class describing a square. A subclass of Rectangle where height and width are always equal.
*/

import Foundation
import UIKit


class Square: Rectangle
{
    // MARK: - Properties and Property Observers
    
    /// Adjust width upon updating of height to ensure
    /// that width is always the same as height
    override var height: Int
    {
        didSet
        {
            if width != height
            {
                width = height
            }
        }
    }
    
    /// Adjust height upon updating of width to ensure
    /// that height is always the same as width
    override var width: Int
    {
        didSet
        {
            if height != width
            {
                height = width
            }
        }
    }
    
    
    // MARK: - Initializers
    
    /**
     Convenience initializer dictating the dimension and color of the Square
        - Parameter color: the color to give the Square
        - Parameter side: the length of the Square's sides
        - Returns: an instance of a Square with the desired configuration
     */
    init(color: UIColor, side: Int = 0)
    {
        super.init(color: color, height: side, width: side)
    }
    
    /// Required initializer
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
    }
}
