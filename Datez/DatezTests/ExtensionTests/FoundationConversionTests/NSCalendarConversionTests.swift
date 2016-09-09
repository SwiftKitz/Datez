//
//  NSCalendarConversionTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 12/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import XCTest
@testable import Datez


class NSCalendarConversionTests: XCTestCase {
    
    func testComponentsFromTimeInterval() {
        
        let timeInterval = 8.days.timeInterval + 9.months.timeInterval
        
        let calendar = NSCalendar.gregorian
        let baseDate = Date(timeIntervalSinceReferenceDate: 0)
        
        let components = (calendar as NSCalendar).components(
            [.month, .day],
            from: baseDate,
            to: baseDate + timeInterval,
            options: []
        )
        
        XCTAssertEqual(components.day, 8)
        XCTAssertEqual(components.month, 9)
    }
}
