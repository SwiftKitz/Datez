//
//  NSCalendar+Conversion.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Foundation


extension NSCalendar {
    
    func components(units: NSCalendarUnit, fromTimeInterval timeInterval: NSTimeInterval) -> NSDateComponents {
        
        let baseDate = NSDate(timeIntervalSinceReferenceDate: 0)
        return components(
            units,
            fromDate: baseDate,
            toDate: baseDate + round(timeInterval),
            options: []
        )
    }
}

public extension NSCalendar {
    
    static var Gregorian: NSCalendar {
        return NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
    }
    
    static var IslamicCivil: NSCalendar {
        return NSCalendar(calendarIdentifier: NSCalendarIdentifierIslamicCivil)!
    }
}
