//
//  DateConversionTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 12/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import XCTest
@testable import Datez


class DateConversionTests: XCTestCase {

    func testDateView() {
        
        let date = Date(timeIntervalSinceReferenceDate: 90000)
        let dateView = date.dateView(calendar: Calendar.chinese)
        
        XCTAssertEqual(dateView, DateView(forDate: date, inCalendar: Calendar.chinese))
    }
    
    func testCalendars() {
        
        let date = Date(timeIntervalSinceReferenceDate: 90000)
        
        XCTAssertEqual(date.currentCalendar, date.dateView(calendar: Calendar.current))
        XCTAssertEqual(date.gregorian, date.dateView(calendar: Calendar.gregorian))
        XCTAssertEqual(date.buddhist, date.dateView(calendar: Calendar.buddhist))
        XCTAssertEqual(date.chinese, date.dateView(calendar: Calendar.chinese))
        XCTAssertEqual(date.coptic, date.dateView(calendar: Calendar.coptic))
        XCTAssertEqual(date.ethiopicAmeteMihret, date.dateView(calendar: Calendar.ethiopicAmeteMihret))
        XCTAssertEqual(date.ethiopicAmeteAlem, date.dateView(calendar: Calendar.ethiopicAmeteAlem))
        XCTAssertEqual(date.hebrew, date.dateView(calendar: Calendar.hebrew))
        XCTAssertEqual(date.iso8601, date.dateView(calendar: Calendar.iso8601))
        XCTAssertEqual(date.indian, date.dateView(calendar: Calendar.indian))
        XCTAssertEqual(date.islamic, date.dateView(calendar: Calendar.islamic))
        XCTAssertEqual(date.islamicCivil, date.dateView(calendar: Calendar.islamicCivil))
        XCTAssertEqual(date.japanese, date.dateView(calendar: Calendar.japanese))
        XCTAssertEqual(date.persian, date.dateView(calendar: Calendar.persian))
        XCTAssertEqual(date.republicOfChina, date.dateView(calendar: Calendar.republicOfChina))
    }
}
