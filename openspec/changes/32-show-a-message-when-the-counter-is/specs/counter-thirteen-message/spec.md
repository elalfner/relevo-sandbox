## ADDED Requirements

### Requirement: Message at thirteen
The counter screen SHALL show the text "Thirteen reached" under the parity text when the counter is exactly thirteen, and SHALL NOT show it otherwise.

#### Scenario: Counter is thirteen
- **WHEN** the counter is exactly thirteen
- **THEN** the text "Thirteen reached" is shown under the parity text

#### Scenario: Counter is not thirteen
- **WHEN** the counter is anything other than thirteen
- **THEN** no such text is shown

#### Scenario: Counter is twelve or fourteen
- **WHEN** the counter is 12 or 14
- **THEN** the text "Thirteen reached" is not shown

#### Scenario: Reset after thirteen
- **WHEN** the user taps reset after reaching thirteen
- **THEN** the text "Thirteen reached" disappears
