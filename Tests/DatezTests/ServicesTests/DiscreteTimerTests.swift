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
    
    @MainActor func testSimpleTriggers() {
        
        let dateProvider = DateProviderMock()
        dateProvider.date = Date(timeIntervalSinceReferenceDate: 0.99)
        
        let expectedDate = Date(timeIntervalSinceReferenceDate: 1)
        
        let callbackTriggerExpectation = expectation(description: "callback is triggered")
        
        nonisolated(unsafe) var callbackDateOp: Date?
        let callback: DiscreteTimer.Callback = { date in
            XCTAssertNil(callbackDateOp, "Callback was triggered multiple times!")
            callbackDateOp = date
            callbackTriggerExpectation.fulfill()
        }
        
        let discreteTimer = DiscreteTimer(timeUnit: .second,
                                          dateProvider: dateProvider.asCallback,
                                          callback: callback)
        
        // make sure to update the mock immediately so the timer
        // can safely trigger the for the new time.
        // set it to the end of the next interval, to test that
        // it's not triggering twice as well
        dateProvider.date = Date(timeIntervalSinceReferenceDate: 1.99)
        
        waitForExpectations(timeout: 0.1)
        
        guard let callbackDate = callbackDateOp else {
            return XCTFail("didn't get a date, somehow...")
        }
        
        XCTAssertEqual(callbackDate, expectedDate)

        let refuteSecondEvent = expectation(description: "dummy")
        let result = XCTWaiter.wait(for: [refuteSecondEvent], timeout: 0.05)
        XCTAssertEqual(result, .timedOut)
        
        // hang on to this mem
        _ = discreteTimer
    }
}

private final class DateProviderMock: @unchecked Sendable {

    var date: Date?

    var asCallback: @Sendable () -> (Date) {
        return {
            self.date ?? Date()
        }
    }
}
