# Spec Delta

## Purpose

Gives the user feedback on the current count by showing whether it is even or odd below the counter.

## ADDED Requirements

### Requirement: Parity text
The counter screen SHALL show the text "Even" below the counter when the count is even, and "Odd" when it is odd.

#### Scenario: Even count
- **WHEN** the counter shows 2
- **THEN** a text "Even" is visible below the counter

#### Scenario: Odd count
- **WHEN** the counter shows 3
- **THEN** a text "Odd" is visible below the counter

#### Scenario: Counter at zero
- **WHEN** the counter shows 0
- **THEN** the text says "Even"

#### Scenario: After reset
- **WHEN** the counter shows an odd value and the user taps the reset button
- **THEN** the text says "Even"
