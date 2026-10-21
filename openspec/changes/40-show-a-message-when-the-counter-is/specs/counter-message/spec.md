# Spec Delta

## Purpose

Shows a short celebratory message under the counter when its value is exactly twenty-three, so the person gets feedback at that number.

## ADDED Requirements

### Requirement: Message at twenty-three
The system SHALL show the text "Twenty-three!" under the counter only while the counter value is 23.

#### Scenario: Counter shows 23
- **WHEN** the counter shows 23
- **THEN** the text "Twenty-three!" is visible under the counter

#### Scenario: Counter shows another value
- **WHEN** the counter shows any value other than 23
- **THEN** no "Twenty-three!" text is visible

#### Scenario: Counter goes from 23 to 24
- **WHEN** the counter changes from 23 to 24
- **THEN** the "Twenty-three!" text disappears

#### Scenario: Counter starts at 0
- **WHEN** the screen is first shown with the counter at 0
- **THEN** no "Twenty-three!" text is visible
