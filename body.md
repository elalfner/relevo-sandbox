## Summary

Test issue for the Relevo workflow templates (relevo#160), small on purpose. The home screen lets a person put the counter back to zero with a button.

## Outcome

A button labelled "Reset" on the home screen sets the counter to 0.

## Scenarios

- **WHEN** the counter shows 3 and the person taps "Reset"
- **THEN** the counter shows 0

- **WHEN** the counter shows 0 and the person taps "Reset"
- **THEN** the counter still shows 0

## Edge cases

- The greeting and the even or odd text: they keep working after a reset.

## Out of scope

- Asking for a confirmation before the reset.
- Saving the counter between sessions.

