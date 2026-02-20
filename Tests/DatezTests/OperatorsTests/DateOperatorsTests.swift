//
//  DateOperatorsTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 12/8/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Testing
import Foundation
import Datez

@Suite struct DateOperatorsTests {

    @Test func subtractingDates() {
        let interval = 8.weeksOfYear.timeInterval
        let date = Date(timeIntervalSinceReferenceDate: interval)

        #expect(date - Date(timeIntervalSinceReferenceDate: 0) == interval)
        #expect(Date(timeIntervalSinceReferenceDate: 0) - date == -interval)
    }
}
