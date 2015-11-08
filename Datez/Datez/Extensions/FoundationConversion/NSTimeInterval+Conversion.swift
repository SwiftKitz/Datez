//
//  NSTimeInterval+Conversion.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 zkit. All rights reserved.
//

import Foundation


public extension NSTimeInterval {
    
    /** given 63.0, returns DateComponents(minute: 1, second: 3)
     WARNING: assumes gregorian calendar
     */
    public var components: DateComponents {
        
        let gregorian = NSCalendar.Gregorian
        let components = gregorian.components(
            NSCalendarUnit(rawValue: UInt.max),
            fromDate: NSDate(),
            toDate: NSDate(timeIntervalSinceNow: self),
            options: []
        )
        
        return components.datez
    }
}

public extension DateComponents {
    
    /** given DateComponents(minute: 1, second: 3), returns 63.0 */
    public var timeInterval: NSTimeInterval {
        
        let dateView = NSDate().gregorian + self
        return dateView.date - NSDate()
    }
}
