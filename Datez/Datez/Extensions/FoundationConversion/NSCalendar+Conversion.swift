//
//  NSCalendar+Conversion.swift
//  Datez
//
//  Created by Mazyad Alabduljaleel on 11/7/15.
//  Copyright © 2015 kitz. All rights reserved.
//

import Foundation


extension NSCalendar {
    
    func components(_ units: NSCalendar.Unit, fromTimeInterval timeInterval: TimeInterval) -> DateComponents {
        
        let baseDate = Date(timeIntervalSinceReferenceDate: 0)
        return components(units, from: baseDate, to: baseDate + timeInterval, options: [])
    }
}

extension NSCalendar {
    
    static var gregorian: NSCalendar            { return NSCalendar(identifier: NSCalendar.Identifier.gregorian)! }
    static var buddhist: NSCalendar             { return NSCalendar(identifier: NSCalendar.Identifier.buddhist)! }
    static var chinese: NSCalendar              { return NSCalendar(identifier: NSCalendar.Identifier.chinese)! }
    static var coptic: NSCalendar               { return NSCalendar(identifier: NSCalendar.Identifier.coptic)! }
    static var ethiopicAmeteMihret: NSCalendar  { return NSCalendar(identifier: NSCalendar.Identifier.ethiopicAmeteMihret)! }
    static var ethiopicAmeteAlem: NSCalendar    { return NSCalendar(identifier: NSCalendar.Identifier.ethiopicAmeteAlem)! }
    static var hebrew: NSCalendar               { return NSCalendar(identifier: NSCalendar.Identifier.hebrew)! }
    static var ISO8601: NSCalendar              { return NSCalendar(identifier: NSCalendar.Identifier.ISO8601)! }
    static var indian: NSCalendar               { return NSCalendar(identifier: NSCalendar.Identifier.indian)! }
    static var islamic: NSCalendar              { return NSCalendar(identifier: NSCalendar.Identifier.islamic)! }
    static var islamicCivil: NSCalendar         { return NSCalendar(identifier: NSCalendar.Identifier.islamicCivil)! }
    static var japanese: NSCalendar             { return NSCalendar(identifier: NSCalendar.Identifier.japanese)! }
    static var persian: NSCalendar              { return NSCalendar(identifier: NSCalendar.Identifier.persian)! }
    static var republicOfChina: NSCalendar      { return NSCalendar(identifier: NSCalendar.Identifier.republicOfChina)! }
}
