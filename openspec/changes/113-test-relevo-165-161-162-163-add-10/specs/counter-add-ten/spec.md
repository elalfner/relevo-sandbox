## Purpose
The home screen offers an "Add 10" button so a person can raise the counter by 10 with one tap.

## ADDED Requirements

### Requirement: Add 10 button
The home screen SHALL show a button labelled "Add 10" that adds 10 to the counter each time it is tapped.

#### Scenario: Add 10 from zero
- **WHEN** the counter shows 0 and the person taps "Add 10"
- **THEN** the counter shows 10

#### Scenario: Add 10 from three
- **WHEN** the counter shows 3 and the person taps "Add 10"
- **THEN** the counter shows 13

#### Scenario: Greeting and parity keep working
- **WHEN** the person has tapped "Add 10"
- **THEN** the greeting is still shown and the even or odd text matches the new counter value
