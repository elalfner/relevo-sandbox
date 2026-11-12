# Design

## Context

`lib/main.dart` holds the home page. The "Add 10" button (`add-ten-button`, handler `_addTen`) is the pattern (#119, merged as #120); its test is `test/add_ten_test.dart`. See proposal.md.

## Goals / Non-Goals

**Goals:** three buttons, each a replica of the pattern, placed after "Add 10" in the column.

**Non-Goals:** persistence of the counter; refactoring the pattern into a shared widget; any other button.

## Decisions

- Each button is built as its own replica from the pattern (`Template: pattern`): own key, own handler, own test file.
- Test files are `test/add_twenty_test.dart`, `test/add_thirty_test.dart` and `test/add_forty_test.dart`, copied from `test/add_ten_test.dart`.

## Risks / Trade-offs

- Replicas repeat code on purpose: this change tests guided replication, so no shared helper is introduced.

## Assumptions

- Keys follow the pattern: `add-twenty-button`, `add-thirty-button`, `add-forty-button`.
- The new buttons are placed below "Add 10" in the same column.
