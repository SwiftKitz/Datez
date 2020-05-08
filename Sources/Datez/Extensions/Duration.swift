//
//  Duration.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Foundation


/** This adds "Duration" support. Duration can be expressed as:
    - Calendar specific: 1.month, 3.years, ... etc.
    - Absolute time: expressed as TimeInterval seconds
*/
public extension Int {
    
    var second: CalendarComponents { return seconds }
    var seconds: CalendarComponents {
        return CalendarComponents(second: self)
    }
    
    var minute: CalendarComponents { return minutes }
    var minutes: CalendarComponents {
        return CalendarComponents(minute: self)
    }
    
    var hour: CalendarComponents { return hours }
    var hours: CalendarComponents {
        return CalendarComponents(hour: self)
    }
    
    var day: CalendarComponents { return days }
    var days: CalendarComponents {
        return CalendarComponents(day: self)
    }
    
    var weekOfMonth: CalendarComponents { return weeksOfMonth }
    var weeksOfMonth: CalendarComponents {
        return CalendarComponents(weekOfMonth: self)
    }
    
    var weekOfYear: CalendarComponents { return weeksOfYear }
    var weeksOfYear: CalendarComponents {
        return CalendarComponents(weekOfYear: self)
    }
    
    var month: CalendarComponents { return months }
    var months: CalendarComponents {
        return CalendarComponents(month: self)
    }
    
    var year: CalendarComponents { return years }
    var years: CalendarComponents {
        return CalendarComponents(year: self)
    }
}
