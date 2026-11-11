## Purpose

The home screen shows a fixed header text above the counter, so the user sees it as soon as the app starts.

## ADDED Requirements

### Requirement: Home screen header text
The home screen SHALL show the text "Relevo header" at the top, above the counter.

#### Scenario: Header shown at start
- **WHEN** the app starts
- **THEN** the home screen shows the text "Relevo header" above the counter

#### Scenario: Header stays after the counter changes
- **WHEN** the counter is incremented or reset
- **THEN** the header text "Relevo header" stays the same
