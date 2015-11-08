//
//  NSTimeInterval+Conversion.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Foundation


/** [BONUS]: This is a bonus API for ballpark calculations, useful for
    making hardcoded intervals more readable.
    
    e.g.
    + declaring a cache expiration interval
    + estimating the number of hours, or minutes in NSTimeInterval
*/
public extension NSTimeInterval {
    
    /** given 63.0, returns DateComponents(minute: 1, second: 3)
     WARNING: assumes gregorian calendar
     */
    public var components: DateComponents {
        
        let gregorian = NSCalendar.Gregorian
        let components = gregorian.components(
            NSCalendarUnit(rawValue: UInt.max),
            fromDate: NSDate(),
            toDate: NSDate(timeIntervalSinceNow: round(self)),
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
