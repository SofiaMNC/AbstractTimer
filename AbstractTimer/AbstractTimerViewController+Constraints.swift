//
//  ViewController+Constraints.swift
//  AbstractTimer
//
//  Created by Sofia Chevrolat on 10/06/2021.
//

import Foundation
import SnapKit
import UIKit

extension AbstractTimerViewController
{
    func setUpConstraints()
    {
        let offsetValue = 20
        
        // One red square 170 x 170 in the top left corner
        // top left corner => leading = 0, top = 0
        redSquare.snp.makeConstraints
        {
            make
            in
            make.width.height.equalTo(redSquare.width)
            make.top.leading.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        redSquare.contentText.snp.makeConstraints
        {
            make
            in
            make.leading.equalTo(redSquare.snp.leading).offset(offsetValue/2)
            make.trailing.equalTo(redSquare.snp.trailing).offset(offsetValue/2)
            make.centerY.equalToSuperview()
        }
        
        // One blue square 120 x 120 on the bottom right corner
        blueSquare.snp.makeConstraints
        {
            make
            in
            make.width.height.equalTo(blueSquare.width)
            make.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        blueSquare.contentText.snp.makeConstraints
        {
            make
            in
            make.trailing.equalTo(blueSquare.snp.trailing).offset(-offsetValue)
            make.leading.equalTo(blueSquare.snp.leading).offset(offsetValue)
            make.centerY.equalToSuperview()
        }
        
        // One white rectangle centered in the screen with a 20 pt offset
        // from all other shapes and boundaries
        whiteRectangle.snp.makeConstraints
        {
            make
            in
            make.top.equalTo(redSquare.snp.bottom).offset(offsetValue)
            leadingConstraint = make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(offsetValue)
            trailingConstraint = make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-offsetValue)
            make.bottom.equalTo(blueSquare.snp.top).offset(-offsetValue)
        }
        
        whiteRectangle.contentText.snp.makeConstraints
        {
            make
            in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.trailing.equalTo(whiteRectangle.snp.trailing).offset(-offsetValue)
            make.leading.equalTo(whiteRectangle.snp.leading).offset(offsetValue)
        }
        
        // One purple rectangle inside the white rectangle with a 20 pt offset
        // from the boundaries
        purpleRectangle.snp.makeConstraints
        {
            make
            in
            make.leading.equalTo(whiteRectangle).offset(offsetValue)
            make.trailing.equalTo(whiteRectangle).offset(-offsetValue)
            make.top.equalTo(whiteRectangle.contentText.snp.bottom).offset(offsetValue)
            make.bottom.equalTo(whiteRectangle.snp.bottom).offset(-offsetValue)
        }
        
        purpleRectangle.contentText.snp.makeConstraints
        {
            make
            in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.trailing.equalTo(purpleRectangle.snp.trailing).offset(-offsetValue)
            make.leading.equalTo(purpleRectangle.snp.leading).offset(offsetValue)
        }
        
        // A timer on the bottom left corner
        abstractTimer.snp.makeConstraints
        {
            make
            in
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(offsetValue)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-offsetValue)
        }
    }
    
    func updateConstraintsForPress()
    {
        whiteRectangle.snp.updateConstraints
        {
            make
            in
            leadingConstraint = make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(redSquare.width)
            trailingConstraint = make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-blueSquare.width)
        }
    }
    
    func updateConstraintsForRelease()
    {
        let offsetValue = 20
        
        whiteRectangle.snp.updateConstraints
        {
            make
            in
            leadingConstraint = make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(offsetValue)
            trailingConstraint = make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-offsetValue)
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection,
                                 with coordinator: UIViewControllerTransitionCoordinator)
    {
        super.willTransition(to: newCollection, with: coordinator)
            
        purpleRectangle.isHidden = !UIDevice.current.orientation.isPortrait
    }
}
