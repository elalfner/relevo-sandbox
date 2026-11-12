## Context

`lib/main.dart` has `_addTen` and a `TextButton` keyed `add-ten-button` in the home screen column. This change follows that pattern.

## Decisions

- Add `_addTwenty`, `_addThirty` and `_addForty` handlers next to `_addTen`, and `TextButton`s keyed `add-twenty-button`, `add-thirty-button` and `add-forty-button` right after "Add 10".
- No new dependencies.

## Assumptions

- Button order is Reset, Add 10, Add 20, Add 30, Add 40.
- The home screen stays scrollable, so the extra buttons fit on small screens.
