//
//  Counting.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Foundation


/** Counting is getting the total number of a certain calendar unit in an
    NSTimeInterval instance:
 
    NSTimeInterval(234253).totalYears
 
    WARNING: assumes gregorian calendar
*/
public extension TimeInterval {
    
    fileprivate func _components(_ unit: Calendar.Component) -> DateComponents {
        return Calendar.gregorian.components([unit], fromTimeInterval: self)
    }
    
    var totalSeconds: Int {
        return Int(self)
    }
    
    var totalMinutes: Int {
        return _components(.minute).minute ?? 0
    }
    
    var totalHours: Int {
        return _components(.hour).hour ?? 0
    }
    
    var totalDays: Int {
        return _components(.day).day ?? 0
    }

    var totalWeeksOfMonth: Int {
        return _components(.weekOfMonth).weekOfMonth ?? 0
    }
    
    var totalWeeksOfYear: Int {
        return _components(.weekOfYear).weekOfYear ?? 0
    }
    
    var totalMonths: Int {
        return _components(.month).month ?? 0
    }
    
    var totalYears: Int {
        return _components(.year).year ?? 0
    }
}
