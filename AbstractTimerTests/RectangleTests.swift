//
//  RectangleTests.swift
//  AbstractTimerTests
//
//  Created by Sofia Chevrolat on 14/06/2021.
//

import XCTest
@testable import AbstractTimer


class RectangleTests: XCTestCase
{
    var sut: Rectangle!
    let descriptionText = "I'm a rectangle"
    let accessibilityID = "TestID"
    let accessibilityLabelText = "I'm a rectangle"
    let accessibilityHintText = "No action possible"
    

    override func setUpWithError() throws
    {
        try super.setUpWithError()
        sut = Rectangle(color: UIColor.white)
    }

    override func tearDownWithError() throws
    {
        sut = nil
        try super.tearDownWithError()
    }

    
    // MARK: - Testing func setUpContentWith(text:aligned:andStyledAs)
    
    func testContentIsSetCorrectly()
    {
        // given the description text
      
        // when
        sut.setUpContentWith(text: descriptionText)
      
        // then
        XCTAssertTrue(sut.contentText.text != "",
                       "Rectangle description text is not set")
        
        XCTAssertEqual(sut.contentText.text, descriptionText,
                       "Rectangle description text is wrong")
    }
    
    func testContentIsSetWithCorrectAlignment()
    {
        // given the description text
        
        let textAlignments = [NSTextAlignment.left,
                              NSTextAlignment.right,
                              NSTextAlignment.center,
                              NSTextAlignment.justified,
                              NSTextAlignment.natural]
        
        textAlignments.forEach
        {
            // when
            sut.setUpContentWith(text: descriptionText,
                                 aligned: $0)
            // then
            XCTAssertEqual(sut.contentText.textAlignment, $0,
                           "Alignment is incorrect for \($0)")
        }
    }
    
    func testContentIsSetWithCorrectStyle()
    {
        // given the description text
                
        let textStyles = [UIFont.TextStyle.body,
                          UIFont.TextStyle.callout,
                          UIFont.TextStyle.caption1,
                          UIFont.TextStyle.caption2,
                          UIFont.TextStyle.footnote,
                          UIFont.TextStyle.headline,
                          UIFont.TextStyle.largeTitle,
                          UIFont.TextStyle.subheadline,
                          UIFont.TextStyle.title1,
                          UIFont.TextStyle.title2,
                          UIFont.TextStyle.title3]
        
        textStyles.forEach
        {
            // when
            sut.setUpContentWith(text: descriptionText,
                                 aligned: .center,
                                 andStyledAs: $0)
            
            // then
            XCTAssertEqual(sut.contentText.font,
                           UIFont.preferredFont(forTextStyle: $0),
                           "Text Style is incorrect for \($0)")
        }
    }
    
    
    // MARK: - Testing func setUpAccessibilityWith(text:andHint)
    
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
        
        XCTAssertTrue(sut.contentText.isAccessibilityElement,
                      "ContentElement not accessible")
    }
    
    func testAccessibilityLabelIsSetCorrectly()
    {
        // given accessibility label text
        
        // when
        sut.setUpAccessibilityWith(identifier: accessibilityID,
                                   text: accessibilityLabelText)
        
        // then
        XCTAssertTrue(sut.contentText.accessibilityLabel != nil,
                      "Accessibility Label is not set")
        
        XCTAssertEqual(sut.contentText.accessibilityLabel, accessibilityLabelText,
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
        XCTAssertTrue(sut.contentText.accessibilityHint != nil,
                      "Accessibility Hint is not set")
        
        XCTAssertEqual(sut.contentText.accessibilityHint, accessibilityHintText,
                       "Accessibility Hint is incorrect")
        
    }
}
