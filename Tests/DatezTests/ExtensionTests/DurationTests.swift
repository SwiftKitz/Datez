//
//  DurationTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 12/8/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import XCTest
@testable import Datez


class DurationTests: XCTestCase {
    
    func testSecond() {
        XCTAssertEqual(1.second, CalendarComponents(second: 1))
        XCTAssertEqual(1.seconds, CalendarComponents(second: 1))
    }
    
    func testMinute() {
        XCTAssertEqual(1.minute, CalendarComponents(minute: 1))
        XCTAssertEqual(1.minutes, CalendarComponents(minute: 1))
    }
    
    func testHour() {
        XCTAssertEqual(1.hour, CalendarComponents(hour: 1))
        XCTAssertEqual(1.hours, CalendarComponents(hour: 1))
    }
    
    func testDay() {
        XCTAssertEqual(1.day, CalendarComponents(day: 1))
        XCTAssertEqual(1.days, CalendarComponents(day: 1))
    }
    
    func testWeekOfMonth() {
        XCTAssertEqual(1.weekOfMonth, CalendarComponents(weekOfMonth: 1))
        XCTAssertEqual(1.weeksOfMonth, CalendarComponents(weekOfMonth: 1))
    }
    
    func testWeekOfYear() {
        XCTAssertEqual(1.weekOfYear, CalendarComponents(weekOfYear: 1))
        XCTAssertEqual(1.weeksOfYear, CalendarComponents(weekOfYear: 1))
    }
    
    func testMonth() {
        XCTAssertEqual(1.month, CalendarComponents(month: 1))
        XCTAssertEqual(1.months, CalendarComponents(month: 1))
    }
    
    func testYear() {
        XCTAssertEqual(1.year, CalendarComponents(year: 1))
        XCTAssertEqual(1.years, CalendarComponents(year: 1))
    }

}
