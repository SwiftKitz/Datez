//
//  Date+Conversion.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Foundation


/** `DateView` access from `Date` */
public extension Date {
    
    public func dateView(calendar: Calendar) -> DateView {
        
        return DateView(
            forDate: self,
            inCalendar: calendar
        )
    }
    
    public var currentCalendar: DateView {
        return dateView(calendar: Calendar.current)
    }
    
    public var gregorian: DateView              { return dateView(calendar: Calendar.gregorian) }
    public var buddhist: DateView               { return dateView(calendar: Calendar.buddhist) }
    public var chinese: DateView                { return dateView(calendar: Calendar.chinese) }
    public var coptic: DateView                 { return dateView(calendar: Calendar.coptic) }
    public var ethiopicAmeteMihret: DateView    { return dateView(calendar: Calendar.ethiopicAmeteMihret) }
    public var ethiopicAmeteAlem: DateView      { return dateView(calendar: Calendar.ethiopicAmeteAlem) }
    public var hebrew: DateView                 { return dateView(calendar: Calendar.hebrew) }
    public var iso8601: DateView                { return dateView(calendar: Calendar.iso8601) }
    public var indian: DateView                 { return dateView(calendar: Calendar.indian) }
    public var islamic: DateView                { return dateView(calendar: Calendar.islamic) }
    public var islamicCivil: DateView           { return dateView(calendar: Calendar.islamicCivil) }
    public var japanese: DateView               { return dateView(calendar: Calendar.japanese) }
    public var persian: DateView                { return dateView(calendar: Calendar.persian) }
    public var republicOfChina: DateView        { return dateView(calendar: Calendar.republicOfChina) }
}
