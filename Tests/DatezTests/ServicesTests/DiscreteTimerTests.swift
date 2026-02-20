//
//  DiscreteTimerTests.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/30/18.
//  Copyright © 2018 kitz. All rights reserved.
//

import Testing
import Foundation
import Datez

@Suite struct DiscreteTimerTests {

    @Test func simpleTriggers() async throws {
        let dateProvider = DateProviderMock()
        dateProvider.date = Date(timeIntervalSinceReferenceDate: 0.99)

        let expectedDate = Date(timeIntervalSinceReferenceDate: 1)
        nonisolated(unsafe) var callbackCount = 0
        nonisolated(unsafe) var receivedDate: Date?

        try await confirmation("callback triggered") { confirm in
            let timer = DiscreteTimer(
                timeUnit: .second,
                dateProvider: dateProvider.asCallback
            ) { date in
                callbackCount += 1
                receivedDate = date
                confirm()
            }

            dateProvider.date = Date(timeIntervalSinceReferenceDate: 1.99)
            try await Task.sleep(for: .milliseconds(200))
            _ = timer
        }

        #expect(receivedDate == expectedDate)
        #expect(callbackCount == 1)
    }

    @Test func minuteUnit() async throws {
        let dateProvider = DateProviderMock()
        // Both dates are ~0.01s before the minute boundary so the delay
        // is short regardless of which one the async Task reads first
        dateProvider.date = Date(timeIntervalSince1970: 59.99)

        nonisolated(unsafe) var receivedDate: Date?

        try await confirmation("minute boundary fires") { confirm in
            let timer = DiscreteTimer(
                timeUnit: .minute,
                dateProvider: dateProvider.asCallback
            ) { date in
                receivedDate = date
                confirm()
            }

            dateProvider.date = Date(timeIntervalSince1970: 59.995)
            try await Task.sleep(for: .milliseconds(200))
            _ = timer
        }

        let expected = Date(timeIntervalSince1970: 59.99).gregorian.beginningOfMinute.date
        #expect(receivedDate == expected)
    }

    @Test func callbackDeliversTruncatedDate() async throws {
        let dateProvider = DateProviderMock()
        dateProvider.date = Date(timeIntervalSinceReferenceDate: 0.99)

        nonisolated(unsafe) var receivedDate: Date?

        try await confirmation("callback triggered") { confirm in
            let timer = DiscreteTimer(
                timeUnit: .second,
                dateProvider: dateProvider.asCallback
            ) { date in
                receivedDate = date
                confirm()
            }

            dateProvider.date = Date(timeIntervalSinceReferenceDate: 0.995)
            try await Task.sleep(for: .milliseconds(200))
            _ = timer
        }

        let date = try #require(receivedDate)
        let subsecond = date.timeIntervalSince1970.truncatingRemainder(dividingBy: 1)
        #expect(abs(subsecond) < 0.001)
    }

    @Test func deallocCancelsTimer() async throws {
        let dateProvider = DateProviderMock()
        // 0.5s delay means timer won't fire before we nil it
        dateProvider.date = Date(timeIntervalSince1970: 0.5)

        nonisolated(unsafe) var callbackCount = 0

        var timer: DiscreteTimer? = DiscreteTimer(
            timeUnit: .second,
            dateProvider: dateProvider.asCallback
        ) { _ in
            callbackCount += 1
        }
        timer = nil

        try await Task.sleep(for: .milliseconds(150))
        #expect(callbackCount == 0)
        _ = timer
    }

    @Test func multipleTicksFireSequentially() async throws {
        let dateProvider = DateProviderMock()
        dateProvider.date = Date(timeIntervalSinceReferenceDate: 0.99)

        nonisolated(unsafe) var dates: [Date] = []

        try await confirmation("two ticks fire", expectedCount: 2) { confirm in
            let timer = DiscreteTimer(
                timeUnit: .second,
                dateProvider: dateProvider.asCallback
            ) { date in
                dates.append(date)
                confirm()
            }

            // Near same boundary — first tick fires quickly
            dateProvider.date = Date(timeIntervalSinceReferenceDate: 0.995)
            try await Task.sleep(for: .milliseconds(100))

            // Advance to next second boundary for second tick
            dateProvider.date = Date(timeIntervalSinceReferenceDate: 1.99)
            try await Task.sleep(for: .milliseconds(100))

            _ = timer
        }

        try #require(dates.count == 2)
        #expect(dates[0] != dates[1])
    }
}

private final class DateProviderMock: @unchecked Sendable {

    var date: Date?

    var asCallback: @Sendable () -> Date {
        { self.date ?? Date() }
    }
}
