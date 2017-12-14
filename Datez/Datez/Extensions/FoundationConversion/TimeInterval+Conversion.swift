//
//  TimeInterval+Conversion.swift
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
    + estimating the number of hours, or minutes in TimeInterval
*/
public extension TimeInterval {
    
    /** given 63.0, returns CalendarComponents(minute: 1, second: 3)
     WARNING: assumes gregorian calendar
     */
    public var components: CalendarComponents {
        
        return Calendar.gregorian.components(
            Calendar.Component.all,
            fromTimeInterval: self
        ).calendarComponents
    }
}

public extension CalendarComponents {
    
    /** given CalendarComponents(minute: 1, second: 3), returns 63.0 */
    public var timeInterval: TimeInterval {
        
        let baseDate = Date(timeIntervalSinceReferenceDate: 0)
        let dateView = baseDate.gregorian + self
        return dateView.date - baseDate
    }
}
