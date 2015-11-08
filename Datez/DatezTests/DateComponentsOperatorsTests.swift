//
//  DateComponentsOperatorsTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import XCTest
@testable import Datez

class DateComponentsOperatorsTests: XCTestCase {

    let anyComponents = DateComponents(
        month: 5,
        day: -4,
        hour: 3,
        minute: 22,
        second: -10
    )

    func testMinusPrefix() {
        
        let expectedComps = DateComponents(
            month: -5,
            day: 4,
            hour: -3,
            minute: -22,
            second: 10
        )
        
        XCTAssertEqual(-anyComponents, expectedComps)
    }
    
    func testEqualityAndInequalityOperators() {
        
        let inequalComponents = [
            anyComponents.update(year: 1),
            anyComponents.update(month: -1),
            anyComponents.update(day: 12),
            anyComponents.update(hour: 1),
            anyComponents.update(minute: -13),
            anyComponents.update(second: 8),
        ]
        
        inequalComponents.forEach {
            XCTAssertNotEqual($0, anyComponents)
        }
        
        let equalComponents = anyComponents
        XCTAssertEqual(equalComponents, anyComponents)
    }
}
