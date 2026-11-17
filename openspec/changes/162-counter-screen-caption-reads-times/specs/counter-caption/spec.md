# Spec Delta

## Purpose

Defines the caption shown above the counter value on the counter screen, so the screen reads clearly.

## ADDED Requirements

### Requirement: Counter caption text
The counter screen SHALL show the caption "Times pressed:" on the line above the counter value, and SHALL NOT show the previous caption.

#### Scenario: Caption on opening
- **WHEN** the app opens on the counter screen
- **THEN** the line above the counter reads "Times pressed:"

#### Scenario: Caption after the counter changes
- **WHEN** the counter changes
- **THEN** the line above the counter still reads "Times pressed:", and nothing else on the screen changes

### Requirement: Caption fits a small screen
The caption SHALL fit on a very small screen without overflow, and the counter value and the Even or Odd label SHALL keep working as before.

#### Scenario: Small screen
- **WHEN** the counter screen is shown on a very small screen
- **THEN** the caption is shown without overflow

#### Scenario: Counter and label unchanged
- **WHEN** the counter changes
- **THEN** the counter value and the Even or Odd label update as they did before
