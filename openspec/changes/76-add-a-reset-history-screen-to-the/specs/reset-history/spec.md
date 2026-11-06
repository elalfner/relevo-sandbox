# Spec Delta

## Purpose

Lets the person see, during the current session, the values the counter had each time they tapped Reset, and clear that list.

## ADDED Requirements

### Requirement: Reset records the previous value
The system SHALL add the value the counter had to the top of the reset history when the person taps Reset, unless the value is 0.

#### Scenario: Reset adds the value
- **WHEN** the counter is 7 and the person taps Reset
- **THEN** the counter shows 0 and the value 7 is added at the top of the history

#### Scenario: Reset at zero adds nothing
- **WHEN** the counter is 0 and the person taps Reset
- **THEN** nothing is added to the history

#### Scenario: Repeated values are separate rows
- **WHEN** the same value is reset several times in a row
- **THEN** each reset is its own row

### Requirement: History is limited to 20 values
The system SHALL keep only the 20 newest values in the reset history.

#### Scenario: Oldest value is dropped
- **WHEN** more than 20 resets have happened
- **THEN** only the 20 newest values are kept and the oldest is dropped

### Requirement: History screen lists the values
The system SHALL provide a History button in the app bar of the home screen, with the accessible name "History" and a touch target of at least 48 dp, that opens a History screen listing the stored values newest first, one per row, each reading "Reset at <value>".

#### Scenario: Open the History screen
- **WHEN** the person taps the History button in the app bar
- **THEN** the History screen opens and lists the stored values, newest first, one per row, each row reading "Reset at <value>"

#### Scenario: Empty history
- **WHEN** the History screen opens and there are no stored values
- **THEN** it shows the text "No resets yet" and no list

#### Scenario: Going back keeps the counter
- **WHEN** the person goes back from the History screen
- **THEN** the home screen shows the same counter value it had before

### Requirement: History can be cleared
The system SHALL show a "Clear history" button on the History screen only when the list has at least one value, and tapping it SHALL empty the list at once.

#### Scenario: Clear history
- **WHEN** the person taps "Clear history" on the History screen
- **THEN** the list is emptied at once and the screen shows "No resets yet"

#### Scenario: Clear button hidden when empty
- **WHEN** the history has no values
- **THEN** "Clear history" is not shown
