## ADDED Requirements

### Requirement: Add 5 button
The home screen SHALL show an "Add 5" button that adds 5 to the counter.

#### Scenario: Add 5 from zero
- **WHEN** the counter shows 0 and the person taps "Add 5"
- **THEN** the counter shows 5

#### Scenario: Add 5 from three
- **WHEN** the counter shows 3 and the person taps "Add 5"
- **THEN** the counter shows 8

### Requirement: Add 7 button
The home screen SHALL show an "Add 7" button that adds 7 to the counter.

#### Scenario: Add 7 from zero
- **WHEN** the counter shows 0 and the person taps "Add 7"
- **THEN** the counter shows 7

#### Scenario: Add 7 from three
- **WHEN** the counter shows 3 and the person taps "Add 7"
- **THEN** the counter shows 10

### Requirement: Add 9 button
The home screen SHALL show an "Add 9" button that adds 9 to the counter.

#### Scenario: Add 9 from zero
- **WHEN** the counter shows 0 and the person taps "Add 9"
- **THEN** the counter shows 9

#### Scenario: Add 9 from three
- **WHEN** the counter shows 3 and the person taps "Add 9"
- **THEN** the counter shows 12

### Requirement: Existing controls keep working
The "Add 10" button and the greeting SHALL keep working.

#### Scenario: Add 10 and greeting unchanged
- **WHEN** the person taps "Add 10" or opens the app
- **THEN** the counter grows by 10 and the greeting is shown as before
