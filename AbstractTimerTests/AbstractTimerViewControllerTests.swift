/**
#  AbstractTimerViewControllerTests.swift
   AbstractTimer
 
 ## Overview
 Testing AbstractTimerViewController
 
*/

import XCTest
@testable import AbstractTimer


class AbstractTimerViewControllerTests: XCTestCase
{
    // MARK: - Properties
    
    var sut: AbstractTimerViewController!
    var redSquare: Square!
    var whiteRectangle: Rectangle!
    var purpleRectangle: Rectangle!
    var blueSquare: Square!
    var abstractTimer: UILabel!
    
    let redSquareSide: CGFloat = 170
    let blueSquareSide: CGFloat = 120
    
    
    // MARK: - Set Up & Tear Down
    
    override func setUpWithError() throws
    {
        try super.setUpWithError()
        
        sut = AbstractTimerViewController()
        redSquare = sut.redSquare
        whiteRectangle = sut.whiteRectangle
        purpleRectangle = sut.purpleRectangle
        blueSquare = sut.blueSquare
        abstractTimer = sut.abstractTimer
    }

    override func tearDownWithError() throws
    {
        sut = nil
        redSquare = nil
        whiteRectangle = nil
        purpleRectangle = nil
        blueSquare = nil
        abstractTimer = nil
        
        try super.tearDownWithError()
    }

    
    // MARK: - Testing View Configuration
    
    func testRedSquareConfigurationIsCorrect()
    {
        // given our controller
        
        // when starting
        
        // then
        XCTAssertEqual(redSquare.backgroundColor, UIColor.red,
                       "Red square is not red")
        
        XCTAssertTrue(redSquare.contentText.text != "",
                      "Red square's label is not set")
        
        XCTAssertEqual(redSquare.contentText.text,
                       StringConstants.MainScreen.RedSquare.label,
                       "Red square's label is incorrect")
        
        XCTAssertEqual(redSquare.contentText.font,
                       UIFont.preferredFont(forTextStyle: .body),
                       "Red square's text style is incorrect")
        
        XCTAssertEqual(redSquare.contentText.textAlignment, .left,
                       "Red square's alignment is incorrect")
        
        XCTAssertTrue(redSquare.accessibilityLabel != nil,
                       "Red square's accessibility label is not set")
        
        XCTAssertEqual(redSquare.accessibilityLabel,
                       StringConstants.MainScreen.RedSquare.accessibilityLabel,
                       "Red square's accessibility label is incorrect")
        
        XCTAssertEqual(redSquare.bounds.width, redSquareSide,
                       "Red square has wrong width")
        
        XCTAssertEqual(redSquare.bounds.height, redSquareSide,
                       "Red square has wrong height")
    }
    
    func testWhiteRectangleConfigurationIsCorrect()
    {
        // given our controller
        
        // when starting
        
        // then
        XCTAssertEqual(whiteRectangle.backgroundColor, UIColor.white,
                       "White Rectangle is not white")
        
        XCTAssertTrue(whiteRectangle.contentText.text != "",
                      "White Rectangle's label is not set")
        
        XCTAssertEqual(whiteRectangle.contentText.text,
                       StringConstants.MainScreen.WhiteRectangle.label,
                       "White Rectangle's label is incorrect")
        
        XCTAssertEqual(whiteRectangle.contentText.font,
                       UIFont.preferredFont(forTextStyle: .body),
                       "White rectangle's text style is incorrect")
        
        XCTAssertEqual(whiteRectangle.contentText.textAlignment, .center,
                       "White rectangle's alignment is incorrect")
        
        XCTAssertTrue(whiteRectangle.accessibilityLabel != nil,
                       "White Rectangle's accessibility label is not set")
        
        XCTAssertEqual(whiteRectangle.accessibilityLabel,
                       StringConstants.MainScreen.WhiteRectangle.accessibilityLabel,
                       "White Rectangle's accessibility label is incorrect")
        
        XCTAssertTrue(whiteRectangle.accessibilityHint != nil,
                       "White Rectangle's accessibility hint is not set")
        
        XCTAssertEqual(whiteRectangle.accessibilityHint,
                       StringConstants.MainScreen.WhiteRectangle.accessibilityHint,
                       "White Rectangle's accessibility hint is incorrect")
    }
    
