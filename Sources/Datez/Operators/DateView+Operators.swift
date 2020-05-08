//
//  DateView+Operators.swift
//  Prayerz
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 ArabianDevs. All rights reserved.
//

import Foundation


/** new DateView by adding wallclock calendarComponents */
public func + (dateView: DateView, components: CalendarComponents) -> DateView {
    
    let newDate = dateView.calendar.date(
        byAdding: components.dateComponents,
        to: dateView.date
    )!
    
    return DateView(forDate: newDate, inCalendar: dateView.calendar)
}

/** dateView - calendarComponents */
public func - (dateView: DateView, components: CalendarComponents) -> DateView {
    return dateView + (-components)
}
