//
//  Debugging.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Foundation


extension DateComponents: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        return "\(day).\(month).\(year) \(hour):\(minute):\(second)"
    }
}

extension DateView: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        return "\(components), \(calendar.calendarIdentifier)"
    }
}
