//
//  RelativityTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import XCTest
@testable import Datez


class RelativityTests: XCTestCase {
    
    let date = DateView(
        forCalendarComponents: CalendarComponents(
            year: 2015,
            month: 10,
            day: 31,
            hour: 23,
            minute: 44,
            second: 55
        ),
        inCalendar: Calendar.gregorian
    )
    
    func testBeginningOfYear() {
        
        let expectedDate = DateView(
            forCalendarComponents: CalendarComponents(year: 2015, month: 1, day: 1),
            inCalendar: Calendar.gregorian
        )
        
        XCTAssertEqual(date.beginningOfYear, expectedDate)
    }
    
    func testBeginningOfMonth() {
        
        let expectedDate = DateView(
            forCalendarComponents: CalendarComponents(year: 2015, month: 10, day: 1),
            inCalendar: Calendar.gregorian
        )
        
        XCTAssertEqual(date.beginningOfMonth, expectedDate)
    }
    
    func testBeginningOfDay() {
        
        let expectedDate = DateView(
            forCalendarComponents: CalendarComponents(year: 2015, month: 10, day: 31),
            inCalendar: Calendar.gregorian
        )
        
        XCTAssertEqual(date.beginningOfDay, expectedDate)
    }
    
    func  testBeginningOfHour() {
        
        let expectedDate = DateView(
            forCalendarComponents: CalendarComponents(year: 2015, month: 10, day: 31, hour: 23),
            inCalendar: Calendar.gregorian
        )
        
        XCTAssertEqual(date.beginningOfHour, expectedDate)
    }
    
    func testIsToday() {
        
        let todayDate = Date().gregorian
        XCTAssertTrue(todayDate.isToday)
        
        let differentDayDate = todayDate.update(year: 2014)
        XCTAssertFalse(differentDayDate.isToday)
    }
    
    func testIsSameDayAsDate() {
        
        let sameDayDate = DateView(
            forCalendarComponents: CalendarComponents(year: 2015, month: 10, day: 31, hour: 2),
            inCalendar: Calendar.gregorian
        )
        
        XCTAssertTrue(date.isSameDayAsDate(sameDayDate))
        
        let differentDayDate = DateView(
            forCalendarComponents: CalendarComponents(year: 2014, month: 10, day: 31, hour: 2),
            inCalendar: Calendar.gregorian
        )
        
        XCTAssertFalse(date.isSameDayAsDate(differentDayDate))
    }
}