    func testPurpleRectangleConfigurationIsCorrect()
    {
        // given our controller
        
        // when starting
        
        // then
        XCTAssertEqual(purpleRectangle.backgroundColor, UIColor.purple,
                       "Purple Rectangle is not purple")
        
        XCTAssertTrue(purpleRectangle.contentText.text != "",
                      "Purple Rectangle's label is not set")
        
        XCTAssertEqual(purpleRectangle.contentText.text,
                       StringConstants.MainScreen.PurpleRectangle.label,
                       "Purple Rectangle's label is incorrect")
        
        XCTAssertEqual(purpleRectangle.contentText.font,
                       UIFont.preferredFont(forTextStyle: .caption2),
                       "Purple rectangle's text style is incorrect")
        
        XCTAssertEqual(purpleRectangle.contentText.textAlignment, .center,
                       "Purple rectangle's alignment is incorrect")
        
        XCTAssertTrue(purpleRectangle.accessibilityLabel != nil,
                       "Purple Rectangle's accessibility label is not set")
        
        XCTAssertEqual(purpleRectangle.accessibilityLabel,
                       StringConstants.MainScreen.PurpleRectangle.accessibilityLabel,
                       "Purple Rectangle's accessibility label is incorrect")
        
        XCTAssertTrue(purpleRectangle.accessibilityHint != nil,
                       "Purple Rectangle's accessibility hint is not set")
        
        XCTAssertEqual(purpleRectangle.accessibilityHint,
                       StringConstants.MainScreen.PurpleRectangle.accessibilityHint,
                       "Purple Rectangle's accessibility hint is incorrect")
    }
    
    func testBlueSquareConfigurationIsCorrect()
    {
        // given our controller
        
        // when starting
        
        // then
        XCTAssertEqual(blueSquare.backgroundColor, UIColor.blue,
                       "Blue square is not blue")
        
        XCTAssertTrue(blueSquare.contentText.text != "",
                      "Blue square's label is not set")
        
        XCTAssertEqual(blueSquare.contentText.text,
                       StringConstants.MainScreen.BlueSquare.label,
                       "Blue square's label is incorrect")
        
        XCTAssertEqual(blueSquare.contentText.font,
                       UIFont.preferredFont(forTextStyle: .body),
                       "Blue square's text style is incorrect")
        
        XCTAssertEqual(blueSquare.contentText.textAlignment, .right,
                       "Blue square's alignment is incorrect")
        
        XCTAssertTrue(blueSquare.accessibilityLabel != nil,
                       "Blue square's accessibility label is not set")
        
        XCTAssertEqual(blueSquare.accessibilityLabel,
                       StringConstants.MainScreen.BlueSquare.accessibilityLabel,
                       "Blue square's accessibility label is incorrect")
        
        XCTAssertEqual(blueSquare.bounds.width, blueSquareSide,
                       "Blue square has wrong width")
        
        XCTAssertEqual(blueSquare.bounds.height, blueSquareSide,
                       "Blue square has wrong height")
    }
    
    func testTimerStartingConfigurationIsCorrect()
    {
        // given our controller
        
        // when starting
        
        // then
        XCTAssertEqual(abstractTimer.text, "00:00:00.000",
                      "AbstractTimer's label is not set")
        
        XCTAssertEqual(abstractTimer.font,
                       .init(descriptor: UIFont.preferredFont(forTextStyle: .title3)
                                                                    .fontDescriptor
                                                                    .addingAttributes([.featureSettings: [[
                                                                                                           UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
                                                                                                           .typeIdentifier: kMonospacedNumbersSelector]]]),
                                                  size: 0),
                       "AbstractTimer's text style is incorrect")
        
        XCTAssertEqual(abstractTimer.textAlignment, .center,
                       "AbstractTimer's alignment is \(abstractTimer.textAlignment)")
        
        XCTAssertTrue(abstractTimer.accessibilityHint != nil,
                       "AbstractTimer's accessibility hint is not set")
        
        XCTAssertEqual(abstractTimer.accessibilityHint,
                       StringConstants.MainScreen.AbstractTimer.accessibilityHint,
                       "AbstractTimer's accessibility hint is incorrect")
    }
}
