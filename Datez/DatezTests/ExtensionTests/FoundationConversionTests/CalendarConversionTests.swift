//
//  CalendarConversionTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 12/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import XCTest
@testable import Datez


class CalendarConversionTests: XCTestCase {
    
    func testComponentsFromTimeInterval() {
        
        let timeInterval = 8.days.timeInterval + 9.months.timeInterval
        
        let calendar = Calendar.gregorian
        let baseDate = Date(timeIntervalSinceReferenceDate: 0)
        
        let components = calendar.dateComponents(
            [.month, .day],
            from: baseDate,
            to: baseDate + timeInterval
        )
        
        XCTAssertEqual(components.day, 8)
        XCTAssertEqual(components.month, 9)
    }
}
