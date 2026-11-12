## MODIFIED Requirements

### Requirement: Reset button
The counter screen SHALL show a text button labelled "Reset" with the key `reset-button`, placed below the counter text. Tapping it SHALL set the counter to 0. The greeting and the even or odd text SHALL keep working after a reset.

#### Scenario: Reset a non-zero counter
- **WHEN** the counter shows 3 and the user taps "Reset"
- **THEN** the counter shows 0

#### Scenario: Reset a zero counter
- **WHEN** the counter shows 0 and the user taps "Reset"
- **THEN** the counter still shows 0

#### Scenario: Reset a very large counter
- **WHEN** the counter shows a value over 1000 and the user taps the reset button
- **THEN** the counter shows 0

#### Scenario: Rapid double tap on reset
- **WHEN** the user taps the reset button twice in quick succession
- **THEN** the counter shows 0 and nothing breaks

#### Scenario: Greeting and parity after a reset
- **WHEN** the user taps "Reset" after incrementing the counter
- **THEN** the greeting is unchanged and the even or odd text shows "Even"
