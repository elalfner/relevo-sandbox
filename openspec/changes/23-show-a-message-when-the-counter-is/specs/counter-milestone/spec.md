## ADDED Requirements

### Requirement: Five reached message
The counter screen SHALL show the text "Five reached" under the parity text when the counter is exactly five, and SHALL NOT show it for any other value.

#### Scenario: Counter is five
- **WHEN** the counter is exactly five
- **THEN** the text "Five reached" is shown under the parity text

#### Scenario: Counter is not five
- **WHEN** the counter is anything other than five
- **THEN** no such text is shown

#### Scenario: Counter is four or six
- **WHEN** the counter is 4 or 6
- **THEN** the text "Five reached" is not shown

#### Scenario: Reset after five
- **WHEN** the user taps reset after reaching five
- **THEN** the text "Five reached" disappears
