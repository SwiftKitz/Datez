//
//  DiscreteTimer.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/30/18.
//  Copyright © 2018 kitz. All rights reserved.
//

import Foundation

/** Encapsulates a Timer instance, and only notifies the caller of
 changes in the required unit. It also provides the callback with a
 date instance that is truncated to only contain the required unit
 and greater units. This is to allow equality checks with the
 caller's date instances in case they need to be checked against.

 e.g.
 */
@MainActor
public final class DiscreteTimer {

    // MARK: - nested types

    public enum TimeUnit: TimeInterval, Sendable {
        case second = 1
        case minute = 60
        case hour = 3_600
    }

    public typealias Callback = @Sendable (Date) -> Void

    // MARK: - properties

    private let timeUnit: TimeUnit
    private let dateProvider: @Sendable () -> Date
    private let callback: Callback
    private var timerTask: Task<Void, Never>?

    // MARK: - init & deinit

    public init(
        timeUnit: TimeUnit,
        dateProvider: @escaping @Sendable () -> Date = Date.init,
        callback: @escaping Callback
    ) {
        self.timeUnit = timeUnit
        self.dateProvider = dateProvider
        self.callback = callback
        timerTask = Task { [weak self] in
            await self?.runLoop()
        }
    }

    deinit {
        timerTask?.cancel()
    }

    // MARK: - private

    private func runLoop() async {
        var lastFiredUnit: Int? = nil

        while !Task.isCancelled {
            let date = dateProvider()
            let timeInterval = date.timeIntervalSince1970
            let unit = timeUnit.rawValue
            let delay = unit - timeInterval.truncatingRemainder(dividingBy: unit)
            let currentUnit = Int(timeInterval / unit)

            do {
                try await Task.sleep(for: .seconds(delay))
            } catch {
                return // cancelled
            }

            guard lastFiredUnit != currentUnit else { continue }
            lastFiredUnit = currentUnit

            let now = date.gregorian
            let dateView: DateView = switch timeUnit {
            case .second: now.beginningOfSecond
            case .minute: now.beginningOfMinute
            case .hour: now.beginningOfHour
            }

            callback(dateView.date)
        }
    }
}
