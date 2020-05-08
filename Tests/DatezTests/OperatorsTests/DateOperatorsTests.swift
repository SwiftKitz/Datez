//
//  DateOperatorsTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 12/8/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import XCTest
import Datez


class DateOperatorsTests: XCTestCase {
    
    func testSubtractingDates() {
                
        let interval = 8.weeksOfYear.timeInterval
        let date = Date(timeIntervalSinceReferenceDate: interval)
        
        XCTAssertEqual(date - Date(timeIntervalSinceReferenceDate: 0), interval)
        XCTAssertEqual(Date(timeIntervalSinceReferenceDate: 0) - date, -interval)
    }
}
