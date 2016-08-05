//
//  IntMonth.swift
//  Datez
//
//  Created by Mariam AlJamea on 8/5/16.
//  Copyright © 2016 kitz. All rights reserved.
//

import Foundation

public extension String {
    
    public var strMonth2Int: Int? {
        
        let dateformatter = NSDateFormatter()
        dateformatter.dateFormat = "MM"
        
        if let date = dateformatter.dateFromString(self) {
            let month  = NSCalendar.currentCalendar().component(.Month, fromDate: date)
            return month
        }
        
        return nil
    }
}
