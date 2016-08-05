//
//  IntMonthTests.swift
//  Datez
//
//  Created by Mariam AlJamea on 8/5/16.
//  Copyright © 2016 kitz. All rights reserved.
//

import XCTest
@testable import Datez

class IntMonthTests: XCTestCase {

    func testStrMonth2Int() {
        XCTAssertEqual(5, "May".strMonth2Int)
        XCTAssertEqual(12, "Dec".strMonth2Int)
    }
}
