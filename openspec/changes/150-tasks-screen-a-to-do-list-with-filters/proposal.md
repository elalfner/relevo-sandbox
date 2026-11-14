# Proposal

## Why

The app has no place to keep a short to-do list. A Tasks screen lets the person add, complete, filter, sort and delete tasks with undo, in memory only.

## What Changes

- A Tasks button on the home screen opens a new Tasks screen.
- The screen has a header that counts the tasks, filter chips (All, Open, Done), a sort menu, the list and an Add button with a bottom sheet.
- Titles are validated (not empty, at most 60 characters, no duplicate ignoring case and edge spaces).
- Swipe to delete with a snackbar Undo.
- Glossary entries for Task, Task filter and Priority.

## Capabilities

### New Capabilities
- `tasks-screen`: the in-memory to-do list screen with add, complete, filter, sort and delete with undo.

### Modified Capabilities

## Impact

- `lib/main.dart` (Tasks button), new files under `lib/models`, `lib/state`, `lib/screens`, `lib/widgets`, new tests under `test/`, `GLOSSARY.md`. No new dependency.
