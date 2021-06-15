//
//  AbstractTimerUITests.swift
//  AbstractTimerUITests
//
//  Created by Sofia Chevrolat on 10/06/2021.
//

import XCTest


class AbstractTimerUITests: XCTestCase
{
    var app: XCUIApplication!
    
    override func setUpWithError() throws
    {
        try super.setUpWithError()
        continueAfterFailure = false
      
        app = XCUIApplication()
        XCUIDevice.shared.orientation = UIDeviceOrientation.portrait

        app.launch()
    }

    
    func testAllShapesExistOnStart()
    {
        let redSquare = app.otherElements["RedSquare"]
        XCTAssertTrue(redSquare.exists)

        let whiteRectangle = app.otherElements["WhiteRectangle"]
        XCTAssertTrue(whiteRectangle.exists)

        let purpleRectangle = app.otherElements["PurpleRectangle"]
        XCTAssertTrue(purpleRectangle.exists)

        let blueSquare = app.otherElements["BlueSquare"]
        XCTAssertTrue(blueSquare.exists)
    }
    
    func testRedSquareInitialConfigIsCorrect()
    {
        let redSquare = app.otherElements["RedSquare"]
                
        XCTAssertEqual(redSquare.frame.width, redSquare.frame.height,
                       "Red Square is not a square")
        
        XCTAssertEqual(redSquare.frame.width, 170,
                       "Red Square has incorrect width")
        
        /*XCTAssertEqual(redSquare.frame.origin, CGPoint(x: 0,y: mainWindow.frame.origin.y),
                       "Red Square origin is correct")*/

    }
    
    func testWhiteRectangeInitialConfigIsCorrect()
    {
        let whiteRectangle = app.otherElements["WhiteRectangle"]
        let redSquare = app.otherElements["RedSquare"]
        
        XCTAssertEqual(whiteRectangle.frame.origin,
                       CGPoint(x: 20, y: redSquare.frame.height + 20),
                       "White Rectangle has incorrect position")
        
    }
    
    func testPurpleRectangeInitialConfigIsCorrect()
    {
        let whiteRectangle = app.otherElements["WhiteRectangle"]
        let purpleRectangle = app.otherElements["PurpleRectangle"]
        
        XCTAssertEqual(purpleRectangle.frame.width, whiteRectangle.frame.width-40,
                       "Purple Rectangle has incorrect width")
        
        XCTAssertEqual(purpleRectangle.frame.origin.x, whiteRectangle.frame.origin.x+20,
                       "Purple Rectangle is positioned incorrectly on X-axis.")

    }
    
    func testBlueSquareInitialConfigIsCorrect()
    {
        let blueSquare = app.otherElements["BlueSquare"]
        
        XCTAssertEqual(blueSquare.frame.width, blueSquare.frame.height,
                       "Blue Square is not a square")
        
        XCTAssertEqual(blueSquare.frame.width, 120,
                       "Blue Square has incorrect width")
        
        /*XCTAssertEqual(blueSquare.frame.origin, CGPoint(x: 0,y: mainWindow.frame.origin.y),
                       "Blue Square origin is correct")*/

    }
    
    func testResizingOnTapWhiteRectangleIsCorrect()
    {
        // given
        
        let whiteRectangle = app.otherElements["whiteRectangle"]
        
        let initialWidth = whiteRectangle.frame.width
        
        whiteRectangle.tap()
        
        XCTAssertTrue(whiteRectangle.frame.width < initialWidth)
                
        /*let redSquare = app.segmentedControls.buttons["Slide"]
        let typeButton = app.segmentedControls.buttons["Type"]
        let slideLabel = app.staticTexts["Get as close as you can to: "]
        let typeLabel = app.staticTexts["Guess where the slider is: "]
    
        // then
        if slideButton.isSelected
        {
            XCTAssertTrue(slideLabel.exists)
            XCTAssertFalse(typeLabel.exists)
          
            typeButton.tap()
          
            XCTAssertTrue(typeLabel.exists)
            XCTAssertFalse(slideLabel.exists)
        }
        else if typeButton.isSelected
        {
            XCTAssertTrue(typeLabel.exists)
            XCTAssertFalse(slideLabel.exists)
            
            slideButton.tap()
            
            XCTAssertTrue(slideLabel.exists)
            XCTAssertFalse(typeLabel.exists)
        }*/
    }
    
    func testResizingOnTapPurpleRectangleIsCorrect()
    {
        
    }
}
