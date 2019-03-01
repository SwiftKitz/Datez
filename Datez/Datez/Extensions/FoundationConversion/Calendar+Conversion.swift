//
//  Calendar+Conversion.swift
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
    
    static let gregorian              = Calendar(identifier: .gregorian)
    static let buddhist               = Calendar(identifier: .buddhist)
    static let chinese                = Calendar(identifier: .chinese)
    static let coptic                 = Calendar(identifier: .coptic)
    static let ethiopicAmeteMihret    = Calendar(identifier: .ethiopicAmeteMihret)
    static let ethiopicAmeteAlem      = Calendar(identifier: .ethiopicAmeteAlem)
    static let hebrew                 = Calendar(identifier: .hebrew)
    static let iso8601                = Calendar(identifier: .iso8601)
    static let indian                 = Calendar(identifier: .indian)
    static let islamic                = Calendar(identifier: .islamic)
    static let islamicCivil           = Calendar(identifier: .islamicCivil)
    static let japanese               = Calendar(identifier: .japanese)
    static let persian                = Calendar(identifier: .persian)
    static let republicOfChina        = Calendar(identifier: .republicOfChina)
}

public extension Calendar.Component {
    
    public static var all: Set<Calendar.Component> {
        return [
            .calendar, .day, .era, .hour, .minute, .month, .nanosecond, .quarter, .second,
            .timeZone, .weekday, .weekdayOrdinal, .weekOfMonth, .weekOfYear, .year, .yearForWeekOfYear
        ]
    }
}
