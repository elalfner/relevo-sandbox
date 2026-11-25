## ADDED Requirements

### Requirement: Reset leaves the rest of the home screen working
After a reset, the greeting and the even or odd text on the home screen SHALL keep working.

#### Scenario: Reset from 3
- **WHEN** the counter shows 3 and the person taps "Reset"
- **THEN** the counter shows 0

#### Scenario: Reset at 0
- **WHEN** the counter shows 0 and the person taps "Reset"
- **THEN** the counter still shows 0

#### Scenario: Greeting after a reset
- **WHEN** the person taps "Reset"
- **THEN** the greeting is still shown and unchanged

#### Scenario: Even or odd text after a reset
- **WHEN** the counter shows 3 and the person taps "Reset"
- **THEN** the even or odd text says "Even"
