## ADDED Requirements

### Requirement: Greeting is checked in the middle of the morning window
The greeting test SHALL include a case that opens the app at 06:00 on an injected clock and expects "Good morning", alongside the existing cases.

#### Scenario: Morning at 06:00
- **WHEN** the app opens at 06:00
- **THEN** the greeting reads "Good morning"

#### Scenario: Existing cases unchanged
- **WHEN** the new case runs with the others
- **THEN** every existing case still passes, unchanged
