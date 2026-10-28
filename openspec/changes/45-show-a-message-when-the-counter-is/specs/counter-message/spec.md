## ADDED Requirements

### Requirement: Twenty-seven message
The app SHALL show the text "Twenty-seven!" under the counter only while the counter value is exactly 27.

#### Scenario: Counter shows 27
- **WHEN** the counter shows 27
- **THEN** the text "Twenty-seven!" is visible under the counter

#### Scenario: Counter shows another value
- **WHEN** the counter shows any value other than 27
- **THEN** no "Twenty-seven!" text is visible

#### Scenario: Counter goes from 27 to 28
- **WHEN** the counter goes from 27 to 28
- **THEN** the message disappears

#### Scenario: Counter starts at 0
- **WHEN** the app starts with the counter at 0
- **THEN** no message is shown
