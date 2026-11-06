# Design

## Context

`MyHomePage` in `lib/main.dart` holds `_counter` in its state and resets it in `_resetCounter`. See proposal.md for motivation.

## Goals / Non-Goals

**Goals:**
- Hold the history in the home screen state and show it in a separate screen file.

**Non-Goals:**
- Persistence, timestamps, deleting single rows.

## Decisions

- The state keeps a `List<int>` (newest first); `_resetCounter` inserts at index 0 when the counter is above 0 and trims to 20.
- `HistoryScreen` in `lib/screens/history_screen.dart` receives the values and a clear callback. Because the screen must update at once after clearing, it keeps a local copy of the list in its own state and calls the callback to clear the home state too.
- The History button is an `IconButton` (tooltip "History", default 48 dp target) in `AppBar.actions`.

## Risks / Trade-offs

- Local copy plus callback duplicates the list briefly → acceptable for a 20-item in-memory list.

## Assumptions

- A negative counter does not occur (the counter only increments); "not 0" is treated as "above 0 or any non-zero" and only 0 is skipped.
- The Reset history entry goes at the end of the existing `GLOSSARY.md` Language section.
## From the issue: Decisions

### D1. The history lives in memory
Decided: the history is a list held by the home screen state and passed to the History screen; it is lost when the app closes.
Why: it keeps the change small and needs no storage.
Discarded: shared_preferences (a new dependency for a value that is not asked to survive).

### D2. A new screen file
Decided: the History screen is a widget in `lib/screens/history_screen.dart`, opened with `Navigator.push`.
Why: the project rules ask for one screen per file under `lib/screens/`.
Discarded: a bottom sheet in `lib/main.dart` (it would grow that file and break the rule).

### D3. The term is Reset history
Decided: the glossary calls the list of values the Reset history.
Why: the glossary belongs to the app and the term says what it holds.
Discarded: log, record, timeline.

## From the issue: Constraints

- C1: The History button in the app bar has the accessible name "History" (tooltip and semantics label) and a touch target of at least 48 dp.
- C2: `_resetCounter` in `lib/main.dart` is the only place that adds to the history.
- C3: Widget tests under `test/` cover: a reset adds the value, a reset at 0 adds nothing, the 21st reset drops the oldest, the empty screen text, the order newest first, "Clear history", and going back keeps the counter.
- C4: No new dependency is added.

## From the issue: Code pointers

- `lib/main.dart`: `_resetCounter` is where the counter goes back to 0; the app bar of `MyHomePage` is where the History button goes.
- `test/widget_test.dart`: the existing counter tests, to follow in style.

## From the issue: Screens and behaviour

The History button is an icon button on the right of the app bar. The History screen has a back arrow, the title "History", the list of rows, and below it the "Clear history" text button when there is at least one row. The empty state shows "No resets yet" centred. Nothing else on the home screen moves.

## From the issue: Verification

- On an Android device or emulator, tap the add button a few times, tap Reset, repeat with another value, open History and check the order and the texts, then clear it.

## From the issue: Assumptions

- A1: The home screen already has an app bar with room for one more icon button.

## Documentation from the issue

- Add this entry to `GLOSSARY.md`, under its existing heading, after the existing ones, exactly as written. It is vocabulary only; nothing else in that file changes.

**Reset history**:
The in-memory list of the values the counter had at each Reset, newest first, kept up to 20.
_Avoid_: Log, record, timeline
