# Spec Delta

## Purpose
Lets the user return the counter to zero from the counter screen so they can start counting again.

## ADDED Requirements

### Requirement: Reset button
The counter screen SHALL show a text button labelled "Reset" with the key `reset-button`, placed below the counter text. Tapping it SHALL set the counter to 0.

#### Scenario: Reset a non-zero counter
- **WHEN** the counter shows 5 and the user taps the reset button
- **THEN** the counter shows 0

#### Scenario: Reset a zero counter
- **WHEN** the counter shows 0 and the user taps the reset button
- **THEN** the counter still shows 0

#### Scenario: Reset a very large counter
- **WHEN** the counter shows a value over 1000 and the user taps the reset button
- **THEN** the counter shows 0

#### Scenario: Rapid double tap on reset
- **WHEN** the user taps the reset button twice in quick succession
- **THEN** the counter shows 0 and nothing breaks
