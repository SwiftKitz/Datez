//
//  CalendarConversionTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 12/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Testing
import Foundation
@testable import Datez

@Suite struct CalendarConversionTests {

    @Test func componentsFromTimeInterval() {
        let timeInterval = 8.days.timeInterval + 9.months.timeInterval

        let calendar = Calendar.gregorian
        let baseDate = Date(timeIntervalSinceReferenceDate: 0)

        let components = calendar.dateComponents(
            [.month, .day],
            from: baseDate,
            to: baseDate + timeInterval
        )

        #expect(components.day == 8)
        #expect(components.month == 9)
    }
}
