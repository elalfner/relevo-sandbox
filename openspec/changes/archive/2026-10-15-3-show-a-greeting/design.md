# Design

## Context

`lib/main.dart` holds `MyHomePage` with a `Center`/`Column` body (counter, parity text, reset button). See proposal.md for motivation.

## Goals / Non-Goals

**Goals:**
- Pick the greeting once in the home screen state and keep it for the screen's lifetime.
- Make the body scrollable without changing existing counter behaviour.

**Non-Goals:**
- Names, translations, live updates, bold/colour/animation (out of scope in the issue).

## Decisions

- The greeting is computed in `initState` of the home screen state from `DateTime.now().hour` and stored in a final field, so rebuilds, lifecycle changes and clock changes never alter it. Alternative: compute in `build`; rejected because it would change on every tap.
- Testability: the home screen takes an optional `DateTime Function() clock` parameter defaulting to `DateTime.now`, so widget tests can set the hour without extra dependencies.
- Layout: wrap the body in `Center` > `SingleChildScrollView` > `Column` (min size), greeting first, styled with `textTheme.headlineMedium` with no overrides, `textAlign: center`. Scrolling covers large text and landscape.
- Hour mapping: 5-11 morning, 12-17 afternoon, otherwise evening.

## Risks / Trade-offs

- Making the body scrollable could shift existing layout → existing counter, parity and reset tests must keep passing.

## Assumptions

- "Phone's local time" is `DateTime.now()` (device local time zone).
- The greeting is a plain `Text` with a key `greeting-text`, to be found by tests.
- The existing sample app code stays in `lib/main.dart`; no screen move is part of this change.
