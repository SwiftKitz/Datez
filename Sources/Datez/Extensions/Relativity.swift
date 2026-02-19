//
//  Relativity.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 ArabianDevs. All rights reserved.
//

import Foundation


/** Convenient relative date modifiers, on `CalendarComponents` and
    `DateView`.
*/
public extension CalendarComponents {
    
    var beginningOfYear: CalendarComponents {
        return update(month: 1, day: 1, hour: 0, minute: 0, second: 0)
    }
    
    var beginningOfMonth: CalendarComponents {
        return update(day: 1, hour: 0, minute: 0, second: 0)
    }
    
    var beginningOfDay: CalendarComponents {
        return update(hour: 0, minute: 0, second: 0)
    }
    
    var beginningOfHour: CalendarComponents {
        return update(minute: 0, second: 0)
    }

    var beginningOfMinute: CalendarComponents {
        return update(second: 0)
    }
}


public extension DateView {
    
    var beginningOfYear: DateView {
        return DateView(
            forCalendarComponents: components.beginningOfYear,
            inCalendar: calendar
        )
    }
    
    var beginningOfMonth: DateView {
        return DateView(
            forCalendarComponents: components.beginningOfMonth,
            inCalendar: calendar
        )
    }
    
    var beginningOfDay: DateView {
        return DateView(
            forCalendarComponents: components.beginningOfDay,
            inCalendar: calendar
        )
    }
    
    var beginningOfHour: DateView {
        return DateView(
            forCalendarComponents: components.beginningOfHour,
            inCalendar: calendar
        )
    }

    var beginningOfMinute: DateView {
        return DateView(
            forCalendarComponents: components.beginningOfMinute,
            inCalendar: calendar
        )
    }

    var beginningOfSecond: DateView {
        return DateView(
            forCalendarComponents: components,
            inCalendar: calendar
        )
    }

    var isToday: Bool {
        return isSameDayAsDate(Date().dateView(calendar: calendar))
    }
    
    func isSameDayAsDate(_ date: DateView) -> Bool {
        
        let argDate = date.update(hour: 0, minute: 0, second: 0)
        let selfDate = update(hour: 0, minute: 0, second: 0)
        
        return selfDate == argDate
    }
}
