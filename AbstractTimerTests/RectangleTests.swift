/**
#  RectangleTests.swift
   AbstractTimer
 
 ## Overview
 Testing Rectangle class
 
*/

import XCTest
@testable import AbstractTimer


class RectangleTests: XCTestCase
{
    // MARK: - Properties
    
    var sut: Rectangle!
    let descriptionText = "I'm a rectangle"
    let accessibilityID = "TestID"
    let accessibilityLabelText = "I'm an accessible rectangle"
    let accessibilityHintText = "No action possible"
    

    // MARK: - Set Up & Tear Down
    
    override func setUpWithError() throws
    {
        try super.setUpWithError()
        
        let rectangleLabel = DynamicTypeLabel(withContent: descriptionText)
        sut = Rectangle(labelled:rectangleLabel, withColor: UIColor.white)
    }

    override func tearDownWithError() throws
    {
        sut = nil
        try super.tearDownWithError()
    }

    
    // MARK: - Testing func setUpAccessibilityWith(identifier:text:andHint)
    
    func testContentElementIsAccessible()
    {
        // given accessibility label text
        
        // when
        sut.setUpAccessibilityWith(identifier: accessibilityID,
                                   text: accessibilityLabelText)
        
        // then
        XCTAssertTrue(sut.accessibilityIdentifier != nil,
                      "Element has no accessibility ID")
        
        XCTAssertEqual(sut.accessibilityIdentifier,
                       accessibilityID,
                       "Accessibility ID is incorrect")
        
        XCTAssertTrue(sut.isAccessibilityElement,
                      "Element not accessible")
    }
    
    func testAccessibilityLabelIsSetCorrectly()
    {
        // given accessibility label text
        
        // when
        sut.setUpAccessibilityWith(identifier: accessibilityID,
                                   text: accessibilityLabelText)
        
        // then
        XCTAssertTrue(sut.accessibilityLabel != nil,
                      "Accessibility Label is not set")
        
        XCTAssertEqual(sut.accessibilityLabel, accessibilityLabelText,
                       "Accessibility Label is incorrect")
        
    }
    
    func testAccessibilityHintIsSetCorrectly()
    {
        // given accessibility label hint
        
        // when
        sut.setUpAccessibilityWith(identifier: accessibilityID,
                                   text: accessibilityLabelText,
                                   andHint: accessibilityHintText)
        
        // then
        XCTAssertTrue(sut.accessibilityHint != nil,
                      "Accessibility Hint is not set")
        
        XCTAssertEqual(sut.accessibilityHint, accessibilityHintText,
                       "Accessibility Hint is incorrect")
        
    }
}
