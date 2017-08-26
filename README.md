
<h1 align="center">
  Datez :calendar:
<h6 align="center">
  Breeze through Date, DateComponents, and TimeInterval
</h6>
</h1>

<p align="center">
  <img alt="Version" src="https://img.shields.io/badge/version-2.0.1-blue.svg" />
  <a alt="Travis CI" href="https://travis-ci.org/SwiftKitz/Datez">
    <img alt="Version" src="https://travis-ci.org/SwiftKitz/Datez.svg?branch=master" />
  </a>
  <img alt="Swift" src="https://img.shields.io/badge/swift-4.0-orange.svg" />
  <img alt="Platforms" src="https://img.shields.io/badge/platform-ios%20%7C%20osx%20%7C%20watchos%20%7C%20tvos-lightgrey.svg" />
  <a alt="Carthage Compatible" href="https://github.com/SwiftKitz/Datez#carthage">
    <img alt="Carthage" src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" />
  </a>
  <img src="resources/Demo.gif">
</p>

## Highlights

+ __Two Custom Structs Only _(value types FTW!)_:__
  - __`DateView`__: An `Date` associated with an `Calendar`
  - __`CalendarComponents`__: Like `DateComponents`, but `Calendar` agnostic.

+ __Absolutely _Zero_ Hardcode:__<br />
Only hardcode now is to clear the date components, by setting the value to `0` or `1`. Nothing like:<br />
`minutes = seconds * 60`.

+ __Modular Composition Design:__<br />
Only one way to achieve something, instead of copy pasting code everywhere, with tons of head scratching.

## Features

You can try them in the playground shipped with the framework!

__Quickly and Explicitly Access Date Components:__

```swift
let someDate = Date()
let currentCalendar = someDate.currentCalendar.components.year
let gregorianDay = someDate.gregorian.components.day
let hijriMonth = someDate.islamicCivil.components.month
```

__Easy and Concise Date Manipulation:__

```swift
let date = Date()
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

__Convenient Date Operators:__

```swift
// Just calling timeIntervalSinceDate
let difference = Date(timeIntervalSinceNow: 5.minutes.timeInterval) - Date()

// Just calling dateByAddingTimeInterval
let afterFiftyHours = Date() + 50.hours.timeInterval

// Just calling compare:
let compareResult = Date(timeIntervalSinceNow: 8.hours.timeInterval) < Date()
```

__[Bonus]: Durations__<br />
This is marked as bonus since it's not ideal at all for precise calculation, but super useful when you just need some convenience. Examples would be setting expiration intervals and estimating components from `TimeInterval`

```swift
// Easily access TimeInterval to construct durations
let expirationInterval = 300.days.timeInterval

// Convert back to a single date component
let months = expirationInterval.totalMonths // 9

// Or multiple components
let components = expirationInterval.components
// components ≈ CalendarComponents(day: 6, month: 9)
```

## Getting Started

**IMPORTANT:** Kitz repos fully embrace Swift 4.0 and all the changes it brought. You should use `v1.0.0` if you're still using Swift 2.x.

### Carthage

[Carthage][carthage-link] is fully supported. Simply add the following line to your [Cartfile][cartfile-docs]:

```ruby
github "SwiftKitz/Datez" ~> 2.0.1
```

### CocoaPods

[CocoaPods][cocoapods-link] is fully supported. Simply add the following line to your [Podfile][podfile-docs]:

```ruby
pod 'Datez'
```

### Submodule

For manual installation, you can grab the source directly or through git submodules, then simply:

+ Drop the `Datez.xcodeproj` file as a subproject (make sure `Copy resources` is __not__ enabled)
+ Navigate to your root project settings. Under "Embedded Binaries", click the "+" button and select the `Datez.framework`

## Motivation

This framework doesn't reinvent anything Apple already built. Under the hood, it leverages the `Date`, `Calendar`, and `DateComponents` classes to do all the work. It simply tries to simplify the API for Swift developers. Period.

After experiencing what using a great Swift API feels like, by using RealmSwift and SwiftyJSON, I started to believe in the importance of a clean and concise Swift API, and its impact on our productivity and stress levels.

_What's wrong with other date libraries?_

__Assuming the underlying `Calendar`__:<br />
I needed to explicitly choose between Gregorian and IslamicCivil, so that is integrated.

__Wrong Date Calculation__:<br />
Most frameworks I've seen make assumptions about the number of days in a month, or hardcode the number of hours ... etc.

## Author

Mazyod ([@Mazyod](http://twitter.com/mazyod))

## License

Datez is released under the MIT license. See LICENSE for details.


[carthage-link]: https://github.com/Carthage/Carthage
[cartfile-docs]: https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile
[cocoapods-link]: https://cocoapods.org/
[podfile-docs]: https://guides.cocoapods.org/syntax/podfile.html
