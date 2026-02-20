//
//  DateConversionTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 12/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Testing
import Foundation
@testable import Datez

@Suite struct DateConversionTests {

    @Test func dateView() {
        let date = Date(timeIntervalSinceReferenceDate: 90000)
        let dateView = date.dateView(calendar: Calendar.chinese)

        #expect(dateView == DateView(forDate: date, inCalendar: Calendar.chinese))
    }

    @Test func calendars() {
        let date = Date(timeIntervalSinceReferenceDate: 90000)

        #expect(date.currentCalendar == date.dateView(calendar: Calendar.current))
        #expect(date.gregorian == date.dateView(calendar: Calendar.gregorian))
        #expect(date.buddhist == date.dateView(calendar: Calendar.buddhist))
        #expect(date.chinese == date.dateView(calendar: Calendar.chinese))
        #expect(date.coptic == date.dateView(calendar: Calendar.coptic))
        #expect(date.ethiopicAmeteMihret == date.dateView(calendar: Calendar.ethiopicAmeteMihret))
        #expect(date.ethiopicAmeteAlem == date.dateView(calendar: Calendar.ethiopicAmeteAlem))
        #expect(date.hebrew == date.dateView(calendar: Calendar.hebrew))
        #expect(date.iso8601 == date.dateView(calendar: Calendar.iso8601))
        #expect(date.indian == date.dateView(calendar: Calendar.indian))
        #expect(date.islamic == date.dateView(calendar: Calendar.islamic))
        #expect(date.islamicCivil == date.dateView(calendar: Calendar.islamicCivil))
        #expect(date.islamicTabular == date.dateView(calendar: Calendar.islamicTabular))
        #expect(date.islamicUmmAlQura == date.dateView(calendar: Calendar.islamicUmmAlQura))
        #expect(date.japanese == date.dateView(calendar: Calendar.japanese))
        #expect(date.persian == date.dateView(calendar: Calendar.persian))
        #expect(date.republicOfChina == date.dateView(calendar: Calendar.republicOfChina))
    }
}
