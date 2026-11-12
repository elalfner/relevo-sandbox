# Spec Delta

## Purpose

Lets the person change the home screen counter in larger steps with three independent buttons, besides the existing increment and reset.

## ADDED Requirements

### Requirement: Add 5 button
The home screen SHALL show a button labelled "Add 5". Tapping it SHALL increase the counter by 5.

#### Scenario: Add 5 to the counter
- **WHEN** the counter shows 2 and the person taps "Add 5"
- **THEN** the counter shows 7

### Requirement: Subtract 1 button
The home screen SHALL show a button labelled "Subtract 1". Tapping it SHALL decrease the counter by 1.

#### Scenario: Subtract 1 from the counter
- **WHEN** the counter shows 7 and the person taps "Subtract 1"
- **THEN** the counter shows 6

### Requirement: Double button
The home screen SHALL show a button labelled "Double". Tapping it SHALL multiply the counter by 2.

#### Scenario: Double the counter
- **WHEN** the counter shows 6 and the person taps "Double"
- **THEN** the counter shows 12

### Requirement: Other texts keep working
The greeting and the even or odd text SHALL keep working after each of the three buttons is used.

#### Scenario: Parity text after Add 5
- **WHEN** the counter shows 2 and the person taps "Add 5"
- **THEN** the even or odd text shows "Odd" and the greeting is still shown

#### Scenario: Parity text after Subtract 1
- **WHEN** the counter shows 7 and the person taps "Subtract 1"
- **THEN** the even or odd text shows "Even" and the greeting is still shown

#### Scenario: Parity text after Double
- **WHEN** the counter shows 6 and the person taps "Double"
- **THEN** the even or odd text shows "Even" and the greeting is still shown
