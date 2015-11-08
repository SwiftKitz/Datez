//
//  NSDateConversion.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 zkit. All rights reserved.
//

import Foundation


public extension NSDate {
    
    public func dateView(calendar calendar: NSCalendar) -> DateView {
        
        return DateView(
            forDate: self,
            inCalendar: calendar
        )
    }
    
    public var gregorian: DateView {
        return dateView(calendar: NSCalendar.Gregorian)
    }
    
    public var islamicCivil: DateView {
        return dateView(calendar: NSCalendar.IslamicCivil)
    }
}
