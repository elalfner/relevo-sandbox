# Spec Delta

## Purpose

Defines the text of the tooltip of the floating button on the counter screen, so the screen reads clearly.

## ADDED Requirements

### Requirement: Floating button tooltip reads Add one
The tooltip of the floating button on the counter screen SHALL read "Add one", and no other text of the screen SHALL change.

#### Scenario: Tooltip on opening
- **WHEN** the app opens on the counter screen
- **THEN** the tooltip of the floating button reads "Add one"

#### Scenario: Tooltip after the counter changes
- **WHEN** the counter changes
- **THEN** the tooltip of the floating button still reads "Add one", and nothing else on the screen changes

#### Scenario: Small screen
- **WHEN** the screen is very small
- **THEN** the screen shows without overflow

#### Scenario: Counter behaviour unchanged
- **WHEN** the counter changes
- **THEN** the counter value and the Even or Odd label work as before
