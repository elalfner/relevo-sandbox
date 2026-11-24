# Spec Delta

## Purpose

Describes the counter screen behaviour that the four new test files check: the parity label, the caption, the tooltip of the floating button and the number after taps.

## ADDED Requirements

### Requirement: Parity label follows the counter
The counter screen SHALL show Even when the counter is even and Odd when it is odd.

#### Scenario: Label at 0, 1 and 2
- **WHEN** the screen is shown at 0, then tapped once, then tapped again
- **THEN** the label reads Even at 0, Odd at 1 and Even at 2

### Requirement: Caption is shown
The counter screen SHALL show the caption "You have pushed the button this many times:".

#### Scenario: Caption at the start and after a tap
- **WHEN** the screen is shown, and again after one tap
- **THEN** the caption is shown both times

### Requirement: Floating button tooltip
The floating button SHALL have the tooltip "Increment".

#### Scenario: Tooltip is found
- **WHEN** the screen is shown
- **THEN** the floating button with the tooltip "Increment" is found

### Requirement: Counter after three taps
The counter SHALL show 3 after three taps of the floating button.

#### Scenario: Three taps
- **WHEN** the floating button is tapped three times
- **THEN** the counter shows 3

### Requirement: New checks are safe to run
The new checks SHALL pass with the others, leave the existing checks unchanged and not depend on real time or the network.

#### Scenario: Run with the suite
- **WHEN** the new checks run with the others
- **THEN** they pass, and every existing check still passes, unchanged

#### Scenario: No real time or network
- **WHEN** the suite runs
- **THEN** it does not depend on the real time or on the network
