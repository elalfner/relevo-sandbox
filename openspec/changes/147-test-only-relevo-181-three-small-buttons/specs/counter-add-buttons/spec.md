## ADDED Requirements

### Requirement: Add 21 button
The home screen SHALL show a text button labelled "Add 21" with the key `add-21-button`. Tapping it SHALL add 21 to the counter.

#### Scenario: Add 21 from 0
- **WHEN** the counter shows 0 and the person taps "Add 21"
- **THEN** the counter shows 21

#### Scenario: Add 21 from 3
- **WHEN** the counter shows 3 and the person taps "Add 21"
- **THEN** the counter shows 24

### Requirement: Add 23 button
The home screen SHALL show a text button labelled "Add 23" with the key `add-23-button`. Tapping it SHALL add 23 to the counter.

#### Scenario: Add 23 from 0
- **WHEN** the counter shows 0 and the person taps "Add 23"
- **THEN** the counter shows 23

#### Scenario: Add 23 from 3
- **WHEN** the counter shows 3 and the person taps "Add 23"
- **THEN** the counter shows 26

### Requirement: Add 25 button
The home screen SHALL show a text button labelled "Add 25" with the key `add-25-button`. Tapping it SHALL add 25 to the counter.

#### Scenario: Add 25 from 0
- **WHEN** the counter shows 0 and the person taps "Add 25"
- **THEN** the counter shows 25

#### Scenario: Add 25 from 3
- **WHEN** the counter shows 3 and the person taps "Add 25"
- **THEN** the counter shows 28

### Requirement: Existing controls keep working
The "Add 10" button and the greeting SHALL keep working as before.

#### Scenario: Add 10 and greeting unaffected
- **WHEN** the home screen is shown and the person taps "Add 10"
- **THEN** the counter adds 10 and the greeting is still shown
