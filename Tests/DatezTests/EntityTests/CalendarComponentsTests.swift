//
//  CalendarComponentsTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 12/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Testing
@testable import Datez

@Suite struct CalendarComponentsTests {

    @Test func defaultInit() {
        let components = CalendarComponents()
        #expect(components.year == 0)
        #expect(components.month == 0)
        #expect(components.weekOfYear == 0)
        #expect(components.weekOfMonth == 0)
        #expect(components.day == 0)
        #expect(components.hour == 0)
        #expect(components.minute == 0)
        #expect(components.second == 0)
    }

    @Test func initWithValues() {
        #expect(CalendarComponents(year: 1990).year == 1990)
        #expect(CalendarComponents(month: 1).month == 1)
        #expect(CalendarComponents(weekOfYear: 2).weekOfYear == 2)
        #expect(CalendarComponents(weekOfMonth: 4).weekOfMonth == 4)
        #expect(CalendarComponents(day: 7).day == 7)
        #expect(CalendarComponents(hour: 3).hour == 3)
        #expect(CalendarComponents(minute: 44).minute == 44)
        #expect(CalendarComponents(second: 42).second == 42)
    }

    @Test func update() {
        let components = CalendarComponents().update(year: 1, month: 2, weekOfYear: 3, weekOfMonth: 4, day: 5, hour: 6, minute: 7, second: 8)

        #expect(components.year == 1)
        #expect(components.month == 2)
        #expect(components.weekOfYear == 3)
        #expect(components.weekOfMonth == 4)
        #expect(components.day == 5)
        #expect(components.hour == 6)
        #expect(components.minute == 7)
        #expect(components.second == 8)
    }

    @Test func updateInPlace() {
        var components = CalendarComponents()
        components.updateInPlace(year: 1, month: 2, weekOfYear: 3, weekOfMonth: 4, day: 5, hour: 6, minute: 7, second: 8)

        #expect(components.year == 1)
        #expect(components.month == 2)
        #expect(components.weekOfYear == 3)
        #expect(components.weekOfMonth == 4)
        #expect(components.day == 5)
        #expect(components.hour == 6)
        #expect(components.minute == 7)
        #expect(components.second == 8)
    }
}
