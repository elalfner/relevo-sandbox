## ADDED Requirements

### Requirement: Nineteen message
The counter screen SHALL show the text "Nineteen!" under the counter when its value is exactly 19, and no such text for any other value.

#### Scenario: Counter at nineteen
- **WHEN** the counter shows 19
- **THEN** the text "Nineteen!" is visible under the counter

#### Scenario: Counter at another value
- **WHEN** the counter shows any value other than 19
- **THEN** no "Nineteen!" text is visible

#### Scenario: Counter goes from 19 to 20
- **WHEN** the counter shows 19 and the value changes to 20
- **THEN** the "Nineteen!" text disappears

#### Scenario: Counter starts at zero
- **WHEN** the counter shows 0
- **THEN** no "Nineteen!" text is visible

#### Scenario: Matches the reference lib/main.dart
- **WHEN** the screen is shown
- **THEN** it matches `lib/main.dart` in keeping the existing counter layout and typography, with the message using the body text style
