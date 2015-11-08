
# DATEZ

## Motivation

Just a quick brief about the motivation and thought that went behind this library:

I am not one to ridicule Apple's frameworks. If the functionality we seek can be achieved through Apple's frameworks, I believe it should be our first destination. I've mostly seen this in Alamofire, which is a great library that makes use of Apple's frameworks to their fullest.

__Why a new Date framework then?__

First and foremost, this date framework doesn't reinvent anything at all. Under the hood, it leverages the `NSDate`, `NSCalendar`, and `NSDateComponents` classes to do all the work. It simply tried to simplify the API for Swift developers. Period.

After experience what using a great Swift API feels like, by using RealmSwift and SwiftyJSON, I started to believe in the importance of a clean and concise Swift API, and its impact on our productivity and stress levels.

__What's wrong with the Objective-C APIs?__

The first problem I faced was the lack of convenient accessors. If I had a date object, I wanted a quick access to the `gregorian` and `hijri` calendars. Once I had those, I wanted to quickly manipulate them without juggling three classes every time. It's purely cosmetic.

Another bummer is value semantics .. Or rather lack, thereof. Value types are easy to reason with, as opposed to reference types. `NSDateComponents` is a very good candidate for a value type, for example.

The real problem was the optionality of the APIs. `NSDateComponents` has `NSDateComponentUndefined` instead of an optional value, which just sucks for Swift developers. Better yet, get rid of all the uncertainty! Another issue is the optionality of `NSDate` and `NSCalendar` on `NSDateComponents`. Can't we get rid of this optionality somehow?

Clearly, there were too many problems dealing with the Foundation Date classes from Swift, and warrants a Swift API wrapper.