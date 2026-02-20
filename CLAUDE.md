# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Datez is a Swift library for date manipulation, providing a clean API over Apple's Foundation date/calendar types. It supports multiple calendar systems (Gregorian, Islamic, Hebrew, Buddhist, etc.) with zero external dependencies.

**Author-maintained open source project (MIT license).**

## Build & Test Commands

```bash
# Build
swift build

# Run all tests
swift test

# Run a single test class
swift test --filter DatezTests.CalendarComponentsTests

# Run a single test method
swift test --filter DatezTests.CalendarComponentsTests/testUpdate

# Verbose output (matches CI)
swift build -v && swift test -v
```

Platforms: iOS 16+, macOS 13+, tvOS 15+, watchOS 8+. Swift 6 language mode enabled.

## Architecture

The library has two core value types that work together:

- **`CalendarComponents`** — Calendar/timezone-agnostic container for date components (year, month, day, hour, minute, second, etc.). All fields default to 0. Supports immutable `update()` and mutable `updateInPlace()`.

- **`DateView`** — Pairs a `Date` with a `Calendar`, bridging Foundation dates into the Datez world. Provides computed `components` property, relative accessors (`beginningOfDay`, `beginningOfMonth`, `isToday`), and arithmetic via operator overloads.

**Entry point pattern**: Users access DateView through calendar-named properties on `Date`:
```swift
Date().gregorian    // → DateView using Gregorian calendar
Date().islamic      // → DateView using Islamic calendar
```

### Source Organization

```
Sources/Datez/
├── Entity/          # CalendarComponents, DateView (core types)
├── Extensions/
│   ├── FoundationConversion/  # Bridging: Date↔DateView, CalendarComponents↔DateComponents, TimeInterval↔CalendarComponents
│   ├── Counting.swift         # TimeInterval → total units (totalDays, totalMonths, etc.)
│   ├── Duration.swift         # Int extensions: 1.day, 5.minutes → CalendarComponents
│   └── Relativity.swift       # beginningOfDay, isToday, isSameDayAsDate, etc.
├── Operators/       # +/- DateView with CalendarComponents, Date subtraction, negation
└── Services/        # DiscreteTimer (fires callbacks on time-unit boundaries)
```

Tests mirror this structure under `Tests/DatezTests/`.

### Concurrency

The library uses Swift 6 strict concurrency. All public types conform to `Sendable`:
- `CalendarComponents` and `DateView` are naturally `Sendable` (value types with Sendable properties)
- `DiscreteTimer` is `@unchecked Sendable` (all work dispatched to main queue)
- `DiscreteTimer.Callback` and `dateProvider` closures are `@Sendable`

### Design Principles

- Value types only (structs) — no classes except `DiscreteTimer`
- Zero hardcoded time calculations — always delegates to Foundation's `Calendar`
- Calendar-agnostic core (`CalendarComponents`) with calendar-specific views (`DateView`)
- One idiomatic way to achieve each task
