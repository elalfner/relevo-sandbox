# Spec Delta

## Purpose
Give the user feedback on the counter screen when the count is exactly seven.

## ADDED Requirements

### Requirement: Seven message
The counter screen SHALL show the text "Seven reached" under the parity text when the counter is exactly seven, and SHALL NOT show it for any other value.

#### Scenario: Counter is seven
- **WHEN** the counter is exactly seven
- **THEN** the text "Seven reached" is shown under the parity text

#### Scenario: Counter is not seven
- **WHEN** the counter is anything other than seven
- **THEN** no such text is shown

#### Scenario: Counter is six or eight
- **WHEN** the counter is 6 or 8
- **THEN** the text "Seven reached" is not shown

#### Scenario: Reset after seven
- **WHEN** the user taps reset after reaching seven
- **THEN** the text "Seven reached" disappears
