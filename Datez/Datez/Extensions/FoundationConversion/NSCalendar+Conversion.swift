//
//  NSCalendar+Conversion.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 zkit. All rights reserved.
//

import Foundation


public extension NSCalendar {
    
    static var Gregorian: NSCalendar {
        return NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
    }
    
    static var IslamicCivil: NSCalendar {
        return NSCalendar(calendarIdentifier: NSCalendarIdentifierIslamicCivil)!
    }
}
