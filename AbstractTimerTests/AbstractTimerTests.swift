//
//  AbstractTimerTests.swift
//  AbstractTimerTests
//
//  Created by Sofia Chevrolat on 10/06/2021.
//

import XCTest
@testable import AbstractTimer


class AbstractTimerTests: XCTestCase
{
    var sut: AbstractTimerViewController!
    var redSquare: Square!
    var whiteRectangle: Rectangle!
    var purpleRectangle: Rectangle!
    var blueSquare: Square!
    var abstractTimer: UILabel!
    
    
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

    
    // MARK: - Testing Starting Configuration
    
    func testViewIsInStartingConfiguration()
    {
        // given our view controller
        
        // when
        sut.viewDidLoad()
        
        // then
        XCTAssertFalse(sut.resized,
                       "Main screen is not in starting configuration")
    }
    
    func testRedSquareStartingConfigurationIsCorrect()
    {
        // given our controller
        
        // when
        sut.viewDidLoad()
        
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
        
        XCTAssertTrue(redSquare.contentText.accessibilityLabel != nil,
                       "Red square's accessibility label is not set")
        
        XCTAssertEqual(redSquare.contentText.accessibilityLabel,
                       StringConstants.MainScreen.RedSquare.accessibilityLabel,
                       "Red square's accessibility label is incorrect")
        
        XCTAssertEqual(redSquare.constraint(for: .leading)?.constant, nil,
                       "Red square's leading constraint is incorrect")
        
        XCTAssertEqual(redSquare.constraint(for: .top)?.constant, nil,
                       "Red square's top constraint is incorrect")
    }
    
    func testWhiteRectangleStartingConfigurationIsCorrect()
    {
        // given our controller
        
        // when
        sut.viewDidLoad()
        
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
        
        XCTAssertTrue(whiteRectangle.contentText.accessibilityLabel != nil,
                       "White Rectangle's accessibility label is not set")
        
        XCTAssertEqual(whiteRectangle.contentText.accessibilityLabel,
                       StringConstants.MainScreen.WhiteRectangle.accessibilityLabel,
                       "White Rectangle's accessibility label is incorrect")
        
        XCTAssertTrue(whiteRectangle.contentText.accessibilityHint != nil,
                       "White Rectangle's accessibility hint is not set")
        
        XCTAssertEqual(whiteRectangle.contentText.accessibilityHint,
                       StringConstants.MainScreen.WhiteRectangle.accessibilityHint,
                       "White Rectangle's accessibility hint is incorrect")
        
        XCTAssertEqual(whiteRectangle.constraint(for: .leading)?.constant, 20,
                       "White Rectangle leading constraint is incorrect")
        
        XCTAssertEqual(whiteRectangle.constraint(for: .top)?.constant, 20,
                       "White Rectangle's top constraint is incorrect")
        
        XCTAssertEqual(whiteRectangle.constraint(for: .trailing)?.constant, -20,
                       "White Rectangle trailing constraint is incorrect")
        
        XCTAssertEqual(whiteRectangle.constraint(for: .bottom)?.constant, -20,
                       "White Rectangle's bottom constraint is incorrect")
    }
    
    func testPurpleRectangleStartingConfigurationIsCorrect()
    {
        // given our controller
        
        // when
        sut.viewDidLoad()
        
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
        
        XCTAssertTrue(purpleRectangle.contentText.accessibilityLabel != nil,
                       "Purple Rectangle's accessibility label is not set")
        
        XCTAssertEqual(purpleRectangle.contentText.accessibilityLabel,
                       StringConstants.MainScreen.PurpleRectangle.accessibilityLabel,
                       "Purple Rectangle's accessibility label is incorrect")
        
        XCTAssertTrue(purpleRectangle.contentText.accessibilityHint != nil,
                       "Purple Rectangle's accessibility hint is not set")
        
        XCTAssertEqual(purpleRectangle.contentText.accessibilityHint,
                       StringConstants.MainScreen.PurpleRectangle.accessibilityHint,
                       "Purple Rectangle's accessibility hint is incorrect")
        
        XCTAssertEqual(purpleRectangle.constraint(for: .leading)?.constant, 20,
                       "Purple Rectangle leading constraint is incorrect")
        
        XCTAssertEqual(purpleRectangle.constraint(for: .top)?.constant, 20,
                       "Purple Rectangle's top constraint is incorrect")
        
        XCTAssertEqual(purpleRectangle.constraint(for: .trailing)?.constant, -20,
                       "Purple Rectangle trailing constraint is incorrect")
        
        XCTAssertEqual(purpleRectangle.constraint(for: .bottom)?.constant, -20,
                       "Purple Rectangle's bottom constraint is incorrect")
    }
    
    func testBlueSquareStartingConfigurationIsCorrect()
    {
        // given our controller
        
        // when
        sut.viewDidLoad()
        
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
        
        XCTAssertTrue(blueSquare.contentText.accessibilityLabel != nil,
                       "Blue square's accessibility label is not set")
        
        XCTAssertEqual(blueSquare.contentText.accessibilityLabel,
                       StringConstants.MainScreen.BlueSquare.accessibilityLabel,
                       "Blue square's accessibility label is incorrect")
        
        XCTAssertEqual(blueSquare.bounds.width, 120,
                       "Blue square has wrong width")
        
        XCTAssertEqual(blueSquare.bounds.height, 120,
                       "Blue square has wrong height")
        
        XCTAssertEqual(blueSquare.constraint(for: .trailing)?.constant, nil,
                       "Blue square's trailing constraint is incorrect")
        
        XCTAssertEqual(blueSquare.constraint(for: .bottom)?.constant, nil,
                       "Blue square's bottom constraint is incorrect")
    }
    
    func testTimerStartingConfigurationIsCorrect()
    {
        // given our controller
        
        // when
        sut.viewDidLoad()
        
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
