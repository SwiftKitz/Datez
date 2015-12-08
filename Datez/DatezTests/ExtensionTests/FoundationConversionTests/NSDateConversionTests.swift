//
//  NSDateConversionTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 12/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import XCTest
@testable import Datez


class NSDateConversionTests: XCTestCase {

    func testDateView() {
        
        let date = NSDate(timeIntervalSinceReferenceDate: 90000)
        let dateView = date.dateView(calendar: NSCalendar.chinese)
        
        XCTAssertEqual(dateView, DateView(forDate: date, inCalendar: NSCalendar.chinese))
    }
    
    func testCalendars() {
        
        let date = NSDate(timeIntervalSinceReferenceDate: 90000)
        
        XCTAssertEqual(date.currentCalendar, date.dateView(calendar: NSCalendar.currentCalendar()))
        XCTAssertEqual(date.gregorian, date.dateView(calendar: NSCalendar.gregorian))
        XCTAssertEqual(date.buddhist, date.dateView(calendar: NSCalendar.buddhist))
        XCTAssertEqual(date.chinese, date.dateView(calendar: NSCalendar.chinese))
        XCTAssertEqual(date.coptic, date.dateView(calendar: NSCalendar.coptic))
        XCTAssertEqual(date.ethiopicAmeteMihret, date.dateView(calendar: NSCalendar.ethiopicAmeteMihret))
        XCTAssertEqual(date.ethiopicAmeteAlem, date.dateView(calendar: NSCalendar.ethiopicAmeteAlem))
        XCTAssertEqual(date.hebrew, date.dateView(calendar: NSCalendar.hebrew))
        XCTAssertEqual(date.ISO8601, date.dateView(calendar: NSCalendar.ISO8601))
        XCTAssertEqual(date.indian, date.dateView(calendar: NSCalendar.indian))
        XCTAssertEqual(date.islamic, date.dateView(calendar: NSCalendar.islamic))
        XCTAssertEqual(date.islamicCivil, date.dateView(calendar: NSCalendar.islamicCivil))
        XCTAssertEqual(date.japanese, date.dateView(calendar: NSCalendar.japanese))
        XCTAssertEqual(date.persian, date.dateView(calendar: NSCalendar.persian))
        XCTAssertEqual(date.republicOfChina, date.dateView(calendar: NSCalendar.republicOfChina))
    }
}
