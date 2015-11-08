//
//  Date.swift
//  Prayerz
//
//  Created by Mazyad Alabduljaleel on 9/16/15.
//  Copyright (c) 2015 ArabianDevs. All rights reserved.
//

import Foundation


public struct DateView {
    
    // MARK: - Properties
    
    public let date: NSDate
    public let calendar: NSCalendar
    
    public var components: DateComponents {
        
        return calendar.components(
            NSCalendarUnit(rawValue: UInt.max),
            fromDate: date
        ).datez
    }
    
    // MARK: - Init & Dealloc
    
    public init(forDate date: NSDate, inCalendar calendar: NSCalendar) {
        
        self.calendar = calendar
        self.date = date
    }
    
    public init(forDateComponents dateComponents: DateComponents, inCalendar calendar: NSCalendar) {
        
        self.init(
            forDate: calendar.dateFromComponents(dateComponents.foundation)!,
            inCalendar: calendar
        )
    }
    
    // MARK: - Public methods
    
    public func update(
        year year: Int? = nil,
        month: Int? = nil,
        day: Int? = nil,
        hour: Int? = nil,
        minute: Int? = nil,
        second: Int? = nil
        ) -> DateView
    {
        let comps = components.update(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
        return DateView(forDateComponents: comps, inCalendar: calendar)
    }
}
