## Purpose
The home screen offers buttons that add a fixed number to the counter in one tap.

## ADDED Requirements

### Requirement: Add 11 button
The home screen SHALL show a text button labelled "Add 11" that adds 11 to the counter.

#### Scenario: Add 11 from zero
- **WHEN** the counter shows 0 and the person taps "Add 11"
- **THEN** the counter shows 11

#### Scenario: Add 11 from three
- **WHEN** the counter shows 3 and the person taps "Add 11"
- **THEN** the counter shows 14

### Requirement: Add 13 button
The home screen SHALL show a text button labelled "Add 13" that adds 13 to the counter.

#### Scenario: Add 13 from zero
- **WHEN** the counter shows 0 and the person taps "Add 13"
- **THEN** the counter shows 13

#### Scenario: Add 13 from three
- **WHEN** the counter shows 3 and the person taps "Add 13"
- **THEN** the counter shows 16

### Requirement: Add 15 button
The home screen SHALL show a text button labelled "Add 15" that adds 15 to the counter.

#### Scenario: Add 15 from zero
- **WHEN** the counter shows 0 and the person taps "Add 15"
- **THEN** the counter shows 15

#### Scenario: Add 15 from three
- **WHEN** the counter shows 3 and the person taps "Add 15"
- **THEN** the counter shows 18

### Requirement: Existing controls keep working
The "Add 10" button and the greeting SHALL keep working.

#### Scenario: Add 10 still works
- **WHEN** the counter shows 0 and the person taps "Add 10"
- **THEN** the counter shows 10

#### Scenario: Greeting still shown
- **WHEN** the home screen is shown
- **THEN** the greeting is still shown
