//
//  DateViewOperatorsTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import XCTest
@testable import Datez


class DateViewOperatorsTests: XCTestCase {

    let anyDate = DateView(
        forDateComponents: DateComponents(
            year: 2013,
            month: 4,
            day: 12,
            hour: 15,
            minute: 2
        ),
        inCalendar: NSCalendar.Gregorian
    )
    
    func testAddingComponents() {
        
        let expectedDate = anyDate.update(year: 2015, day: 19)
        XCTAssertEqual(anyDate + 2.years + 7.days, expectedDate)
    }
    
    func testSubtractingComponents() {
        
        let expectedDate = anyDate.update(month: 1, day: 19)
        XCTAssertEqual(anyDate - 2.months - 24.days, expectedDate)
    }
    
    func testAddingComponentsWithOverflow() {
        
        let expectedDate = anyDate.update(month: 5, day: 19)
        XCTAssertEqual(anyDate + 37.days, expectedDate)
    }
}
