//
//  DurationTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 12/8/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Testing
@testable import Datez

@Suite struct DurationTests {

    @Test func second() {
        #expect(1.second == CalendarComponents(second: 1))
        #expect(1.seconds == CalendarComponents(second: 1))
    }

    @Test func minute() {
        #expect(1.minute == CalendarComponents(minute: 1))
        #expect(1.minutes == CalendarComponents(minute: 1))
    }

    @Test func hour() {
        #expect(1.hour == CalendarComponents(hour: 1))
        #expect(1.hours == CalendarComponents(hour: 1))
    }

    @Test func day() {
        #expect(1.day == CalendarComponents(day: 1))
        #expect(1.days == CalendarComponents(day: 1))
    }

    @Test func weekOfMonth() {
        #expect(1.weekOfMonth == CalendarComponents(weekOfMonth: 1))
        #expect(1.weeksOfMonth == CalendarComponents(weekOfMonth: 1))
    }

    @Test func weekOfYear() {
        #expect(1.weekOfYear == CalendarComponents(weekOfYear: 1))
        #expect(1.weeksOfYear == CalendarComponents(weekOfYear: 1))
    }

    @Test func month() {
        #expect(1.month == CalendarComponents(month: 1))
        #expect(1.months == CalendarComponents(month: 1))
    }

    @Test func year() {
        #expect(1.year == CalendarComponents(year: 1))
        #expect(1.years == CalendarComponents(year: 1))
    }
}
