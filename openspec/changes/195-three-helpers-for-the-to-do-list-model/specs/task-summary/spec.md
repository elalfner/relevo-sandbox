# Spec Delta

## Purpose

Describes a task in one line with its title, priority and state, for use by the to-do list model.

## ADDED Requirements

### Requirement: One-line task summary
The system SHALL return one line for a task in the form `<title> (<priority>, <done|pending>)`.

#### Scenario: Done task
- **WHEN** the summary of a done task titled `Buy milk` with high priority is asked
- **THEN** it is `Buy milk (high, done)`

#### Scenario: Pending task
- **WHEN** the summary of a task that is not done is asked
- **THEN** its line says `pending` instead of `done`
