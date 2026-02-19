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
public final class DiscreteTimer: @unchecked Sendable {
    
    // MARK: - nested types
    
    public enum TimeUnit: TimeInterval, Sendable {
        case second = 1
        case minute = 60
        case hour = 3_600
    }
    
    public typealias Callback = @Sendable (Date) -> ()
    
    // MARK: - properties
    
    private let timeUnit: TimeUnit
    private let dateProvider: @Sendable () -> (Date)
    private let callback: Callback

    // MARK: - init & deinit
    
    public init(timeUnit: TimeUnit,
                dateProvider: @escaping @Sendable () -> (Date) = Date.init,
                callback: @escaping @Sendable Callback) {
        self.timeUnit = timeUnit
        self.dateProvider = dateProvider
        self.callback = callback
        
        scheduleNextUpdate()
    }

    @discardableResult
    private func scheduleNextUpdate() -> (Date, Int) {

        let date = dateProvider()
        let timeInterval = date.timeIntervalSince1970
        let intervalDelay = timeUnit.rawValue - timeInterval.truncatingRemainder(dividingBy: timeUnit.rawValue)
        let currentUnit = Int(timeInterval / timeUnit.rawValue)

        DispatchQueue.main.asyncAfter(deadline: .now() + intervalDelay) { [weak self] in
            guard let self else { return }

            let (date, nextUnit) = self.scheduleNextUpdate()
            guard currentUnit != nextUnit else {
                return
            }

            let dateView: DateView
            let now = date.gregorian
            switch self.timeUnit {
            case .second:
                dateView = now.beginningOfSecond
            case .minute:
                dateView = now.beginningOfMinute
            case .hour:
                dateView = now.beginningOfHour
            }
            
            self.callback(dateView.date)
        }

        return (date, currentUnit)
    }
}
