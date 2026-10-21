# Spec Delta

## Purpose

Gives the person using the app a small celebration by showing a message under the counter when its value is exactly twenty-one.

## ADDED Requirements

### Requirement: Twenty-one message
The system SHALL show the text "Twenty-one!" under the counter while its value is exactly 21, and SHALL NOT show it for any other value.

#### Scenario: Counter shows 21
- **WHEN** the counter shows 21
- **THEN** the text "Twenty-one!" is visible under the counter

#### Scenario: Counter shows another value
- **WHEN** the counter shows any value other than 21
- **THEN** no "Twenty-one!" text is visible

#### Scenario: Counter goes from 21 to 22
- **WHEN** the counter goes from 21 to 22
- **THEN** the message disappears

#### Scenario: Counter starts at 0
- **WHEN** the app starts with the counter at 0
- **THEN** no "Twenty-one!" text is visible
