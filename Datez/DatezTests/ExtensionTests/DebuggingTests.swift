//
//  DebuggingTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 12/8/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import XCTest
@testable import Datez


class DebuggingTests: XCTestCase {
    
    func testCalendarComponentsDebugDescription() {
        
        let components = CalendarComponents(year: 2011, month: 2, day: 5, hour: 6, minute: 7, second: 8)
        XCTAssertEqual("\(components)", "2011-02-05 06:07:08")
    }
    
    func testDateViewDebugDescription() {
        
        let dateView = NSDate(timeIntervalSinceReferenceDate: 8.years.timeInterval).gregorian
        XCTAssertEqual("\(dateView)", "\(dateView.components), \(dateView.calendar.calendarIdentifier)")
    }
}
