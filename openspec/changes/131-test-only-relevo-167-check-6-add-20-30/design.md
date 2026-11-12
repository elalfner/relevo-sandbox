# Design

## Context

`lib/main.dart` holds the home screen with an "Add 10" button (`add-ten-button`, handler `_addTen`) and its test `test/add_ten_test.dart`, added by #119 (merged as #120). See proposal.md.

## Goals / Non-Goals

**Goals:** three buttons that follow the "Add 10" pattern, one replica task each.

**Non-Goals:** saving the counter, any other button, refactoring the existing button.

## Decisions

- Each button copies the pattern: a key (`add-twenty-button`, `add-thirty-button`, `add-forty-button`), a handler adding its number, a `TextButton` after the previous one, and a test file `test/add_<n>_test.dart` with the two scenarios.
- No new dependencies.

## Risks / Trade-offs

- Copying the pattern repeats code; accepted, because the issue asks for replicas.

## Assumptions

- The buttons appear after "Add 10", in the order 20, 30, 40.
- Keys follow the pattern's naming (`add-ten-button` becomes `add-twenty-button` and so on).
