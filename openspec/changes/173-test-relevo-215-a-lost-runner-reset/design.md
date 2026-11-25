## Context

The home screen (`lib/main.dart`) already has a `TextButton` labelled "Reset" (key `reset-button`) that sets the counter to 0. The greeting is chosen once in `initState`, so a reset cannot change it. The parity text is derived from the counter.

## Decisions

- No production change: the behaviour in the issue is already implemented and covered, except the greeting after a reset.
- Add one widget test for the greeting after a reset, in `test/widget_test.dart`.

## Assumptions

- The sandbox base (`dev`) already contains the feature from an earlier change; this issue is built on top of it as a test of the workflow.
- "Unchanged" for the greeting means the same text before and after the reset, with a fixed clock.
