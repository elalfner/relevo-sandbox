## MODIFIED Requirements

### Requirement: Reset button
The counter screen SHALL show a text button labelled "Reset counter" with the key `reset-button`, placed below the counter text. Tapping it SHALL set the counter to 0.

#### Scenario: Reset a non-zero counter
- **WHEN** the counter shows 5 and the user taps the reset button
- **THEN** the counter shows 0

#### Scenario: Reset a zero counter
- **WHEN** the counter shows 0 and the user taps the reset button
- **THEN** the counter still shows 0

#### Scenario: Reset a very large counter
- **WHEN** the counter shows a value over 1000 and the user taps the reset button
- **THEN** the counter shows 0

#### Scenario: Rapid double tap on reset
- **WHEN** the user taps the reset button twice in quick succession
- **THEN** the counter shows 0 and nothing breaks

#### Scenario: Label on open
- **WHEN** the app opens on the counter screen
- **THEN** the label of the Reset button reads "Reset counter"

#### Scenario: Label after the counter changes
- **WHEN** the counter changes
- **THEN** the label of the Reset button still reads "Reset counter", and nothing else on the screen changes

#### Scenario: Small screen
- **WHEN** the counter screen is shown on a very small screen
- **THEN** the label fits without overflow

#### Scenario: Counter and parity keep working
- **WHEN** the counter changes
- **THEN** the counter value and the Even or Odd label behave as before
