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
        forDateComponents: DateComponents(
            year: 2015,
            month: 10,
            day: 31,
            hour: 23,
            minute: 44,
            second: 55
        ),
        inCalendar: NSCalendar.gregorian
    )
    
    func testBeginningOfYear() {
        
        let expectedDate = DateView(
            forDateComponents: DateComponents(year: 2015, month: 1, day: 1),
            inCalendar: NSCalendar.gregorian
        )
        
        XCTAssertEqual(date.beginningOfYear, expectedDate)
    }
    
    func testBeginningOfMonth() {
        
        let expectedDate = DateView(
            forDateComponents: DateComponents(year: 2015, month: 10, day: 1),
            inCalendar: NSCalendar.gregorian
        )
        
        XCTAssertEqual(date.beginningOfMonth, expectedDate)
    }
    
    func testBeginningOfDay() {
        
        let expectedDate = DateView(
            forDateComponents: DateComponents(year: 2015, month: 10, day: 31),
            inCalendar: NSCalendar.gregorian
        )
        
        XCTAssertEqual(date.beginningOfDay, expectedDate)
    }
    
    func  testBeginningOfHour() {
        
        let expectedDate = DateView(
            forDateComponents: DateComponents(year: 2015, month: 10, day: 31, hour: 23),
            inCalendar: NSCalendar.gregorian
        )
        
        XCTAssertEqual(date.beginningOfHour, expectedDate)
    }
    
    func testIsToday() {
        
        let todayDate = NSDate().gregorian
        XCTAssertTrue(todayDate.isToday)
        
        let differentDayDate = todayDate.update(year: 2014)
        XCTAssertFalse(differentDayDate.isToday)
    }
    
    func testIsSameDayAsDate() {
        
        let sameDayDate = DateView(
            forDateComponents: DateComponents(year: 2015, month: 10, day: 31, hour: 2),
            inCalendar: NSCalendar.gregorian
        )
        
        XCTAssertTrue(date.isSameDayAsDate(sameDayDate))
        
        let differentDayDate = DateView(
            forDateComponents: DateComponents(year: 2014, month: 10, day: 31, hour: 2),
            inCalendar: NSCalendar.gregorian
        )
        
        XCTAssertFalse(date.isSameDayAsDate(differentDayDate))
    }
}
