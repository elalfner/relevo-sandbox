# Spec Delta

## Purpose

The home screen shows a fixed section title below the counter, so the screen has a labelled section.

## ADDED Requirements

### Requirement: Home screen shows a section title
The home screen SHALL show the text "Relevo section" below the counter.

#### Scenario: Section title shown at start
- **WHEN** the app starts
- **THEN** the home screen shows the text "Relevo section" below the counter

#### Scenario: Section title stays after the counter changes or is reset
- **WHEN** the counter changes or is reset
- **THEN** the text "Relevo section" stays the same and below the counter
