# Design

## Context

The home screen is `MyHomePage` in `lib/main.dart`; its body is a Column that holds the counter text, the parity text and the reset button. See proposal.md.

## Goals / Non-Goals

**Goals:** show a constant hint under the counter.

**Non-Goals:** translating the text (out of scope).

## Decisions

Add a const `Text('Tap the button to count', key: Key('hint-text'))` right after the counter text. It is static, so it survives every rebuild.

## Risks / Trade-offs

None; the text is static.

## Assumptions

- "Under the counter" means directly below the counter number in the Column.
- The text is English only and not localised.
