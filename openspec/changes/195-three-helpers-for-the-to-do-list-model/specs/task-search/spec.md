# Spec Delta

## Purpose

Finds the tasks of a list whose title contains a text, ignoring case, for use by the to-do list model.

## ADDED Requirements

### Requirement: Search tasks by title
The system SHALL return the tasks whose title contains a given text, ignoring case, keeping their order.

#### Scenario: Match ignoring case
- **WHEN** a list with the titles `Buy milk` and `Call home` is searched for `MILK`
- **THEN** only `Buy milk` is returned

#### Scenario: Empty text
- **WHEN** a list is searched for an empty text
- **THEN** every task is returned, in the same order
