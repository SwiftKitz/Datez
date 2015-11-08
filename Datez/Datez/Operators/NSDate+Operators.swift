//
//  NSDate+Operators.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 zkit. All rights reserved.
//

import Foundation

/** simple shorthand for dateByAddingTimeInterval */
public func + (lhs: NSDate, rhs: NSTimeInterval) -> NSDate {
    return lhs.dateByAddingTimeInterval(rhs)
}

/** simple shorthand for timeIntervalSinceDat */
public func - (lhs: NSDate, rhs: NSDate) -> NSTimeInterval {
    return lhs.timeIntervalSinceDate(rhs)
}
