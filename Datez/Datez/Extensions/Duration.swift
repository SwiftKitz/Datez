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
    
    public var second: DateComponents { return seconds }
    public var seconds: DateComponents {
        return DateComponents(second: self)
    }
    
    public var minute: DateComponents { return minutes }
    public var minutes: DateComponents {
        return DateComponents(minute: self)
    }
    
    public var hour: DateComponents { return hours }
    public var hours: DateComponents {
        return DateComponents(hour: self)
    }
    
    public var day: DateComponents { return days }
    public var days: DateComponents {
        return DateComponents(day: self)
    }

    public var month: DateComponents { return months }
    public var months: DateComponents {
        return DateComponents(month: self)
    }
    
    public var year: DateComponents { return years }
    public var years: DateComponents {
        return DateComponents(year: self)
    }
}
