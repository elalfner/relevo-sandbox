# counter-thirty-one Specification

## Purpose
TBD - created by archiving change 63-show-a-message-when-the-counter-is. Update Purpose after archive.

## Requirements

### Requirement: Thirty-one message
The app SHALL show the text "Thirty-one!" under the counter only while the counter value is exactly 31.

#### Scenario: Counter shows 31
- **WHEN** the counter shows 31
- **THEN** the text "Thirty-one!" is visible under the counter

#### Scenario: Counter shows another value
- **WHEN** the counter shows any value other than 31
- **THEN** no "Thirty-one!" text is visible

#### Scenario: Counter goes from 31 to 32
- **WHEN** the counter goes from 31 to 32
- **THEN** the message disappears

#### Scenario: Counter starts at 0
- **WHEN** the screen is first shown with the counter at 0
- **THEN** no "Thirty-one!" text is visible
