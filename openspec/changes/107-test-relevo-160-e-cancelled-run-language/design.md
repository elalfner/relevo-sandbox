## Context

The home screen is `MyHomePage` in `lib/main.dart`; it shows the greeting, a label, the counter, the parity text and a reset button in a column.

## Decisions

- Add a constant `Text('Tap the button to count', key: Key('hint-text'))` in the column directly after the counter text. It is static, so it stays when the counter changes.
- No new dependencies.

## Assumptions

- "Under the counter" means directly after the counter number in the column, before the parity text.
- The text is English only (translation is out of scope).
