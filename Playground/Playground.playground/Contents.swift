
import Foundation
import Datez


//: ## Features
//: __Quickly and Expicility Access Date Components:__

let someDate = NSDate()
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


//: __[Bonus]: Durations__
//: This is marked as bonus since it's not ideal at all for precise calculation, but super useful when you just need some convenience. Examples would be setting expiration intervals and estimating components from `NSTimeInterval`

// Easily access NSTimeInterval to construct durations
let expirationInterval = 5.days.timeInterval

// And convert back to date components
let components = 300.days.timeInterval
// components ~= DateComponents(month: 3)


//: __[Bonus]: Counting__
//: Returns the total number of a calendar component from a time interval.

// either this
let totalDays = 50000.hours.timeInterval.totalDays

