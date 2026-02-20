//
//  CountingTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/8/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Testing
import Foundation
import Datez

@Suite struct CountingTests {

    @Test func secondsCounting() {
        #expect(555.totalSeconds == 555)
        #expect((-55).totalSeconds == -55)
        #expect(0.totalSeconds == 0)
    }

    @Test func minutesCounting() {
        #expect(181.seconds.timeInterval.totalMinutes == 3)
        #expect(55319.seconds.timeInterval.totalMinutes == 921)
        #expect(59.seconds.timeInterval.totalMinutes == 0)
        #expect((-600).minutes.timeInterval.totalMinutes == -600)
    }

    @Test func hoursCounting() {
        #expect(61.minutes.timeInterval.totalHours == 1)
        #expect(55319.minutes.timeInterval.totalHours == 921)
        #expect(59.seconds.timeInterval.totalHours == 0)
        #expect((-600).hours.timeInterval.totalHours == -600)
    }

    @Test func daysCounting() {
        #expect(25.hours.timeInterval.totalDays == 1)
        #expect(52300.hours.timeInterval.totalDays == 2179)
        #expect(59.minutes.timeInterval.totalDays == 0)
        #expect((-10).days.timeInterval.totalDays == -10)
    }

    @Test func weeksOfMonthCounting() {
        #expect(12.days.timeInterval.totalWeeksOfMonth == 1)
        #expect(52300.days.timeInterval.totalWeeksOfMonth == 7471)
        #expect(6.days.timeInterval.totalWeeksOfMonth == 0)
        #expect((-10).weeksOfMonth.timeInterval.totalWeeksOfMonth == -10)
    }

    @Test func weeksOfYearCounting() {
        #expect(12.days.timeInterval.totalWeeksOfYear == 1)
        #expect(52300.days.timeInterval.totalWeeksOfYear == 7471)
        #expect(6.days.timeInterval.totalWeeksOfYear == 0)
        #expect((-10).weeksOfYear.timeInterval.totalWeeksOfYear == -10)
    }

    @Test func monthsCounting() {
        // it is not predictable whether a month is 28, 29, 30, or 31 days
        // as stated in the readme, this should be used for ballpark numbers
        let totalMonths = Double(2920.days.timeInterval.totalMonths)
        #expect(abs(totalMonths - 95) <= 1.0)

        #expect(32.days.timeInterval.totalMonths == 1)
        #expect(27.days.timeInterval.totalMonths == 0)
        #expect((-60).months.timeInterval.totalMonths == -60)
    }

    @Test func yearsCounting() {
        #expect(11.months.timeInterval.totalYears == 0)
        #expect(14.months.timeInterval.totalYears == 1)
        #expect(500.months.timeInterval.totalYears == 41)
        #expect((-15).years.timeInterval.totalYears == -15)
    }
}
