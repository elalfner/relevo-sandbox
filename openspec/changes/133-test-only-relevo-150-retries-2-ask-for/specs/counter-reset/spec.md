## MODIFIED Requirements

### Requirement: Reset button
The counter screen SHALL show a text button labelled "Reset" with the key `reset-button`, placed below the counter text. Tapping it SHALL set the counter to 0 at once when the counter is below 10. When the counter is 10 or more, tapping it SHALL open a confirmation dialog, and the counter SHALL be set to 0 only if the person confirms.

#### Scenario: Reset a non-zero counter
- **WHEN** the counter shows 5 and the user taps the reset button
- **THEN** the counter shows 0

#### Scenario: Reset a zero counter
- **WHEN** the counter shows 0 and the user taps the reset button
- **THEN** the counter still shows 0

#### Scenario: Reset a very large counter
- **WHEN** the counter shows a value over 1000 and the user taps the reset button and confirms
- **THEN** the counter shows 0

#### Scenario: Rapid double tap on reset
- **WHEN** the user taps the reset button twice in quick succession
- **THEN** the counter shows 0 and nothing breaks

#### Scenario: Reset asks for confirmation at 10 or more
- **WHEN** the counter is 12 and the person taps Reset
- **THEN** a dialog shows the text "Reset the counter of 12?" with the buttons Cancel and Confirm, and the counter is still 12

#### Scenario: Confirm resets the counter
- **WHEN** the dialog is open and the person taps Confirm
- **THEN** the dialog closes and the counter shows 0

#### Scenario: Cancel keeps the counter
- **WHEN** the dialog is open and the person taps Cancel, or dismisses it with the back button
- **THEN** the dialog closes and the counter is still 12

#### Scenario: Below 10 no dialog
- **WHEN** the counter is 9 and the person taps Reset
- **THEN** no dialog opens and the counter shows 0

#### Scenario: Counter is exactly 10
- **WHEN** the counter is 10 and the person taps Reset
- **THEN** the dialog opens

#### Scenario: Counter is 100 or more
- **WHEN** the counter is 100 or more and the person taps Reset
- **THEN** the dialog names the whole number
