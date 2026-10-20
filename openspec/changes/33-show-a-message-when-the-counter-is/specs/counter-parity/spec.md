## ADDED Requirements

### Requirement: Fifteen message
The counter screen SHALL show the text "Fifteen reached" under the parity text when the counter is exactly fifteen, and SHALL NOT show it for any other value.

#### Scenario: Counter is fifteen
- **WHEN** the counter is exactly fifteen
- **THEN** the text "Fifteen reached" is shown under the parity text

#### Scenario: Counter is not fifteen
- **WHEN** the counter is anything other than fifteen
- **THEN** no such text is shown

#### Scenario: Neighbouring values
- **WHEN** the counter is 14 or 16
- **THEN** the text "Fifteen reached" is not shown

#### Scenario: Reset after fifteen
- **WHEN** the counter is fifteen and the user taps reset
- **THEN** the text "Fifteen reached" disappears
