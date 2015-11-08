//
//  DateView+Operators.swift
//  Prayerz
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 ArabianDevs. All rights reserved.
//

import Foundation


/** new DateView by adding wallclock dateComponents */
public func + (dateView: DateView, components: DateComponents) -> DateView {
    
    let newDate = dateView.calendar.dateByAddingComponents(
        components.foundation,
        toDate: dateView.date,
        options: []
    )!
    
    return DateView(forDate: newDate, inCalendar: dateView.calendar)
}

/** dateView - dateComponents */
public func - (dateView: DateView, components: DateComponents) -> DateView {
    return dateView + (-components)
}


extension DateView: Equatable {}

/** Bool whether they are equal or not */
public func == (lhs: DateView, rhs: DateView) -> Bool {
    return lhs.date == rhs.date && lhs.calendar == rhs.calendar
}
