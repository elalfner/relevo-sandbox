# Design

## Context

The caption is a `const Text` in the counter screen of `lib/main.dart`. `test/greeting_test.dart` finds it by its text. See proposal.md.

## Goals / Non-Goals

**Goals:**
- Replace the caption text and update the checks that read it.

**Non-Goals:**
- Any other text, layout or behaviour of the counter screen.

## Decisions

- Change the string in place; keep the widget, so layout and overflow behaviour are unchanged ("Times pressed:" is shorter than the old text).

## Risks / Trade-offs

- A missed reference to the old text would fail a test: search `lib/` and `test/` for the old string.

## Assumptions

- The other `home-greeting` requirement text is untouched except for the caption it names.
## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `lib/main.dart`: the counter screen, where the text lives.
- `test/widget_test.dart`: the counter checks that read the text.
