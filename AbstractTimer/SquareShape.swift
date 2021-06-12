//
//  SquareShape.swift
//  AbstractTimer
//
//  Created by Sofia Chevrolat on 10/06/2021.
//

import Foundation
import UIKit


class SquareShape: RectangleShape
{
    init(dimension: Int, withColor color: UIColor = UIColor(named:"default")!)
    {
        super.init(height: dimension, width: dimension, color: color)
    }
    
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
    }
    
    override func actOnModified(dimension: Dimensions)
    {
        switch dimension
        {
            case .height:
                if width != height
                {
                    width = height
                }
            case .width:
                if height != width
                {
                    height = width
                }
        }
    }
}
