## ADDED Requirements

### Requirement: Home screen label
The home screen SHALL show the text "Relevo 121 B" below the counter, and the label SHALL stay the same when the counter changes or is reset.

#### Scenario: Label shown at start
- **WHEN** the app starts
- **THEN** the home screen shows the text "Relevo 121 B" below the counter

#### Scenario: Label unchanged when the counter changes or is reset
- **WHEN** the counter changes or is reset
- **THEN** the label "Relevo 121 B" stays the same
