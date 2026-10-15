# Proposal

## Why

The counter screen does not tell the user which version of the app they are running. Showing it helps with support and testing.

## What Changes

- Show the text "v1.0.0" as a subtitle in the app bar of the counter screen.
- On a very small screen the text is truncated with an ellipsis instead of overflowing.

## Capabilities

### New Capabilities
- `app-version`: the version text shown in the app bar subtitle.

### Modified Capabilities

## Impact

- `lib/main.dart`: the app bar title becomes the title plus a version subtitle.
- `test/widget_test.dart`: widget tests for the version text and the narrow-screen case.
