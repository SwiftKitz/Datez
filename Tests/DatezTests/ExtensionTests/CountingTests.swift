//
//  CountingTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/8/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import XCTest

class CountingTests: XCTestCase {
    
    func testSecondsCounting() {
        
        XCTAssertEqual(555.totalSeconds, 555)
        XCTAssertEqual((-55).totalSeconds, -55)
        XCTAssertEqual(0.totalSeconds, 0)
    }
    
    func testMinutesCounting() {
        
        XCTAssertEqual(181.seconds.timeInterval.totalMinutes, 3)
        XCTAssertEqual(55319.seconds.timeInterval.totalMinutes, 921)
        XCTAssertEqual(59.seconds.timeInterval.totalMinutes, 0)
        XCTAssertEqual((-600).minutes.timeInterval.totalMinutes, -600)
    }
    
    func testHoursCounting() {
        
        XCTAssertEqual(61.minutes.timeInterval.totalHours, 1)
        XCTAssertEqual(55319.minutes.timeInterval.totalHours, 921)
        XCTAssertEqual(59.seconds.timeInterval.totalHours, 0)
        XCTAssertEqual((-600).hours.timeInterval.totalHours, -600)
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
    
    func testMonthsCounting() {
        // it is not predictable whether a month is 28, 29, 30, or 31 days
        // as stated in the readme, this should be used for ballpark numbers
        XCTAssertEqual(Double(2920.days.timeInterval.totalMonths), 95, accuracy: 1.0)

        XCTAssertEqual(32.days.timeInterval.totalMonths, 1)
        XCTAssertEqual(27.days.timeInterval.totalMonths, 0)
        XCTAssertEqual((-60).months.timeInterval.totalMonths, -60)
    }
    
    func testYearsCounting() {
        
        XCTAssertEqual(11.months.timeInterval.totalYears, 0)
        XCTAssertEqual(14.months.timeInterval.totalYears, 1)
        XCTAssertEqual(500.months.timeInterval.totalYears, 41)
        XCTAssertEqual((-15).years.timeInterval.totalYears, -15)
    }
}
