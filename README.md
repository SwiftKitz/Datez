
# Datez :calendar:

![Version](https://img.shields.io/badge/version-prerelease-orange.svg)
[![Travis CI](https://travis-ci.org/SwiftKitz/Datez.svg?branch=master)](https://travis-ci.org/SwiftKitz/Datez)
![Swift](https://img.shields.io/badge/swift-2.1-blue.svg)
![Platforms](https://img.shields.io/badge/platform-ios%20%7C%20osx%20%7C%20watchos%20%7C%20tvos-lightgrey.svg)

Compact dates library to get sh*t done!

_Even though I shipped it with my app, I still need to invest the time to set this up, and finalize the API. Contributors welcome!_

## Highlights

+ __Two Custom Structs Only _(value types FTW!)_:__
  - __`DateView`__: An `NSDate` associated with an `NSCalendar`
  - __`DateComponents`__: Like `NSDateComponents`, but `NSCalendar` agnostic.

+ __Absolutely _Zero_ Hardcode:__<br />
Only hardcode now is to clear the date components, by setting the value to `0` or `1`, not nothing like `minutes = seconds * 60`.

+ __Modular Composition Design:__<br />
Only one way to achieve something, instead of copy pasting code everywhere, with tons of head scratching.

## Features

You can try them in the playground shipped with the framework!

__Quickly and Explicitly Access Date Components:__

```swift
let someDate = NSDate()
let currentCalendar = someDate.currentCalendar.components.year
let gregorianDay = someDate.gregorian.components.day
let hijriMonth = someDate.islamicCivil.components.month
```

__Easy and Concise Date Manipulation:__

```swift
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
```

__Convenient NSDate Operators:__

```swift
// Just calling timeIntervalSinceDate
let difference = NSDate(timeIntervalSinceNow: 5.minutes.timeInterval) - NSDate()

// Just calling dateByAddingTimeInterval
let afterFiftyHours = NSDate() + 50.hours.timeInterval

// Just calling compare:
let compareResult = NSDate(timeIntervalSinceNow: 8.hours.timeInterval) < NSDate()
```

__[Bonus]: Durations__<br />
This is marked as bonus since it's not ideal at all for precise calculation, but super useful when you just need some convenience. Examples would be setting expiration intervals and estimating components from `NSTimeInterval`

```swift
// Easily access NSTimeInterval to construct durations
let expirationInterval = 5.days.timeInterval

// And convert back to date components
let components = 300.days.timeInterval
// components ~= DateComponents(month: 3)
```

__[Bonus]: Counting__<br />
Returns the total number of a calendar component from a time interval.

```swift
// either this
let totalDays = 50000.hours.timeInterval.totalDays
// returns 2083
```


## Motivation

I am not one to ridicule Apple's frameworks. If the functionality we seek can be achieved through Apple's frameworks, it should be our first destination. This can mostly be seen in Alamofire, which is a great library that makes use of Apple's frameworks to their fullest. 

All that to say, this framework doesn't reinvent anything at all. Under the hood, it leverages the `NSDate`, `NSCalendar`, and `NSDateComponents` classes to do all the work. It simply tried to simplify the API for Swift developers. Period.

After experience what using a great Swift API feels like, by using RealmSwift and SwiftyJSON, I started to believe in the importance of a clean and concise Swift API, and its impact on our productivity and stress levels.

_What's wrong with other date libraries?_

__Assuming the underlying `NSCalendar`__:<br />
I needed to explicitly choose between Gregorian and IslamicCivil, so that is integrated. It can also easily be extended to add more calendars. PRs most welcome!

__Wrong Date Calculation__:<br />
Most frameworks I've seen make assumptions about the number of days in a month, or hardcode the number of hours ... etc. 

__It Adheres to Kitz Quality__:<br />
Kitz is a collection of super small, effecient, tested, maintained and high quality frameworks that I use for my own projects. Give you eyes a feast and take a look at the code. No file is more than 100 lines :bowtie:.

## Author

Mazyod ([@Mazyod](http://twitter.com/mazyod))

## License

Datez is released under the MIT license. See LICENSE for details.
