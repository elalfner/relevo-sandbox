# Design

## Context

`lib/main.dart` holds the home screen (`_MyHomePageState`) with a `_counter` and a `TextButton` "Add 10" (key `add-ten-button`, handler `_addTen`). Tests live in `test/` (see `test/add_ten_test.dart`). See proposal.md for motivation.

## Goals / Non-Goals

**Goals:**
- Three buttons that follow the "Add 10" pattern, each with its own widget test file.

**Non-Goals:**
- Persisting the counter; any other button; new dependencies.

## Decisions

- Each button is a `TextButton` below "Add 10" with keys `add-thirty-one-button`, `add-thirty-three-button` and `add-thirty-five-button`, calling `setState(() => _counter += n)`.
- Tests: `test/add_thirty_one_test.dart`, `test/add_thirty_three_test.dart`, `test/add_thirty_five_test.dart`, in the style of `add_ten_test.dart`.

## Risks / Trade-offs

- The "Thirty-one!" message appears when the counter equals 31, so "Add 31" from 0 also shows it; this is existing behaviour and is kept.

## Assumptions

- Button order on screen: Add 10, Add 31, Add 33, Add 35.
- No new dependencies are needed.
