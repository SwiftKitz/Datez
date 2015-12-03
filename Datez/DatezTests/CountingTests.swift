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
    
    func testWeeksOfMonthCounting() {
        
        XCTAssertEqual(12.days.timeInterval.totalWeeksOfMonth, 1)
        XCTAssertEqual(52300.days.timeInterval.totalWeeksOfMonth, 7471)
        XCTAssertEqual(6.days.timeInterval.totalWeeksOfMonth, 0)
        XCTAssertEqual((-10).weeksOfMonth.timeInterval.totalWeeksOfMonth, -10)
    }
    
    func testWeeksOfYearCounting() {
        
        XCTAssertEqual(12.days.timeInterval.totalWeeksOfYear, 1)
        XCTAssertEqual(52300.days.timeInterval.totalWeeksOfYear, 7471)
        XCTAssertEqual(6.days.timeInterval.totalWeeksOfYear, 0)
        XCTAssertEqual((-10).weeksOfYear.timeInterval.totalWeeksOfYear, -10)
    }
}
