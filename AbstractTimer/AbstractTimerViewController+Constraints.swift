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
        // One red square 170 x 170 in the top left corner
        // top left corner => leading = 0, top = 0
        redSquare.snp.makeConstraints
        {
            make
            in
            make.width.height.equalTo(170)
            make.top.leading.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        redSquare.contentText.snp.makeConstraints
        {
            make
            in
            make.leading.equalTo(redSquare.snp.leading).offset(10)
            make.trailing.equalTo(redSquare.snp.trailing).offset(-10)
            make.centerY.equalToSuperview()
        }
        
        // One blue square 120 x 120 on the bottom right corner
        blueSquare.snp.makeConstraints
        {
            make
            in
            make.width.height.equalTo(120)
            make.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        blueSquare.contentText.snp.makeConstraints
        {
            make
            in
            make.trailing.equalTo(blueSquare.snp.trailing).offset(-20)
            make.leading.equalTo(blueSquare.snp.leading).offset(20)
            make.centerY.equalToSuperview()
        }
        
        // One white rectangle centered in the screen with a 20 pt offset
        // from all other shapes and boundaries
        whiteRectangle.snp.makeConstraints
        {
            make
            in
            make.top.equalTo(redSquare.snp.bottom).offset(20)
            leadingConstraint = make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            trailingConstraint = make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
            make.bottom.equalTo(blueSquare.snp.top).offset(-20)
        }
        
        whiteRectangle.contentText.snp.makeConstraints
        {
            make
            in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.trailing.equalTo(whiteRectangle.snp.trailing).offset(-20)
            make.leading.equalTo(whiteRectangle.snp.leading).offset(20)
        }
        
        // One purple rectangle inside the white rectangle with a 20 pt offset
        // from the boundaries
        purpleRectangle.snp.makeConstraints
        {
            make
            in
            make.leading.equalTo(whiteRectangle).offset(20)
            make.trailing.equalTo(whiteRectangle).offset(-20)
            make.top.equalTo(whiteRectangle.contentText.snp.bottom).offset(20)
            make.bottom.equalTo(whiteRectangle.snp.bottom).offset(-20)
        }
        
        purpleRectangle.contentText.snp.makeConstraints
        {
            make
            in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.trailing.equalTo(purpleRectangle.snp.trailing).offset(-20)
            make.leading.equalTo(purpleRectangle.snp.leading).offset(20)
        }
        
        // A timer on the bottom left corner
        abstractTimer.snp.makeConstraints
        {
            make
            in
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
        }
    }
    
    func updateConstraintsForPress()
    {
        whiteRectangle.snp.updateConstraints
        {
            make
            in
            leadingConstraint = make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(170)
            trailingConstraint = make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-120)
        }
    }
    
    func updateConstraintsForRelease()
    {
        whiteRectangle.snp.updateConstraints
        {
            make
            in
            leadingConstraint = make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            trailingConstraint = make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection,
                                 with coordinator: UIViewControllerTransitionCoordinator)
    {
        super.willTransition(to: newCollection, with: coordinator)
            
        purpleRectangle.isHidden = !UIDevice.current.orientation.isPortrait
    }
}
