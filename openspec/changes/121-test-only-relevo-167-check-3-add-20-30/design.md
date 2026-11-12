## Context

`lib/main.dart` holds the home screen. The "Add 10" button (`add-ten-button`, `_addTen`) was added by #119 (merged as #120, with `test/add_ten_test.dart`). The three new buttons replicate it.

## Decisions

- Each button is a `TextButton` placed after "Add 10" in the same column, with keys `add-twenty-button`, `add-thirty-button`, `add-forty-button`.
- Each button has its own widget test file under `test/`, following `test/add_ten_test.dart`.
- Replication follows the recipe in `tasks.md`, with the merged change of the pattern (#119) as the template.

## Assumptions

- The keys and test file names follow the naming of the "Add 10" button.
- No new dependencies are needed.
