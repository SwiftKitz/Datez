//
//  DebuggingTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 12/8/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Testing
import Foundation
@testable import Datez

@Suite struct DebuggingTests {

    @Test func calendarComponentsDebugDescription() {
        let components = CalendarComponents(year: 2011, month: 2, day: 5, hour: 6, minute: 7, second: 8)
        #expect("\(components)" == "2011-02-05 06:07:08")
    }

    @Test func dateViewDebugDescription() {
        let dateView = Date(timeIntervalSinceReferenceDate: 8.years.timeInterval).gregorian
        #expect("\(dateView)" == "\(dateView.components), \(dateView.calendar.identifier)")
    }
}
