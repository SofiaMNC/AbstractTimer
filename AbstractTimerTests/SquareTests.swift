/**
#  SquareTests.swift
   AbstractTimer
 
 ## Overview
 Testing Square class
 
*/

import XCTest
@testable import AbstractTimer


class SquareTests: XCTestCase
{
    // MARK: - Properties
    
    var sut: Square!
    
    
    // MARK: - Set Up & Tear Down
    
    override func setUpWithError() throws
    {
        try super.setUpWithError()
        sut = Square(labelled: DynamicTypeLabel(), withColor: UIColor.white)
    }

    override func tearDownWithError() throws
    {
        sut = nil
        try super.tearDownWithError()
    }
    

    // MARK: - Testing that width = height at all times
    
    func testHeightIsAlwaysEqualToWidth()
    {
        // given our system under test
        
        // when
        sut.width = 10
        
        // then
        XCTAssertEqual(sut.height, sut.width,
                       "Height has not been modified to match change in width")
        
    }
    
    func testWidthIsAlwaysEqualToHeight()
    {
        // given our system under test
        
        // when
        sut.height = 10
        
        // then
        XCTAssertEqual(sut.width, sut.height,
                       "Width has not been modified to match change in height")
        
    }
}
