# Design

## Context

`lib/main.dart` holds the home screen with an "Add 10" `TextButton` (key `add-ten-button`) that calls `_addTen`, which does `setState(() => _counter += 10)`. Tests live in `test/add_ten_test.dart`.

## Goals / Non-Goals

**Goals:** three buttons following the Add 10 pattern, each with its own key and widget test.

**Non-Goals:** persistence, any other button.

## Decisions

- Each button is a `TextButton` with key `add-five-button`, `add-seven-button`, `add-nine-button`, placed after "Add 10", each with its own handler.
- One test file per button: `test/add_five_test.dart`, `test/add_seven_test.dart`, `test/add_nine_test.dart`.

## Assumptions

- Button order in the column is Add 10, Add 5, Add 7, Add 9.
- No new dependencies.
