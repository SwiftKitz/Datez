//
//  NSDateComponents+Conversion.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Foundation

/** Convert back and forth between `NSDateComponents` and
    `DateComponents`
*/
public extension NSDateComponents {
    
    public var datez: DateComponents {
        
        return DateComponents(
            year: year == NSDateComponentUndefined ? 0 : year,
            month: month == NSDateComponentUndefined ? 0 : month,
            day: day == NSDateComponentUndefined ? 0 : day,
            hour: hour == NSDateComponentUndefined ? 0 : hour,
            minute: minute == NSDateComponentUndefined ? 0 : minute,
            second: second == NSDateComponentUndefined ? 0 : second
        )
    }
}

public extension DateComponents {
    
    public var foundation: NSDateComponents {
        
        let components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        
        return components
    }
}
