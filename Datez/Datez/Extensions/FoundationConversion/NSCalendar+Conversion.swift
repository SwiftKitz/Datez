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

extension NSCalendar {
    
    static var gregorian: NSCalendar            { return NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)! }
    static var buddhist: NSCalendar             { return NSCalendar(calendarIdentifier: NSCalendarIdentifierBuddhist)! }
    static var chinese: NSCalendar              { return NSCalendar(calendarIdentifier: NSCalendarIdentifierChinese)! }
    static var coptic: NSCalendar               { return NSCalendar(calendarIdentifier: NSCalendarIdentifierCoptic)! }
    static var ethiopicAmeteMihret: NSCalendar  { return NSCalendar(calendarIdentifier: NSCalendarIdentifierEthiopicAmeteMihret)! }
    static var ethiopicAmeteAlem: NSCalendar    { return NSCalendar(calendarIdentifier: NSCalendarIdentifierEthiopicAmeteAlem)! }
    static var hebrew: NSCalendar               { return NSCalendar(calendarIdentifier: NSCalendarIdentifierHebrew)! }
    static var ISO8601: NSCalendar              { return NSCalendar(calendarIdentifier: NSCalendarIdentifierISO8601)! }
    static var indian: NSCalendar               { return NSCalendar(calendarIdentifier: NSCalendarIdentifierIndian)! }
    static var islamic: NSCalendar              { return NSCalendar(calendarIdentifier: NSCalendarIdentifierIslamic)! }
    static var islamicCivil: NSCalendar         { return NSCalendar(calendarIdentifier: NSCalendarIdentifierIslamicCivil)! }
    static var japanese: NSCalendar             { return NSCalendar(calendarIdentifier: NSCalendarIdentifierJapanese)! }
    static var persian: NSCalendar              { return NSCalendar(calendarIdentifier: NSCalendarIdentifierPersian)! }
    static var republicOfChina: NSCalendar      { return NSCalendar(calendarIdentifier: NSCalendarIdentifierRepublicOfChina)! }
}
