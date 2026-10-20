## Context

The counter screen is `MyHomePage` in `lib/main.dart`. The parity text (key `parity-text`) is a plain `Text` in the body `Column`. See proposal.md.

## Decisions

- Add `if (_counter >= 10) const Text('Ten reached', key: Key('ten-text'), maxLines: 1, overflow: TextOverflow.ellipsis)` right after the parity text. No style argument, so it inherits the same default style as the parity text. No animation widget, so it appears and disappears at once.
- Derived from `_counter`, so reset hides it with no extra state.

## Assumptions

- "Same style as the parity text" means the parity text's style, which is the default text style (no explicit style).
- The change adds no new dependency.

## Risks / Trade-offs

- None significant.
