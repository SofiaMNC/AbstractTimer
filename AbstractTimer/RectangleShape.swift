//
//  RectangleShape.swift
//  AbstractTimer
//
//  Created by Sofia Chevrolat on 10/06/2021.
//

import Foundation
import UIKit


class RectangleShape: UIView
{
    enum Dimensions
    {
        case height
        case width
    }
    
    var height: Int = 0
    {
        didSet
        {
            actOnModified(dimension: .height)
        }
    }
    
    var width: Int = 0
    {
        didSet
        {
            actOnModified(dimension: .width)
        }
    }
    
    lazy var contentText: UILabel =
    {
        let contentText = UILabel()
        contentText.textAlignment = .center
        contentText.numberOfLines = 0
        contentText.lineBreakMode = .byWordWrapping
        
        self.addSubview(contentText)
        
        return contentText
    }()
    
    var color: UIColor = UIColor(named: "default")!
    
    init(color: UIColor)
    {
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: height))
        self.backgroundColor = color
    }
    
    init(height: Int, width: Int)
    {
        self.height = height
        self.width = width
        
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: height))
        self.backgroundColor = color
    }
    
    init(height: Int, width: Int, color: UIColor)
    {
        self.height = height
        self.width = width
        
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: height))
        self.backgroundColor = color
    }
    
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
    }
    
    func actOnModified(dimension: Dimensions)
    {
        // Do nothing here
    }
}
