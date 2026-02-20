//
//  DateViewTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 12/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Testing
import Foundation
@testable import Datez

@Suite struct DateViewTests {

    @Test func initForDateInCalendar() {
        let date = Date(timeIntervalSinceReferenceDate: 180)
        let dateView = DateView(forDate: date, inCalendar: Calendar.gregorian)

        #expect(dateView.date == date)
        #expect(dateView.calendar == Calendar.gregorian)
    }

    @Test func initForCalendarComponentsInCalendar() {
        let components = CalendarComponents(year: 1990, month: 1, day: 7, hour: 3, minute: 44, second: 42)
        let dateView = DateView(forCalendarComponents: components, inCalendar: Calendar.gregorian)
        let result = dateView.components

        #expect(result.year == components.year)
        #expect(result.month == components.month)
        #expect(result.day == components.day)
        #expect(result.hour == components.hour)
        #expect(result.minute == components.minute)
        #expect(result.second == components.second)
        #expect(dateView.calendar == Calendar.gregorian)
    }

    @Test func update() {
        let dateView = Date().gregorian.update(year: 1, month: 2, day: 3, hour: 4, minute: 5, second: 6)
        let result = dateView.components

        #expect(result.year == 1)
        #expect(result.month == 2)
        #expect(result.day == 3)
        #expect(result.hour == 4)
        #expect(result.minute == 5)
        #expect(result.second == 6)
    }
}
