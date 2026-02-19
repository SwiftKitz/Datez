//
//  DateViewTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 12/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import XCTest
@testable import Datez


class DateViewTests: XCTestCase {
    
    func testInitForDateInCalendar() {

        let date = Date(timeIntervalSinceReferenceDate: 180)
        let dateView = DateView(forDate: date, inCalendar: Calendar.gregorian)
        
        XCTAssertEqual(dateView.date, date)
        XCTAssertEqual(dateView.calendar, Calendar.gregorian)
    }
    
    func testInitForCalendarComponentsInCalendar() {

        let components = CalendarComponents(year: 1990, month: 1, day: 7, hour: 3, minute: 44, second: 42)
        let dateView = DateView(forCalendarComponents: components, inCalendar: Calendar.gregorian)
        let result = dateView.components

        XCTAssertEqual(result.year, components.year)
        XCTAssertEqual(result.month, components.month)
        XCTAssertEqual(result.day, components.day)
        XCTAssertEqual(result.hour, components.hour)
        XCTAssertEqual(result.minute, components.minute)
        XCTAssertEqual(result.second, components.second)
        XCTAssertEqual(dateView.calendar, Calendar.gregorian)
    }
    
    func testUpdate() {

        let dateView = Date().gregorian.update(year: 1, month: 2, day: 3, hour: 4, minute: 5, second: 6)
        let result = dateView.components

        XCTAssertEqual(result.year, 1)
        XCTAssertEqual(result.month, 2)
        XCTAssertEqual(result.day, 3)
        XCTAssertEqual(result.hour, 4)
        XCTAssertEqual(result.minute, 5)
        XCTAssertEqual(result.second, 6)
    }
}
