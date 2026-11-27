# Spec Delta

## Purpose

Small pure helpers that let the app count, search, describe and order the tasks of the to-do list model.

## ADDED Requirements

### Requirement: Count pending and done tasks
The system SHALL count the pending tasks and the done tasks of a list of tasks.

#### Scenario: Counts of a mixed list
- **WHEN** the counts of a list with two pending tasks and one done task are asked
- **THEN** they say 2 pending and 1 done

#### Scenario: Counts of an empty list
- **WHEN** the counts of an empty list are asked
- **THEN** they say 0 pending and 0 done

### Requirement: Search tasks by title
The system SHALL return the tasks whose title contains a given text, ignoring case, keeping the order of the list.

#### Scenario: Search ignores case
- **WHEN** a list with the titles `Buy milk` and `Call home` is searched for `MILK`
- **THEN** only `Buy milk` is returned

#### Scenario: Empty search text
- **WHEN** a list is searched for an empty text
- **THEN** every task is returned, in the same order

### Requirement: Summarise a task in one line
The system SHALL describe a task in one line made of its title, its priority and whether it is done.

#### Scenario: Done task
- **WHEN** the summary of a done task titled `Buy milk` with high priority is asked
- **THEN** it is `Buy milk (high, done)`

#### Scenario: Task that is not done
- **WHEN** the summary of a task that is not done is asked
- **THEN** the line ends with `pending` in place of `done`, for example `Buy milk (high, pending)`

### Requirement: Order tasks by title
The system SHALL return the tasks of a list sorted by title, ignoring case.

#### Scenario: Case-insensitive order
- **WHEN** the titles `call home` and `Buy milk` are sorted by title
- **THEN** `Buy milk` comes first
