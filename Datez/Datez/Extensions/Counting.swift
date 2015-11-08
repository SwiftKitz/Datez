//
//  Counting.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Foundation


/**
    Counting is getting the total number of a certain calendar unit in an
    NSTimeInterval instance
    WARNING: assumes gregorian calendar
*/

public extension NSTimeInterval {
    
    private func _components(unit: NSCalendarUnit) -> NSDateComponents {
        return NSCalendar.Gregorian.components(unit, fromTimeInterval: self)
    }
    
    var totalSeconds: Int {
        return Int(self)
    }
    
    var totalMinutes: Int {
        return _components(.Minute).minute
    }
    
    var totalHours: Int {
        return _components(.Hour).hour
    }
    
    var totalDays: Int {
        return _components(.Day).day
    }
    
    var totalMonths: Int {
        return _components(.Month).month
    }
    
    var totalYears: Int {
        return _components(.Year).year
    }
}
