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
public final class DiscreteTimer {
    
    // MARK: - nested types
    
    public enum TimeUnit: TimeInterval {
        case second = 1
        case mintue = 60
        case hour = 3_600
    }
    
    public typealias Callback = (Date) -> ()
    
    // MARK: - properties
    
    private let timeUnit: TimeUnit
    private let dateProvider: () -> (Date)
    private let callback: Callback
    
    // MARK: - init & deinit
    
    public init(timeUnit: TimeUnit,
                dateProvider: @escaping () -> (Date) = Date.init,
                callback: @escaping Callback) {
        self.timeUnit = timeUnit
        self.dateProvider = dateProvider
        self.callback = callback
        
        scheduleNextUpdate()
    }
    
    private func scheduleNextUpdate() {
        
        let timeInterval = dateProvider().timeIntervalSince1970
        let intervalDelay = timeUnit.rawValue - timeInterval.truncatingRemainder(dividingBy: timeUnit.rawValue)
        DispatchQueue.main.asyncAfter(deadline: .now() + intervalDelay) { [weak self] in
            guard let `self` = self else { return }
            
            let date: Date
            let now = self.dateProvider().gregorian
            switch self.timeUnit {
            case .second:
                date = now.beginningOfSecond.date
            case .mintue:
                date = now.beginningOfMinute.date
            case .hour:
                date = now.beginningOfHour.date
            }
            
            self.callback(date)
            self.scheduleNextUpdate()
        }
    }
}
