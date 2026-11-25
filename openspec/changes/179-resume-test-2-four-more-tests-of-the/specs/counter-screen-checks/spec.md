# Spec Delta

## Purpose

Pins the Even/Odd label, the caption, the floating button tooltip and the count after three taps of the counter screen with their own checks.

## ADDED Requirements

### Requirement: Extra checks of the counter screen pass with the suite
The checks for the Even and Odd label, the caption, the tooltip of the floating button and the number shown after three taps SHALL pass when run with the other checks, and every existing check SHALL still pass, unchanged.

#### Scenario: New checks run with the others
- **WHEN** the new checks run with the others
- **THEN** they pass, and every existing check still passes, unchanged

#### Scenario: Label parity at 0, 1 and 2
- **WHEN** the counter shows 0, 1 and then 2
- **THEN** the label reads Even, Odd and Even

#### Scenario: Caption at the start and after a tap
- **WHEN** the screen is shown, and again after one tap
- **THEN** the caption "You have pushed the button this many times:" is shown both times

#### Scenario: Tooltip of the floating button
- **WHEN** the floating button is looked up by its tooltip
- **THEN** the tooltip "Increment" is found

#### Scenario: Three taps
- **WHEN** the floating button is tapped three times
- **THEN** the counter shows 3

### Requirement: The checks are deterministic
The checks SHALL NOT depend on the real time or on the network.

#### Scenario: Suite runs offline and at any time
- **WHEN** the suite runs
- **THEN** it does not depend on the real time or on the network
