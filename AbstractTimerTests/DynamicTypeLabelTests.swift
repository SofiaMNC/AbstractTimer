/**
#  DynamicTypeLabelTests.swift
   AbstractTimer
 
 ## Overview
 Testing DynamicTypeLabel class
 
*/

import XCTest
@testable import AbstractTimer


class DynamicTypeLabelTests: XCTestCase
{

    // MARK: - Properties
    
    var sut: DynamicTypeLabel!
    let descriptionText = "I'm a rectangle"
    

    // MARK: - Set Up & Tear Down
    
    override func setUpWithError() throws
    {
        try super.setUpWithError()
        
        sut = DynamicTypeLabel()
    }

    override func tearDownWithError() throws
    {
        sut = nil
        try super.tearDownWithError()
    }

    
    // MARK: - Testing convenience initializers
    
    func testDefaultContentIsSetCorrectlyWhenNoValueProvided()
    {
        // given

        // when
      
        // then
        XCTAssertTrue(sut.text != "",
                       "Rectangle description text is not set")
        
        XCTAssertEqual(sut.text, "No content provided",
                       "Rectangle description text is wrong")
    }
    
    func testContentIsCorrectlyInitialized()
    {
        // given our label
        sut = DynamicTypeLabel(withContent: descriptionText,
                               aligned: .left,
                               andStyledAs: .headline)

        // when
      
        // then
        XCTAssertTrue(sut.text != "",
                       "Rectangle description text is not set")
        
        XCTAssertEqual(sut.text, descriptionText,
                       "Rectangle description text is wrong")
        
        XCTAssertEqual(sut.textAlignment, .left,
                       "Rectangle alignment is wrong")
        
        XCTAssertEqual(sut.font,
                       UIFont.preferredFont(forTextStyle: .headline),
                       "Text Style is wrong")
    }
    
    
    // MARK: - Testing func setUpContentWith(text:aligned:andStyledAs)

    func testContentIsSetWithCorrectAlignment()
    {
        // given the description text
        
        // when

        let textAlignments = [NSTextAlignment.left,
                              NSTextAlignment.right,
                              NSTextAlignment.center,
                              NSTextAlignment.justified,
                              NSTextAlignment.natural]
        
        textAlignments.forEach
        {
            sut.setUpContentWith(text: descriptionText,
                                 aligned: $0)
            
            // then
            
            XCTAssertEqual(sut.textAlignment, $0,
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
            XCTAssertEqual(sut.font,
                           UIFont.preferredFont(forTextStyle: $0),
                           "Text Style is incorrect for \($0)")
        }
    }
}
