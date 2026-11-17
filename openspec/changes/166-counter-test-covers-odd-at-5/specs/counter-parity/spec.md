# Spec Delta

## MODIFIED Requirements

### Requirement: Parity text
The counter screen SHALL show the text "Even" below the counter when the count is even, and "Odd" when it is odd.

#### Scenario: Even count
- **WHEN** the counter shows 2
- **THEN** a text "Even" is visible below the counter

#### Scenario: Odd count
- **WHEN** the counter shows 3
- **THEN** a text "Odd" is visible below the counter

#### Scenario: Odd count at five
- **WHEN** the user taps the add button five times
- **THEN** the counter shows 5 and the text says "Odd"

#### Scenario: Counter at zero
- **WHEN** the counter shows 0
- **THEN** the text says "Even"

#### Scenario: After reset
- **WHEN** the counter shows an odd value and the user taps the reset button
- **THEN** the text says "Even"
