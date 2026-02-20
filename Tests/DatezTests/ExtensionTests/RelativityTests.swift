//
//  RelativityTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Testing
import Foundation
@testable import Datez

@Suite struct RelativityTests {

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

    @Test func beginningOfYear() {
        let expectedDate = DateView(
            forCalendarComponents: CalendarComponents(year: 2015, month: 1, day: 1),
            inCalendar: Calendar.gregorian
        )
        #expect(date.beginningOfYear == expectedDate)
    }

    @Test func beginningOfMonth() {
        let expectedDate = DateView(
            forCalendarComponents: CalendarComponents(year: 2015, month: 10, day: 1),
            inCalendar: Calendar.gregorian
        )
        #expect(date.beginningOfMonth == expectedDate)
    }

    @Test func beginningOfDay() {
        let expectedDate = DateView(
            forCalendarComponents: CalendarComponents(year: 2015, month: 10, day: 31),
            inCalendar: Calendar.gregorian
        )
        #expect(date.beginningOfDay == expectedDate)
    }

    @Test func beginningOfHour() {
        let expectedDate = DateView(
            forCalendarComponents: CalendarComponents(year: 2015, month: 10, day: 31, hour: 23),
            inCalendar: Calendar.gregorian
        )
        #expect(date.beginningOfHour == expectedDate)
    }

    @Test func isToday() {
        let todayDate = Date().gregorian
        #expect(todayDate.isToday)

        let differentDayDate = todayDate.update(year: 2014)
        #expect(!differentDayDate.isToday)
    }

    @Test func isSameDayAsDate() {
        let sameDayDate = DateView(
            forCalendarComponents: CalendarComponents(year: 2015, month: 10, day: 31, hour: 2),
            inCalendar: Calendar.gregorian
        )
        #expect(date.isSameDayAsDate(sameDayDate))

        let differentDayDate = DateView(
            forCalendarComponents: CalendarComponents(year: 2014, month: 10, day: 31, hour: 2),
            inCalendar: Calendar.gregorian
        )
        #expect(!date.isSameDayAsDate(differentDayDate))
    }
}
