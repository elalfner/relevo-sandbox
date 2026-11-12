# Spec Delta

## Purpose

Tells the user how to use the home screen by showing a short hint under the counter.

## ADDED Requirements

### Requirement: Home screen shows a hint under the counter
The home screen SHALL show the text "Tap the button to count" under the counter.

#### Scenario: Hint visible on open
- **WHEN** the home screen opens
- **THEN** the text "Tap the button to count" is visible

#### Scenario: Hint stays after the counter changes
- **WHEN** the counter changes
- **THEN** the text "Tap the button to count" is still visible
