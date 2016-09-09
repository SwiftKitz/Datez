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
        
        XCTAssertEqual(dateView.components, components)
        XCTAssertEqual(dateView.calendar, Calendar.gregorian)
    }
    
    func testUpdate() {
        
        let components = CalendarComponents(year: 1, month: 2, day: 3, hour: 4, minute: 5, second: 6)
        let dateView = Date().gregorian.update(year: 1, month: 2, day: 3, hour: 4, minute: 5, second: 6)
        
        XCTAssertEqual(dateView.components, components)
    }
}
