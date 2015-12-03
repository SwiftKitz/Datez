//
//  Relativity.swift
//  Prayerz
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 ArabianDevs. All rights reserved.
//

import Foundation


/** Convenient relative date modifiers, on `DateComponents` and
    `DateView`.
*/
public extension DateComponents {
    
    public var beginningOfYear: DateComponents {
        return update(month: 1, day: 1, hour: 0, minute: 0, second: 0)
    }
    
    public var beginningOfMonth: DateComponents {
        return update(day: 1, hour: 0, minute: 0, second: 0)
    }
    
    public var beginningOfDay: DateComponents {
        return update(hour: 0, minute: 0, second: 0)
    }
    
    public var beginningOfHour: DateComponents {
        return update(minute: 0, second: 0)
    }
}


public extension DateView {
    
    public var beginningOfYear: DateView {
        return DateView(
            forDateComponents: components.beginningOfYear,
            inCalendar: calendar
        )
    }
    
    public var beginningOfMonth: DateView {
        return DateView(
            forDateComponents: components.beginningOfMonth,
            inCalendar: calendar
        )
    }
    
    public var beginningOfDay: DateView {
        return DateView(
            forDateComponents: components.beginningOfDay,
            inCalendar: calendar
        )
    }
    
    public var beginningOfHour: DateView {
        return DateView(
            forDateComponents: components.beginningOfHour,
            inCalendar: calendar
        )
    }
    
    var isToday: Bool {
        return isSameDayAsDate(NSDate().dateView(calendar: calendar))
    }
    
    func isSameDayAsDate(date: DateView) -> Bool {
        
        let argDate = date.update(hour: 0, minute: 0, second: 0)
        let selfDate = update(hour: 0, minute: 0, second: 0)
        
        return selfDate == argDate
    }
}
