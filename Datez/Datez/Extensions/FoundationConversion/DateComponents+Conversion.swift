//
//  DateComponents+Conversion.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Foundation

/** Convert back and forth between `DateComponents` and
    `CalendarComponents`
*/
public extension DateComponents {
    
    public var calendarComponents: CalendarComponents {
        
        return CalendarComponents(
            year: year,
            month: month,
            weekOfYear: weekOfYear,
            weekOfMonth: weekOfMonth,
            day: day,
            hour: hour,
            minute: minute,
            second: second
        )
    }
}

public extension CalendarComponents {
    
    public var dateComponents: DateComponents {
        
        var components = DateComponents()
        components.year = year
        components.month = month
        components.weekOfYear = weekOfYear
        components.weekOfMonth = weekOfMonth
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        
        return components
    }
}
