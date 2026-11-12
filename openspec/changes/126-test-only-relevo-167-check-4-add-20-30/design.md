# Design

## Context

`lib/main.dart` holds the home screen (`_MyHomePageState`) with a `_counter` and a `TextButton` keyed `add-ten-button` whose handler `_addTen` does `setState(() => _counter += 10)`. See proposal.md for the motivation.

## Goals / Non-Goals

**Goals:**
- Three buttons that follow "Add 10", keyed `add-twenty-button`, `add-thirty-button` and `add-forty-button`, each with its own widget test file.

**Non-Goals:**
- Saving the counter, any other button, refactoring "Add 10".

## Decisions

- Each button is a `TextButton` placed after "Add 10", with a handler like `_addTen`. "Add 20" is the template (section 1); "Add 30" and "Add 40" are replicas of it (section 2), as the issue asks.
- Tests: `test/add_twenty_test.dart`, `test/add_thirty_test.dart`, `test/add_forty_test.dart`, each with the zero and the non-zero scenarios.

## Risks / Trade-offs

- Taller column on small screens: the body is already a `SingleChildScrollView`, so no overflow.

## Assumptions

- No new dependency is needed.
- The replicas copy the template's widget and test and only rename it.
