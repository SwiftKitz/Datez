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

    @Test func postBoundaryTickCarriesPostSleepDate() async throws {
        let dateProvider = DateProviderMock()
        // 0.50s into second 10; the swap target shares the sub-second offset
        // so the delay (~0.50s) is identical whichever value is read first.
        let preSleep = Date(timeIntervalSinceReferenceDate: 10.50)
        let postSleep = Date(timeIntervalSinceReferenceDate: 12.50)
        dateProvider.date = preSleep

        nonisolated(unsafe) var receivedDate: Date?

        try await confirmation("boundary tick fires") { confirm in
            let timer = DiscreteTimer(
                timeUnit: .second,
                dateProvider: dateProvider.asCallback
            ) { date in
                receivedDate = date
                confirm()
            }

            dateProvider.date = postSleep
            try await Task.sleep(for: .milliseconds(900))
            _ = timer
        }

        // The fix re-reads AFTER waking, so the tick carries second 12,
        // not the stale pre-sleep second 10 the old code delivered.
        #expect(receivedDate == postSleep.gregorian.beginningOfSecond.date)
        #expect(receivedDate != preSleep.gregorian.beginningOfSecond.date)
    }

    @Test func doesNotPublishSameUnitTwice() async throws {
        let dateProvider = DateProviderMock()
        dateProvider.date = Date(timeIntervalSinceReferenceDate: 20.50)

        nonisolated(unsafe) var dates: [Date] = []

        let timer = DiscreteTimer(
            timeUnit: .second,
            dateProvider: dateProvider.asCallback
        ) { date in
            dates.append(date)
        }

        // Advance only within second 20 across several wake cycles; each wake
        // recomputes a sub-second delay and must dedupe on unit 20.
        dateProvider.date = Date(timeIntervalSinceReferenceDate: 20.70)
        try await Task.sleep(for: .milliseconds(300))
        dateProvider.date = Date(timeIntervalSinceReferenceDate: 20.90)
        try await Task.sleep(for: .milliseconds(300))
        _ = timer

        #expect(dates == [Date(timeIntervalSinceReferenceDate: 20).gregorian.beginningOfSecond.date])
    }

    @Test func resumeDoesNotPublishOlderUnit() async throws {
        let dateProvider = DateProviderMock()
        dateProvider.date = Date(timeIntervalSinceReferenceDate: 100.50)

        nonisolated(unsafe) var dates: [Date] = []

        let timer = DiscreteTimer(
            timeUnit: .second,
            dateProvider: dateProvider.asCallback
        ) { date in
            dates.append(date)
        }

        // First tick publishes second 100.
        try await Task.sleep(for: .milliseconds(700))

        // Rewound/stale clock (e.g. a loop that woke from a long suspend
        // holding an old instant): second 40 must NOT be published.
        dateProvider.date = Date(timeIntervalSinceReferenceDate: 40.50)
        try await Task.sleep(for: .milliseconds(700))

        // Clock advances normally again: publishes second 101, never 40.
        dateProvider.date = Date(timeIntervalSinceReferenceDate: 101.50)
        try await Task.sleep(for: .milliseconds(700))
        _ = timer

        let second100 = Date(timeIntervalSinceReferenceDate: 100).gregorian.beginningOfSecond.date
        let second101 = Date(timeIntervalSinceReferenceDate: 101).gregorian.beginningOfSecond.date
        let second40 = Date(timeIntervalSinceReferenceDate: 40).gregorian.beginningOfSecond.date

        #expect(dates == [second100, second101])
        #expect(!dates.contains(second40))
        #expect(dates == dates.sorted())
    }
}

private final class DateProviderMock: @unchecked Sendable {

    var date: Date?

    var asCallback: @Sendable () -> Date {
        { self.date ?? Date() }
    }
}
