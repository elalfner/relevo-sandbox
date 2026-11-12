## Context

The home screen is `MyHomePage` in `lib/main.dart`; it renders a Column with the counter text. The hint is a const `Text` placed right after the counter text, with a key `hint-text`. It does not depend on state, so it stays on every rebuild.

## Assumptions

- The text is not translated (out of scope), and is a fixed English string.
- Placed directly under the counter number, before the parity text.
