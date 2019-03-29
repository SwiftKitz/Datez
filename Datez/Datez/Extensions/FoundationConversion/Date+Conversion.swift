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
    
    func dateView(calendar: Calendar) -> DateView {
        
        return DateView(
            forDate: self,
            inCalendar: calendar
        )
    }
    
    var currentCalendar: DateView {
        return dateView(calendar: Calendar.current)
    }
    
    var gregorian: DateView             { return dateView(calendar: Calendar.gregorian) }
    var buddhist: DateView              { return dateView(calendar: Calendar.buddhist) }
    var chinese: DateView               { return dateView(calendar: Calendar.chinese) }
    var coptic: DateView                { return dateView(calendar: Calendar.coptic) }
    var ethiopicAmeteMihret: DateView   { return dateView(calendar: Calendar.ethiopicAmeteMihret) }
    var ethiopicAmeteAlem: DateView     { return dateView(calendar: Calendar.ethiopicAmeteAlem) }
    var hebrew: DateView                { return dateView(calendar: Calendar.hebrew) }
    var iso8601: DateView               { return dateView(calendar: Calendar.iso8601) }
    var indian: DateView                { return dateView(calendar: Calendar.indian) }
    var islamic: DateView               { return dateView(calendar: Calendar.islamic) }
    var islamicCivil: DateView          { return dateView(calendar: Calendar.islamicCivil) }
    var islamicTabular: DateView        { return dateView(calendar: Calendar.islamicTabular) }
    var islamicUmmAlQura: DateView      { return dateView(calendar: Calendar.islamicUmmAlQura) }
    var japanese: DateView              { return dateView(calendar: Calendar.japanese) }
    var persian: DateView               { return dateView(calendar: Calendar.persian) }
    var republicOfChina: DateView       { return dateView(calendar: Calendar.republicOfChina) }
}
