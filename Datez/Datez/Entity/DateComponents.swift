//
//  DateComponents.swift
//  Prayerz
//
//  Created by Mazyad Alabduljaleel on 9/16/15.
//  Copyright (c) 2015 ArabianDevs. All rights reserved.
//

import Foundation

/** Calendar agnostic data structure to hold date components */
public struct DateComponents {
    
    public var year = 0
    public var month = 0
    public var day = 0
    public var hour = 0
    public var minute = 0
    public var second = 0
    
    public init(
        year: Int? = nil,
        month: Int? = nil,
        day: Int? = nil,
        hour: Int? = nil,
        minute: Int? = nil,
        second: Int? = nil
    )
    {
        updateInPlace(
            year: year,
            month: month,
            day: day,
            hour: hour,
            minute: minute,
            second: second
        )
    }
    
    public func update(
        year year: Int? = nil,
        month: Int? = nil,
        day: Int? = nil,
        hour: Int? = nil,
        minute: Int? = nil,
        second: Int? = nil
    ) -> DateComponents {
            
        var components = self
        components.updateInPlace(
            year: year,
            month: month,
            day: day,
            hour: hour,
            minute: minute,
            second: second
        )
            
        return components
    }
    
    public mutating func updateInPlace(
        year year: Int? = nil,
        month: Int? = nil,
        day: Int? = nil,
        hour: Int? = nil,
        minute: Int? = nil,
        second: Int? = nil
    ) {
        self.year = year ?? self.year
        self.month = month ?? self.month
        self.day = day ?? self.day
        self.hour = hour ?? self.hour
        self.minute = minute ?? self.minute
        self.second = second ?? self.second
    }
}
