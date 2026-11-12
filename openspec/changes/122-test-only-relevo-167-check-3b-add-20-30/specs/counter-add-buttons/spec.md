# Spec Delta

## Purpose

Lets the person add 20, 30 or 40 to the counter with a single tap, in the same way the "Add 10" button does.

## ADDED Requirements

### Requirement: Add 20 button
The home screen SHALL show an "Add 20" button that adds 20 to the counter.

#### Scenario: Add 20 from zero
- **WHEN** the counter shows 0 and the person taps "Add 20"
- **THEN** the counter shows 20

### Requirement: Add 30 button
The home screen SHALL show an "Add 30" button that adds 30 to the counter.

#### Scenario: Add 30 from zero
- **WHEN** the counter shows 0 and the person taps "Add 30"
- **THEN** the counter shows 30

### Requirement: Add 40 button
The home screen SHALL show an "Add 40" button that adds 40 to the counter.

#### Scenario: Add 40 from zero
- **WHEN** the counter shows 0 and the person taps "Add 40"
- **THEN** the counter shows 40

### Requirement: Existing controls keep working
The "Add 10" button and the greeting SHALL keep working as before.

#### Scenario: Add 10 still works
- **WHEN** the counter shows 0 and the person taps "Add 10"
- **THEN** the counter shows 10

#### Scenario: Greeting still shown
- **WHEN** the home screen is shown
- **THEN** the greeting is still shown
