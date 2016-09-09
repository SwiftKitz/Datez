//
//  NSCalendar+Conversion.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Foundation


extension Calendar {
    
    func components(_ units: Set<Calendar.Component>, fromTimeInterval timeInterval: TimeInterval) -> DateComponents {
        
        let baseDate = Date(timeIntervalSinceReferenceDate: 0)
        return dateComponents(units, from: baseDate, to: baseDate + timeInterval)
    }
}

extension Calendar {
    
    static var gregorian: Calendar            { return Calendar(identifier: Calendar.Identifier.gregorian) }
    static var buddhist: Calendar             { return Calendar(identifier: Calendar.Identifier.buddhist) }
    static var chinese: Calendar              { return Calendar(identifier: Calendar.Identifier.chinese) }
    static var coptic: Calendar               { return Calendar(identifier: Calendar.Identifier.coptic) }
    static var ethiopicAmeteMihret: Calendar  { return Calendar(identifier: Calendar.Identifier.ethiopicAmeteMihret) }
    static var ethiopicAmeteAlem: Calendar    { return Calendar(identifier: Calendar.Identifier.ethiopicAmeteAlem) }
    static var hebrew: Calendar               { return Calendar(identifier: Calendar.Identifier.hebrew) }
    static var iso8601: Calendar              { return Calendar(identifier: Calendar.Identifier.iso8601) }
    static var indian: Calendar               { return Calendar(identifier: Calendar.Identifier.indian) }
    static var islamic: Calendar              { return Calendar(identifier: Calendar.Identifier.islamic) }
    static var islamicCivil: Calendar         { return Calendar(identifier: Calendar.Identifier.islamicCivil) }
    static var japanese: Calendar             { return Calendar(identifier: Calendar.Identifier.japanese) }
    static var persian: Calendar              { return Calendar(identifier: Calendar.Identifier.persian) }
    static var republicOfChina: Calendar      { return Calendar(identifier: Calendar.Identifier.republicOfChina) }
}

public extension Calendar.Component {
    
    public static var all: Set<Calendar.Component> {
        return [
            .calendar, .day, .era, .hour, .minute, .month, .nanosecond, .quarter, .second,
            .timeZone, .weekday, .weekdayOrdinal, .weekOfMonth, .weekOfYear, .year, .yearForWeekOfYear
        ]
    }
}
