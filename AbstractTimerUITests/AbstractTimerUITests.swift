/**
#  AbstractTimerUITests.swift
   AbstractTimer
 
 ## Overview
 Testing reactions to UI events.
 
*/

import XCTest


class AbstractTimerUITests: XCTestCase
{
    // MARK: - Properties
    
    var app: XCUIApplication!
    
    let spacingValue: CGFloat = 20
    
    var redSquare: XCUIElement!
    var whiteRectangle: XCUIElement!
    var whiteRectangleLabel: XCUIElement!
    var purpleRectangle: XCUIElement!
    var blueSquare: XCUIElement!
    
    
    // MARK: - Set Up
    
    override func setUpWithError() throws
    {
        try super.setUpWithError()
        continueAfterFailure = false
      
        app = XCUIApplication()
        XCUIDevice.shared.orientation = UIDeviceOrientation.portrait
        
        redSquare = app.otherElements["RedSquare"]
        whiteRectangle = app.otherElements["WhiteRectangle"]
        purpleRectangle = app.otherElements["PurpleRectangle"]
        blueSquare = app.otherElements["BlueSquare"]
        whiteRectangleLabel = app.staticTexts["White Rectangle (20 offset). Can be longpressed"]

        app.launch()
    }

    
    // MARK: - Testing Initial Configuration
    
    func testAllShapesExistOnStart()
    {
        XCTAssertTrue(redSquare.exists)

        XCTAssertTrue(whiteRectangle.exists)

        XCTAssertTrue(purpleRectangle.exists)

        XCTAssertTrue(blueSquare.exists)
    }
    
    func testWhiteRectangeInitialPositioningIsCorrect()
    {
       /// Testing White Rectangle's position with regards to Red Square
        XCTAssertEqual(whiteRectangle.frame.origin.x, redSquare.frame.origin.x + spacingValue,
                       "White Rectangle's origin is not properly set on the X-axis with regards to Red Square")
        
        XCTAssertEqual(whiteRectangle.frame.origin.y, redSquare.frame.origin.y + redSquare.frame.height + spacingValue,
                       "White Rectangle's origin is not properly set on the Y-axis with regards to Red Square")
        
        /// Test White Rectangle's position with regards to Blue Square
        let whiteRectangleEndPointX = whiteRectangle.frame.origin.x + whiteRectangle.frame.width
        let whiteRectangleEndPointY = whiteRectangle.frame.origin.y + whiteRectangle.frame.height
        
        XCTAssertEqual(whiteRectangleEndPointX, blueSquare.frame.origin.x + blueSquare.frame.width - spacingValue,
                       "White Rectangle's width is incorrect with regards to Blue Square")
        
        XCTAssertEqual(whiteRectangleEndPointY, blueSquare.frame.origin.y - spacingValue,
                       "White Rectangle's height is incorrect with regards to Blue Square")
        
    }
    
    func testPurpleRectangeInitialPositioningIsCorrect()
    {
        XCTAssertEqual(purpleRectangle.frame.width, whiteRectangle.frame.width - (2 * spacingValue),
                       "Purple Rectangle has incorrect width")
        
        XCTAssertEqual(purpleRectangle.frame.origin.x, whiteRectangle.frame.origin.x + spacingValue,
                       "Purple Rectangle is positioned incorrectly on X-axis.")
        
        let whiteRectangleLabelEndPointY = whiteRectangleLabel.frame.origin.y + whiteRectangleLabel.frame.height
        XCTAssertEqual(Int(purpleRectangle.frame.origin.y), Int(whiteRectangleLabelEndPointY + spacingValue),
                       "Purple Rectangle is positioned incorrectly on Y-axis.")

    }
    
    func testPurpleViewVisibiliyOnDeviceRotationIsCorrect()
    {
        XCUIDevice.shared.orientation = UIDeviceOrientation.landscapeLeft
        
        XCTAssertFalse(purpleRectangle.exists)
        
        XCUIDevice.shared.orientation = UIDeviceOrientation.portrait

        XCTAssertTrue(purpleRectangle.exists)
    }
    
    
    // MARK: - Testing resizing behavior on tap
    
