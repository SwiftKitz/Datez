//
//  DiscreteTimerTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/30/18.
//  Copyright © 2018 kitz. All rights reserved.
//

import XCTest
import Datez

class DiscreteTimerTests: XCTestCase {
    
    func testSimpleTriggers() {
        
        let dateProvider = DateProviderMock()
        dateProvider.date = Date(timeIntervalSinceReferenceDate: 0.99)
        
        let expectedDate = Date(timeIntervalSinceReferenceDate: 1)
        
        let callbackTriggerExpectation = expectation(description: "callback is triggered")
        
        var callbackDateOp: Date?
        let callback: DiscreteTimer.Callback = { date in
            callbackDateOp = date
            callbackTriggerExpectation.fulfill()
        }
        
        let discreteTimer = DiscreteTimer(timeUnit: .second,
                                          dateProvider: dateProvider.asCallback,
                                          callback: callback)
        
        // make sure to update the mock immediately so the timer doesn't fire quickly in succession
        dateProvider.date = Date(timeIntervalSinceReferenceDate: 1.01)
        
        waitForExpectations(timeout: 0.1)
        
        guard let callbackDate = callbackDateOp else {
            return XCTFail("didn't get a date, somehow...")
        }
        
        XCTAssertEqual(callbackDate, expectedDate)
    }
}

private final class DateProviderMock {
    
    var date: Date?
    
    var asCallback: () -> (Date) {
        return {
            self.date ?? Date()
        }
    }
}
