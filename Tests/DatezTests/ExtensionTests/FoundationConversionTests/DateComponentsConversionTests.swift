//
//  DateComponentsConversionTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 12/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Testing
import Foundation
@testable import Datez

@Suite struct DateComponentsConversionTests {

    @Test func calendarComponentsToDateComponents() {
        let calendarComponents = CalendarComponents(year: 1,
                                                    month: 2,
                                                    weekOfYear: 3,
                                                    weekOfMonth: 4,
                                                    day: 5,
                                                    hour: 6,
                                                    minute: 7,
                                                    second: 8)

        let dateComponents = calendarComponents.dateComponents
        var expectedDateComponents = DateComponents()
        expectedDateComponents.year = 1
        expectedDateComponents.month = 2
        expectedDateComponents.weekOfYear = 3
        expectedDateComponents.weekOfMonth = 4
        expectedDateComponents.day = 5
        expectedDateComponents.hour = 6
        expectedDateComponents.minute = 7
        expectedDateComponents.second = 8

        #expect(dateComponents == expectedDateComponents)
    }

    @Test func dateComponentsToCalendarComponents() {
        var dateComponents = DateComponents()
        dateComponents.year = 1
        dateComponents.month = 2
        dateComponents.weekOfYear = 3
        dateComponents.weekOfMonth = 4
        dateComponents.day = 5
        dateComponents.hour = 6
        dateComponents.minute = 7
        dateComponents.second = 8

        let expectedComponents = CalendarComponents(year: 1,
                                                    month: 2,
                                                    weekOfYear: 3,
                                                    weekOfMonth: 4,
                                                    day: 5,
                                                    hour: 6,
                                                    minute: 7,
                                                    second: 8)

        #expect(dateComponents.calendarComponents == expectedComponents)
    }

    @Test func undefinedDateComponentsConvertToZero() {
        // this works because `NSDateComponentUndefined` is too large to fit in an Int (-_-")
        var dateComponents = DateComponents()
        dateComponents.year = NSDateComponentUndefined
        dateComponents.month = NSDateComponentUndefined
        dateComponents.weekOfYear = NSDateComponentUndefined
        dateComponents.weekOfMonth = NSDateComponentUndefined
        dateComponents.day = NSDateComponentUndefined
        dateComponents.hour = NSDateComponentUndefined
        dateComponents.minute = NSDateComponentUndefined
        dateComponents.second = NSDateComponentUndefined

        #expect(dateComponents.calendarComponents == CalendarComponents())
    }
}
