//
//  Date.swift
//  Prayerz
//
//  Created by Mazyad Alabduljaleel on 9/16/15.
//  Copyright (c) 2015 ArabianDevs. All rights reserved.
//

import Foundation


/** A date associated with an `NSCalendar` */
public struct DateView {
    
    // MARK: - Properties
    
    public let date: Date
    public let calendar: NSCalendar
    
    public var components: CalendarComponents {
        return calendar.components(
            NSCalendar.Unit(rawValue: UInt.max),
            from: date
        ).calendarComponents
    }
    
    // MARK: - Init & Dealloc
    
    public init(forDate date: Date, inCalendar calendar: NSCalendar) {
        
        self.calendar = calendar
        self.date = date
    }
    
    public init(forCalendarComponents calendarComponents: CalendarComponents, inCalendar calendar: NSCalendar) {
        
        self.init(
            forDate: calendar.date(from: calendarComponents.dateComponents as DateComponents)!,
            inCalendar: calendar
        )
    }
    
    // MARK: - Public methods
    
    public func update(
        year: Int? = nil,
        month: Int? = nil,
        day: Int? = nil,
        hour: Int? = nil,
        minute: Int? = nil,
        second: Int? = nil
    ) -> DateView
    {
        let comps = components.update(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
        return DateView(forCalendarComponents: comps, inCalendar: calendar)
    }
}
