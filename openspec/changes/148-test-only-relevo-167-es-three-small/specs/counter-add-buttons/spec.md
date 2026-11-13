# Spec Delta

## Purpose

Lets the person add a larger fixed amount to the counter with a single tap, through the buttons "Add 31", "Add 33" and "Add 35" on the home screen.

## ADDED Requirements

### Requirement: Add 31 button
The home screen SHALL show a button labelled "Add 31" that adds 31 to the counter.

#### Scenario: Add 31 from zero
- **WHEN** the counter shows 0 and the person taps "Add 31"
- **THEN** the counter shows 31

#### Scenario: Add 31 from three
- **WHEN** the counter shows 3 and the person taps "Add 31"
- **THEN** the counter shows 34

### Requirement: Add 33 button
The home screen SHALL show a button labelled "Add 33" that adds 33 to the counter.

#### Scenario: Add 33 from zero
- **WHEN** the counter shows 0 and the person taps "Add 33"
- **THEN** the counter shows 33

#### Scenario: Add 33 from three
- **WHEN** the counter shows 3 and the person taps "Add 33"
- **THEN** the counter shows 36

### Requirement: Add 35 button
The home screen SHALL show a button labelled "Add 35" that adds 35 to the counter.

#### Scenario: Add 35 from zero
- **WHEN** the counter shows 0 and the person taps "Add 35"
- **THEN** the counter shows 35

#### Scenario: Add 35 from three
- **WHEN** the counter shows 3 and the person taps "Add 35"
- **THEN** the counter shows 38

### Requirement: Existing controls keep working
The "Add 10" button and the greeting SHALL keep working as before.

#### Scenario: Add 10 and greeting unaffected
- **WHEN** the home screen is shown and the person taps "Add 10"
- **THEN** the greeting is still shown and the counter shows 10
