//
//  NSDateConversion.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Foundation


/** `DateView` access from `NSDate` */
public extension NSDate {
    
    public func dateView(calendar calendar: NSCalendar) -> DateView {
        
        return DateView(
            forDate: self,
            inCalendar: calendar
        )
    }
    
    public var currentCalendar: DateView {
        return dateView(calendar: NSCalendar.currentCalendar())
    }
    
    public var gregorian: DateView              { return dateView(calendar: NSCalendar.gregorian) }
    public var buddhist: DateView               { return dateView(calendar: NSCalendar.buddhist) }
    public var chinese: DateView                { return dateView(calendar: NSCalendar.chinese) }
    public var coptic: DateView                 { return dateView(calendar: NSCalendar.coptic) }
    public var ethiopicAmeteMihret: DateView    { return dateView(calendar: NSCalendar.ethiopicAmeteMihret) }
    public var ethiopicAmeteAlem: DateView      { return dateView(calendar: NSCalendar.ethiopicAmeteAlem) }
    public var hebrew: DateView                 { return dateView(calendar: NSCalendar.hebrew) }
    public var ISO8601: DateView                { return dateView(calendar: NSCalendar.ISO8601) }
    public var indian: DateView                 { return dateView(calendar: NSCalendar.indian) }
    public var islamic: DateView                { return dateView(calendar: NSCalendar.islamic) }
    public var islamicCivil: DateView           { return dateView(calendar: NSCalendar.islamicCivil) }
    public var japanese: DateView               { return dateView(calendar: NSCalendar.japanese) }
    public var persian: DateView                { return dateView(calendar: NSCalendar.persian) }
    public var republicOfChina: DateView        { return dateView(calendar: NSCalendar.republicOfChina) }
}
