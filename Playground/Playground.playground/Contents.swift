
import Foundation
import Datez

//: # Datez
//: ### Compact dates library to get sh*t done!

//: ## Features
//: __Quickly and Expicility Access Date Components:__

let someDate = NSDate()
let currentCalendar = someDate.currentCalendar.components.year
let gregorianDay = someDate.gregorian.components.day
let hijriMonth = someDate.islamicCivil.components.month


//: __Easy and Concise Date Manipulation:__

let date = NSDate()
let gregorianDate = date.gregorian

// Adding components
let tomorrow = gregorianDate + 1.day

// Relative accessors
let firstThingTomorrow = tomorrow.beginningOfDay

// Easy tweaking
let firstThingTomorrowButIn1984 = firstThingTomorrow.update(year: 1984)

// now, lets get the date
let newDate = firstThingTomorrowButIn1984.date


//: __Convenient NSDate Operators:__

// Just calling timeIntervalSinceDate
let difference = NSDate(timeIntervalSinceNow: 5.minutes.timeInterval) - NSDate()

// Just calling dateByAddingTimeInterval
let afterFiftyHours = NSDate() + 50.hours.timeInterval

// Just calling compare:
let compareResult = NSDate(timeIntervalSinceNow: 8.hours.timeInterval) < NSDate()

//: __[Bonus]: Durations__
//:
//: This is marked as bonus since it's not ideal at all for precise calculation, but super useful when you just need some convenience. Examples would be setting expiration intervals and estimating components from `NSTimeInterval`

// Easily access NSTimeInterval to construct durations
let expirationInterval = 300.days.timeInterval

// Convert back to a single date component
let months = expirationInterval.totalMonths // 9

// Or multiple components
let components = expirationInterval.components
// components ≈ DateComponents(day: 6, month: 9)

