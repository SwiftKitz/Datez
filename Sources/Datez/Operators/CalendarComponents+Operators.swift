//
//  CalendarComponents+Operators.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 ArabianDevs. All rights reserved.
//

import Foundation


/** calendarComponents with inverted sign */
prefix operator -
public prefix func - (comps: CalendarComponents) -> CalendarComponents {
    return CalendarComponents(
        year: -comps.year,
        month: -comps.month,
        day: -comps.day,
        hour: -comps.hour,
        minute: -comps.minute,
        second: -comps.second
    )
}

