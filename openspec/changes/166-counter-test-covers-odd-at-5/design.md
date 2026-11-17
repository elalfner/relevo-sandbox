# Design

## Context

`test/widget_test.dart` already has parity checks (Even at 0, Even at 2, Odd at 3) that use the local `tapAdd` helper. See proposal.md.

## Goals / Non-Goals

**Goals:**
- One new `testWidgets` check, "Parity text says Odd at 5", placed after the Odd at 3 check.

**Non-Goals:**
- Any change to app code or to other test files.

## Decisions

- Follow the name pattern and the `tapAdd` helper of the neighbouring checks. The check uses no clock and no network.

## Risks / Trade-offs

- None: the app already renders "Odd" at 5.

## Assumptions

- The new check asserts "5" and "Odd" are shown and "Even" is not, like the Odd at 3 check, without the position assertion.
## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `x`: test/widget_test.dart
