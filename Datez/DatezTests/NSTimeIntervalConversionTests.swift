//
//  NSTimeIntervalConversionTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import XCTest
@testable import Datez

class NSTimeIntervalConversionTests: XCTestCase {

    // Must be exact to the second
    let highAccuracy = 0.1
    
    // ± few hours
    let lowAccuracy = 3.hours.timeInterval
    
    // Can be a few days off ±3 days
    // Used for cache expiration, for example
    let ballparkAccuracy = 3.days.timeInterval
    
    
    func testTimeIntervalFromDateComponents() {
        
        XCTAssertEqualWithAccuracy(11.minute.timeInterval, 11 * 60.seconds.timeInterval, accuracy: highAccuracy)
        XCTAssertEqualWithAccuracy(20.hours.timeInterval, 20 * 60.minutes.timeInterval, accuracy: highAccuracy)
        XCTAssertEqualWithAccuracy(12.days.timeInterval, 12 * 24.hours.timeInterval, accuracy: lowAccuracy)
        XCTAssertEqualWithAccuracy(3.months.timeInterval, 3 * 31.days.timeInterval, accuracy: ballparkAccuracy)
    }
    
    func testDateComponentsFromTimeInterval() {
        
        XCTAssertEqual(11.minute.timeInterval.components, DateComponents(minute: 11))
        XCTAssertEqual(20.hours.timeInterval.components, DateComponents(hour: 20))
    }
}
