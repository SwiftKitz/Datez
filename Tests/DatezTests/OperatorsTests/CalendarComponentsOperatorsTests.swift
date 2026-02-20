//
//  CalendarComponentsOperatorsTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Testing
@testable import Datez

@Suite struct CalendarComponentsOperatorsTests {

    let anyComponents = CalendarComponents(
        month: 5,
        day: -4,
        hour: 3,
        minute: 22,
        second: -10
    )

    @Test func minusPrefix() {
        let expectedComps = CalendarComponents(
            month: -5,
            day: 4,
            hour: -3,
            minute: -22,
            second: 10
        )
        #expect(-anyComponents == expectedComps)
    }

    @Test func equalityAndInequalityOperators() {
        let inequalComponents = [
            anyComponents.update(year: 1),
            anyComponents.update(month: -1),
            anyComponents.update(day: 12),
            anyComponents.update(hour: 1),
            anyComponents.update(minute: -13),
            anyComponents.update(second: 8),
        ]

        for comp in inequalComponents {
            #expect(comp != anyComponents)
        }

        let equalComponents = anyComponents
        #expect(equalComponents == anyComponents)
    }
}
