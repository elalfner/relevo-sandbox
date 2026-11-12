# Design

## Context

`lib/main.dart` holds the home screen with `_addTen` and a `TextButton` keyed `add-ten-button` (change #119). See proposal.md.

## Goals / Non-Goals

**Goals:** three buttons that follow the "Add 10" pattern.

**Non-Goals:** saving the counter; any other button.

## Decisions

- Follow the "Add 10" pattern: one `TextButton` per amount with key `add-20-button`, `add-30-button`, `add-40-button`, placed after "Add 10", each calling a small method that does `setState(() => _counter += n)`.
- Tests go in `test/add_buttons_test.dart`, in the style of `test/add_ten_test.dart`.

## Risks / Trade-offs

- Four more buttons make the column taller; it already scrolls (`SingleChildScrollView`), so no overflow. [Risk] → Mitigation: the existing scroll view.

## Assumptions

- The new buttons are not wrapped in an extra widget or section; they are siblings of "Add 10".
- No new dependency is needed.
