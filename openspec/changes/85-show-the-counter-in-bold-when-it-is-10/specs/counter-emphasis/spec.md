# Spec Delta

## Purpose

Makes a counter of 10 or more stand out on the home screen by showing its number in bold.

## ADDED Requirements

### Requirement: Counter weight follows its value
The home screen SHALL show the counter number in bold when the counter is 10 or more, and in normal weight when it is below 10.

#### Scenario: Reaching 10
- **WHEN** the counter is 9 and the person taps the add button
- **THEN** the counter shows 10 in bold

#### Scenario: Reset
- **WHEN** the counter is 12 in bold and the person taps Reset
- **THEN** the counter shows 0 in normal weight

#### Scenario: Below 10
- **WHEN** the counter is 9
- **THEN** the number is in normal weight

#### Scenario: 100 or more
- **WHEN** the counter is 100 or more
- **THEN** the number stays in bold
