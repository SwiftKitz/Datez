//
//  NSDate+Operators.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Foundation

/** simple shorthand for dateByAddingTimeInterval */


/** simple shorthand for timeIntervalSinceDat */
public func - (lhs: Date, rhs: Date) -> TimeInterval {
    return lhs.timeIntervalSince(rhs)
}
