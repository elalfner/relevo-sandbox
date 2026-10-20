## ADDED Requirements

### Requirement: Ten reached message
The counter screen SHALL show the text "Ten reached" with the key `ten-text` directly under the parity text when the counter is ten or more, and SHALL NOT show it otherwise. It uses the same style as the parity text, has no animation, is on one line and is truncated with an ellipsis instead of overflowing on a very small screen.

#### Scenario: Counter reaches ten
- **WHEN** the counter is ten or more
- **THEN** the text "Ten reached" is shown under the parity text

#### Scenario: Counter is nine or less
- **WHEN** the counter is nine or less
- **THEN** no such text is shown

#### Scenario: Reset after reaching ten
- **WHEN** the user taps reset after reaching ten
- **THEN** the text disappears

#### Scenario: Counter exactly ten
- **WHEN** the counter is exactly 10
- **THEN** the text is shown

#### Scenario: Counter nine
- **WHEN** the counter is 9
- **THEN** the text is not shown

#### Scenario: Very small screen
- **WHEN** the screen is very small and the text is shown
- **THEN** the text is on one line, truncated with an ellipsis, and does not overflow
