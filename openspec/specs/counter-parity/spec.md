# counter-parity Specification

## Purpose
TBD - created by archiving change 2-show-even-or-odd-under-the-counter. Update Purpose after archive.
## Requirements
### Requirement: Parity text
The counter screen SHALL show the text "Even" below the counter when the count is even, and "Odd" when it is odd.

#### Scenario: Even count
- **WHEN** the counter shows 2
- **THEN** a text "Even" is visible below the counter

#### Scenario: Odd count
- **WHEN** the counter shows 3
- **THEN** a text "Odd" is visible below the counter

#### Scenario: Counter at zero
- **WHEN** the counter shows 0
- **THEN** the text says "Even"

#### Scenario: After reset
- **WHEN** the counter shows an odd value and the user taps the reset button
- **THEN** the text says "Even"

