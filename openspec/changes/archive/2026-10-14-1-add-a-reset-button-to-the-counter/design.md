# Design

## Context

The counter lives in `_MyHomePageState` in `lib/main.dart` as an `int _counter`, shown in a `Column` inside `Center`. There is no `lib/screens/` yet.

## Goals / Non-Goals

**Goals:**
- Add a "Reset" `TextButton` (key `reset-button`) below the counter text that sets `_counter` to 0.

**Non-Goals:**
- Persisting the counter between launches.

## Decisions

- Keep the change inside the existing state class: a `_resetCounter` method calling `setState(() => _counter = 0)`. Setting an absolute value makes repeated taps idempotent, which covers the double-tap and zero cases.
- Use `TextButton` as the issue asks. No new dependencies.

## Risks / Trade-offs

- The existing screen stays in `lib/main.dart` rather than moving to `lib/screens/`; moving it is not part of this issue.

## Assumptions

- The button is shown at all times, including when the counter is 0.
- The button sits directly under the counter number text, inside the existing column.
- No confirmation dialog or animation is wanted.
