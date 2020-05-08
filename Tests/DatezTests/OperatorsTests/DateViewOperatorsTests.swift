//
//  DateViewOperatorsTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import XCTest
@testable import Datez


class DateViewOperatorsTests: XCTestCase {

    let anyDate = DateView(
        forCalendarComponents: CalendarComponents(
            year: 2013,
            month: 4,
            day: 12,
            hour: 15,
            minute: 2
        ),
        inCalendar: Calendar.gregorian
    )
    
    func testAddingComponents() {
        
        let expectedDate = anyDate.update(year: 2015, day: 19)
        XCTAssertEqual(anyDate + 2.years + 7.days, expectedDate)
    }
    
    func testSubtractingComponents() {
        
        let expectedDate = anyDate.update(month: 1, day: 19)
        XCTAssertEqual(anyDate - 2.months - 24.days, expectedDate)
    }
    
    func testAddingComponentsWithOverflow() {
        
        let expectedDate = anyDate.update(month: 5, day: 19)
        XCTAssertEqual(anyDate + 37.days, expectedDate)
    }
    
    func testDateViewOffsetOnDSTDay() {
        
        // DST affected time zone
        let timeZone = TimeZone(identifier: "America/Los_Angeles")!
        NSTimeZone.default = timeZone
        
        // DST switch date
        let dstSwitch = DateView(
            forCalendarComponents: CalendarComponents(year: 2015, month: 11, day: 1),
            inCalendar: Calendar(identifier: .gregorian)
        )
        
        // 1 hour will be eaten by spending 2 AM twice
        let expectedDate = DateView(
            forCalendarComponents: CalendarComponents(year: 2015, month: 11, day: 1, hour: 2),
            inCalendar: Calendar(identifier: .gregorian)
        )
        
        let dstOffset = dstSwitch + 3.hours
        XCTAssertEqual(dstOffset, expectedDate)
        
        NSTimeZone.default = TimeZone.current
    }
    
    func testDateViewOffsetCrossingDSTDay() {
        
        // DST affected time zone
        let timeZone = TimeZone(identifier: "America/Los_Angeles")!
        NSTimeZone.default = timeZone
        
        let preDst = DateView(
            forCalendarComponents: CalendarComponents(year: 2015, month: 10, day: 29),
            inCalendar: Calendar(identifier: .gregorian)
        )
        
        let postDst = DateView(
            forCalendarComponents: CalendarComponents(year: 2015, month: 11, day: 3),
            inCalendar: Calendar(identifier: .gregorian)
        )

        // DST compatibile timeZone
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar.gregorian
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        let crossDstForward = preDst + 121.hours
        XCTAssertEqual(crossDstForward, postDst)
        
        let crossDstBackwards = postDst - 121.hours
        XCTAssertEqual(crossDstBackwards, preDst)
        
        NSTimeZone.default = TimeZone.current
    }
}
