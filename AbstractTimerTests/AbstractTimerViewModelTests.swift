/**
#  AbstractTimerViewModelTests.swift
   AbstractTimer
 
 ## Overview
 Testing AbstractTimerViewModel
 
*/

import XCTest
@testable import AbstractTimer


class AbstractTimerViewModelTests: XCTestCase
{
    // MARK: - Properties
    
    var sut: AbstractTimerViewModel!
    
    
    // MARK: - Set Up & Tear Down
    
    override func setUpWithError() throws
    {
        try super.setUpWithError()
        
        sut = AbstractTimerViewModel()
    }

    override func tearDownWithError() throws
    {
        sut = nil
        
        try super.tearDownWithError()
    }

    
    // MARK: - Testing Timer
    
    func testStartTimer()
    {
        let expectation = self.expectation(description: "Timer started")
        
        sut.timerLabel.bind
        {
            if $0.compare("00:00:04.190") == .orderedSame
            {
                expectation.fulfill()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now())
        {
            self.sut.startTimer()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
}
