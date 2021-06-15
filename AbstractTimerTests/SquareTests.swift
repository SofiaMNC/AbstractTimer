//
//  SquareTests.swift
//  AbstractTimerTests
//
//  Created by Sofia Chevrolat on 14/06/2021.
//

import XCTest
@testable import AbstractTimer


class SquareTests: XCTestCase
{
    var sut: Square!
    
    override func setUpWithError() throws
    {
        try super.setUpWithError()
        sut = Square(color: UIColor.white)
    }

    override func tearDownWithError() throws
    {
        sut = nil
        try super.tearDownWithError()
    }

    // MARK: - Testing that width = height at all time
    
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
