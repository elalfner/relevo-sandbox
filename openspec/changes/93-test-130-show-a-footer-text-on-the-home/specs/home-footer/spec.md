## ADDED Requirements

### Requirement: Home screen footer text
The home screen SHALL show the text "Relevo test" at the bottom.

#### Scenario: Footer shown at start
- **WHEN** the app starts
- **THEN** the home screen shows the text "Relevo test" at the bottom

#### Scenario: Footer unchanged when the counter changes or is reset
- **WHEN** the counter is incremented or reset
- **THEN** the footer text "Relevo test" stays the same
