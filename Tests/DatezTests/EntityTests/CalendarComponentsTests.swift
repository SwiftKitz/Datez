//
//  CalendarComponentsTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 12/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import XCTest
@testable import Datez


class CalendarComponentsTests: XCTestCase {

    func testInit() {
        
        let components = CalendarComponents()
        XCTAssertEqual(components.year, 0)
        XCTAssertEqual(components.month, 0)
        XCTAssertEqual(components.weekOfYear, 0)
        XCTAssertEqual(components.weekOfMonth, 0)
        XCTAssertEqual(components.day, 0)
        XCTAssertEqual(components.hour, 0)
        XCTAssertEqual(components.minute, 0)
        XCTAssertEqual(components.second, 0)

        
        XCTAssertEqual(CalendarComponents(year: 1990).year, 1990)
        XCTAssertEqual(CalendarComponents(month: 1).month, 1)
        XCTAssertEqual(CalendarComponents(weekOfYear: 2).weekOfYear, 2)
        XCTAssertEqual(CalendarComponents(weekOfMonth: 4).weekOfMonth, 4)
        XCTAssertEqual(CalendarComponents(day: 7).day, 7)
        XCTAssertEqual(CalendarComponents(hour: 3).hour, 3)
        XCTAssertEqual(CalendarComponents(minute: 44).minute, 44)
        XCTAssertEqual(CalendarComponents(second: 42).second, 42)
    }
    
    func testUpdate() {
        
        let components = CalendarComponents().update(year: 1, month: 2, weekOfYear: 3, weekOfMonth: 4, day: 5, hour: 6, minute: 7, second: 8)
        
        XCTAssertEqual(components.year, 1)
        XCTAssertEqual(components.month, 2)
        XCTAssertEqual(components.weekOfYear, 3)
        XCTAssertEqual(components.weekOfMonth, 4)
        XCTAssertEqual(components.day, 5)
        XCTAssertEqual(components.hour, 6)
        XCTAssertEqual(components.minute, 7)
        XCTAssertEqual(components.second, 8)
    }
    
    func testUpdateInPlace() {
        
        var components = CalendarComponents()
        components.updateInPlace(year: 1, month: 2, weekOfYear: 3, weekOfMonth: 4, day: 5, hour: 6, minute: 7, second: 8)
        
        XCTAssertEqual(components.year, 1)
        XCTAssertEqual(components.month, 2)
        XCTAssertEqual(components.weekOfYear, 3)
        XCTAssertEqual(components.weekOfMonth, 4)
        XCTAssertEqual(components.day, 5)
        XCTAssertEqual(components.hour, 6)
        XCTAssertEqual(components.minute, 7)
        XCTAssertEqual(components.second, 8)
    }
}
