## Purpose
Buttons on the home screen that add a fixed number to the counter, so the person can move it in larger steps.

## ADDED Requirements

### Requirement: Add 20 button
The home screen SHALL show an "Add 20" button that adds 20 to the counter.

#### Scenario: Add 20 from zero
- **WHEN** the counter shows 0 and the person taps "Add 20"
- **THEN** the counter shows 20

#### Scenario: Add 20 from three
- **WHEN** the counter shows 3 and the person taps "Add 20"
- **THEN** the counter shows 23

### Requirement: Add 30 button
The home screen SHALL show an "Add 30" button that adds 30 to the counter.

#### Scenario: Add 30 from zero
- **WHEN** the counter shows 0 and the person taps "Add 30"
- **THEN** the counter shows 30

#### Scenario: Add 30 from three
- **WHEN** the counter shows 3 and the person taps "Add 30"
- **THEN** the counter shows 33

### Requirement: Add 40 button
The home screen SHALL show an "Add 40" button that adds 40 to the counter.

#### Scenario: Add 40 from zero
- **WHEN** the counter shows 0 and the person taps "Add 40"
- **THEN** the counter shows 40

#### Scenario: Add 40 from three
- **WHEN** the counter shows 3 and the person taps "Add 40"
- **THEN** the counter shows 43

### Requirement: Existing controls keep working
The "Add 10" button and the greeting SHALL keep working.

#### Scenario: Add 10 and greeting unchanged
- **WHEN** the home screen is shown and the person taps "Add 10"
- **THEN** the counter grows by 10 and the greeting is still shown