    func testResizingOnTapWhiteRectangleIsCorrect()
    {
        // given
        let initialWhiteRectangleWidth = whiteRectangle.frame.width
        let initialWhiteRectangleHeight = whiteRectangle.frame.height

        // when
        whiteRectangle.tap()
        
        // then
        /// Testing that width has shrunk
        XCTAssertTrue(whiteRectangle.frame.width < initialWhiteRectangleWidth,
                      "White rectangle's width has not shrunk")
        
        /// Testing that height has remained the same
        XCTAssertEqual(whiteRectangle.frame.height, initialWhiteRectangleHeight,
                      "White rectangle's length has changed")
        
        /// Testing White Rectangle's position with regards to Red Square
        XCTAssertEqual(whiteRectangle.frame.origin.x, redSquare.frame.origin.x + redSquare.frame.width,
                       "White Rectangle's origin is not properly set on the X-axis with regards to Red Square")
        
        XCTAssertEqual(whiteRectangle.frame.origin.y, redSquare.frame.origin.y + redSquare.frame.height + spacingValue,
                       "White Rectangle's origin is not properly set on the Y-axis with regards to Red Square")
        
        /// Test White Rectangle's position with regards to Blue Square
        let whiteRectangleEndPointX = whiteRectangle.frame.origin.x + whiteRectangle.frame.width
        let whiteRectangleEndPointY = whiteRectangle.frame.origin.y + whiteRectangle.frame.height
        let whiteRectangleLabelEndPointY = whiteRectangleLabel.frame.origin.y + whiteRectangleLabel.frame.height
        
        XCTAssertEqual(whiteRectangleEndPointX, blueSquare.frame.origin.x,
                       "White Rectangle's width is incorrect with regards to Blue Square")
        
        XCTAssertEqual(whiteRectangleEndPointY + spacingValue, blueSquare.frame.origin.y,
                       "White Rectangle's height is incorrect with regards to Blue Square")
        
        /// Test White Rectangle's position with regards to Purple Rectangle
        XCTAssertEqual(whiteRectangle.frame.origin.x + spacingValue, purpleRectangle.frame.origin.x,
                       "Purple Rectangle is not properly positioned on the X-axis with regards to White Rectangle's label")
        
        XCTAssertEqual(Int(whiteRectangleLabelEndPointY + spacingValue), Int(purpleRectangle.frame.origin.y),
                       "Purple Rectangle is not properly positioned on the Y-axis with regards to White Rectangle's label")
        
        let purpleRectangleEndPointX = purpleRectangle.frame.origin.x + purpleRectangle.frame.width
        let purpleRectangleEndPointY = purpleRectangle.frame.origin.y + purpleRectangle.frame.height
        
        XCTAssertEqual(whiteRectangleEndPointX, purpleRectangleEndPointX + spacingValue,
                       "Purple Rectangle's width is incorrect with regards to White Rectangle")
        
        XCTAssertEqual(whiteRectangleEndPointY, purpleRectangleEndPointY + spacingValue,
                       "Purple Rectangle's height is incorrect with regards to White Rectangle")
    }
    
    func testResizingOnTapPurpleRectangleIsCorrect()
    {
        // given
        let initialWhiteRectangleWidth = whiteRectangle.frame.width
        let initialWhiteRectangleHeight = whiteRectangle.frame.height

        // when
        purpleRectangle.tap()
        
        // then
        /// Testing that width has shrunk
        XCTAssertTrue(whiteRectangle.frame.width < initialWhiteRectangleWidth,
                      "White rectangle's width has not shrunk")
        
        /// Testing that height has remained the same
        XCTAssertEqual(whiteRectangle.frame.height, initialWhiteRectangleHeight,
                      "White rectangle's length has changed")
        
        /// Testing White Rectangle's position with regards to Red Square
        XCTAssertEqual(whiteRectangle.frame.origin.x, redSquare.frame.origin.x + redSquare.frame.width,
                       "White Rectangle's origin is not properly set on the X-axis with regards to Red Square")
        
        XCTAssertEqual(whiteRectangle.frame.origin.y, redSquare.frame.origin.y + redSquare.frame.height + spacingValue,
                       "White Rectangle's origin is not properly set on the Y-axis with regards to Red Square")
        
        /// Test White Rectangle's position with regards to Blue Square
        let whiteRectangleEndPointX = whiteRectangle.frame.origin.x + whiteRectangle.frame.width
        let whiteRectangleEndPointY = whiteRectangle.frame.origin.y + whiteRectangle.frame.height
        let whiteRectangleLabelEndPointY = whiteRectangleLabel.frame.origin.y + whiteRectangleLabel.frame.height
        
        XCTAssertEqual(whiteRectangleEndPointX, blueSquare.frame.origin.x,
                       "White Rectangle's width is incorrect with regards to Blue Square")
        
        XCTAssertEqual(whiteRectangleEndPointY + spacingValue, blueSquare.frame.origin.y,
                       "White Rectangle's height is incorrect with regards to Blue Square")
        
        /// Test White Rectangle's position with regards to Purple Rectangle
        XCTAssertEqual(whiteRectangle.frame.origin.x + spacingValue, purpleRectangle.frame.origin.x,
                       "Purple Rectangle is not properly positioned on the X-axis with regards to White Rectangle's label")
        
        XCTAssertEqual(Int(whiteRectangleLabelEndPointY + spacingValue), Int(purpleRectangle.frame.origin.y),
                       "Purple Rectangle is not properly positioned on the Y-axis with regards to White Rectangle's label")
        
        let purpleRectangleEndPointX = purpleRectangle.frame.origin.x + purpleRectangle.frame.width
        let purpleRectangleEndPointY = purpleRectangle.frame.origin.y + purpleRectangle.frame.height
        
        XCTAssertEqual(whiteRectangleEndPointX, purpleRectangleEndPointX + spacingValue,
                       "Purple Rectangle's width is incorrect with regards to White Rectangle")
        
        XCTAssertEqual(whiteRectangleEndPointY, purpleRectangleEndPointY + spacingValue,
                       "Purple Rectangle's height is incorrect with regards to White Rectangle")
    }
    
    func testResizesBackOnSecondTapIsCorrect()
    {
        // given
        let initialWhiteRectangleWidth = whiteRectangle.frame.width
        let initialWhiteRectangleHeight = whiteRectangle.frame.height
        let initialOrigin = whiteRectangle.frame.origin
        
        // when
        whiteRectangle.tap()
        whiteRectangle.tap()
        
        // then
        XCTAssertEqual(initialOrigin.x, whiteRectangle.frame.origin.x,
                       "Origin has changed along the X-axis")
        
        XCTAssertEqual(initialOrigin.y, whiteRectangle.frame.origin.y,
                       "Origin has changed along the Y-axis")
        
        XCTAssertEqual(initialWhiteRectangleHeight, whiteRectangle.frame.height,
                       "Height has changed")
        
        XCTAssertEqual(initialWhiteRectangleWidth, whiteRectangle.frame.width,
                       "Width has changed")
    }
}
