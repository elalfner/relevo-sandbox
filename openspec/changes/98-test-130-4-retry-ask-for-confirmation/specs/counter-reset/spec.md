## ADDED Requirements

### Requirement: Confirm before resetting a large counter
Tapping Reset with a counter of 10 or more SHALL open a dialog that names the count and offers Cancel and Confirm. The counter SHALL be reset only on Confirm. Below 10 the counter SHALL be reset at once.

#### Scenario: Dialog opens for a large counter
- **WHEN** the counter is 12 and the person taps Reset
- **THEN** a dialog shows the text "Reset the counter of 12?" with the buttons Cancel and Confirm, and the counter is still 12

#### Scenario: Confirm resets the counter
- **WHEN** the dialog is open and the person taps Confirm
- **THEN** the dialog closes and the counter shows 0

#### Scenario: Cancel or back keeps the counter
- **WHEN** the dialog is open and the person taps Cancel, or dismisses it with the back button
- **THEN** the dialog closes and the counter is still 12

#### Scenario: Small counter resets at once
- **WHEN** the counter is 9 and the person taps Reset
- **THEN** no dialog opens and the counter shows 0

#### Scenario: Counter of exactly 10
- **WHEN** the counter is 10 and the person taps Reset
- **THEN** the dialog opens

#### Scenario: Counter of 100 or more
- **WHEN** the counter is 100 or more and the person taps Reset
- **THEN** the dialog names the whole number
