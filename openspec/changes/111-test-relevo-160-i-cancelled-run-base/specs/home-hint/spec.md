# Spec Delta

## Purpose

Tells the user how to use the counter with a short hint under the counter on the home screen.

## ADDED Requirements

### Requirement: Home screen shows a counter hint
The home screen SHALL show the text "Tap the button to count" under the counter.

#### Scenario: Hint visible on open
- **WHEN** the home screen opens
- **THEN** the text "Tap the button to count" is visible

#### Scenario: Hint stays after the counter changes
- **WHEN** the counter changes
- **THEN** the text "Tap the button to count" is still visible
