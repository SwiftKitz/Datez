//
//  Debugging.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Foundation


/** Add pretty debug descriptions */
extension CalendarComponents: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        return String(format: "%04ld-%02ld-%02ld %02ld:%02ld:%02ld",
            arguments: [year, month, day, hour, minute, second]
        )
    }
}

extension DateView: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        return "\(components), \(calendar.identifier)"
    }
}
