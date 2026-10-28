# counter-milestone Specification

## Purpose
Show a short celebratory message under the counter when it reaches a milestone value, so the person using the app gets feedback at that number.

## ADDED Requirements

### Requirement: Twenty-five message
The counter screen SHALL show the text "Twenty-five!" under the counter when its value is exactly 25, and SHALL NOT show it for any other value.

#### Scenario: Counter at twenty-five
- **WHEN** the counter shows 25
- **THEN** the text "Twenty-five!" is visible under the counter

#### Scenario: Counter at another value
- **WHEN** the counter shows any value other than 25
- **THEN** no "Twenty-five!" text is visible

#### Scenario: Counter moves past twenty-five
- **WHEN** the counter goes from 25 to 26
- **THEN** the text "Twenty-five!" is no longer visible

#### Scenario: Counter starts at zero
- **WHEN** the counter shows 0 at start
- **THEN** no "Twenty-five!" text is visible
