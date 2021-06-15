/**
#  DeliverableScenarioInAction.swift
   AbstractTimer
 
 ## Overview
 An easy visualization of the requested scenario in the simulator.
 
*/

import XCTest

class DeliverableScenarioInAction: XCTestCase
{
    // MARK: - Properties
    
    var app: XCUIApplication!
    
    var whiteRectangle: XCUIElement!
    var purpleRectangle: XCUIElement!

    
    // MARK: - Set Up
    
    override func setUpWithError() throws
    {
        try super.setUpWithError()
        continueAfterFailure = false
      
        app = XCUIApplication()
        XCUIDevice.shared.orientation = UIDeviceOrientation.portrait
        
        whiteRectangle = app.otherElements["WhiteRectangle"]
        purpleRectangle = app.otherElements["PurpleRectangle"]

        app.launch()
    }
    
    
    // MARK: - Deliverable scenario
    /**
            NB: This is not an actual test case.
               This allows easily visualization of the requested scenario in a simulator.
     */
    func testDeliverable()
    {
        sleep(5)
        
        // 1. White and Purple rectangles resize on touch
        purpleRectangle.tap()
        
        sleep(5)
        
        
        // 2. Rotating from portrait to landscape : Purple Rectangle disappears
        XCUIDevice.shared.orientation = UIDeviceOrientation.landscapeRight

        sleep(5)
        
        
        // 3. White Rectangle resizes on touch
        whiteRectangle.tap()
        
        sleep(5)
        
        // 4. Rotate back to portrait mode, Purple Rectangle reappears
        XCUIDevice.shared.orientation = UIDeviceOrientation.portrait
        
        sleep(5)
    }
}
