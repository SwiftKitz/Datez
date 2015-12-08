//
//  NSDateOperatorsTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 12/8/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import XCTest
import Datez


class NSDateOperatorsTests: XCTestCase {
    
    func testAddingTimeInterval() {
        
        let date = NSDate()
        let interval = 5.hours.timeInterval
        
        XCTAssertEqual(date + interval, date.dateByAddingTimeInterval(interval))
    }
    
    func testSubtractingDates() {
        
        let interval = 8.weeksOfYear.timeInterval
        let date = NSDate(timeIntervalSinceReferenceDate: interval)
        
        XCTAssertEqual(date - NSDate(timeIntervalSinceReferenceDate: 0), interval)
        XCTAssertEqual(NSDate(timeIntervalSinceReferenceDate: 0) - date, -interval)
    }
    
    func testComparingDates() {
        
        let date = NSDate()
        let lesserDate = date + -5.minutes.timeInterval
        let greaterDate = date + 8.hours.timeInterval
        
        XCTAssertFalse(date < lesserDate)
        XCTAssertTrue(date < greaterDate)
        XCTAssertFalse(date < date)
    }
}
