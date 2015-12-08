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
    - Absolute time: expressed as NSTimeInterval seconds
*/
public extension Int {
    
    public var second: CalendarComponents { return seconds }
    public var seconds: CalendarComponents {
        return CalendarComponents(second: self)
    }
    
    public var minute: CalendarComponents { return minutes }
    public var minutes: CalendarComponents {
        return CalendarComponents(minute: self)
    }
    
    public var hour: CalendarComponents { return hours }
    public var hours: CalendarComponents {
        return CalendarComponents(hour: self)
    }
    
    public var day: CalendarComponents { return days }
    public var days: CalendarComponents {
        return CalendarComponents(day: self)
    }
    
    public var weekOfMonth: CalendarComponents { return weeksOfMonth }
    public var weeksOfMonth: CalendarComponents {
        return CalendarComponents(weekOfMonth: self)
    }
    
    public var weekOfYear: CalendarComponents { return weeksOfYear }
    public var weeksOfYear: CalendarComponents {
        return CalendarComponents(weekOfYear: self)
    }
    
    public var month: CalendarComponents { return months }
    public var months: CalendarComponents {
        return CalendarComponents(month: self)
    }
    
    public var year: CalendarComponents { return years }
    public var years: CalendarComponents {
        return CalendarComponents(year: self)
    }
}
