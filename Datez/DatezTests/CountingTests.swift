//
//  CountingTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/8/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import XCTest

class CountingTests: XCTestCase {
    
    func testMinuteCounting() {
        
        XCTAssertEqual(181.seconds.timeInterval.totalMinutes, 3)
        XCTAssertEqual(55319.seconds.timeInterval.totalMinutes, 921)
        XCTAssertEqual(59.seconds.timeInterval.totalMinutes, 0)
        XCTAssertEqual((-600).minutes.timeInterval.totalMinutes, -600)
    }
    
    func testDaysCounting() {
        
        XCTAssertEqual(25.hours.timeInterval.totalDays, 1)
        XCTAssertEqual(52300.hours.timeInterval.totalDays, 2179)
        XCTAssertEqual(59.minutes.timeInterval.totalDays, 0)
        XCTAssertEqual((-10).days.timeInterval.totalDays, -10)
    }
}
