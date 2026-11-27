# Spec Delta

## Purpose
Pure helpers over the Task model: counts of pending and done tasks, title search and a one-line summary.

## ADDED Requirements

### Requirement: Task counts
The system SHALL count the pending and the done tasks of a list.

#### Scenario: Counts of a mixed list
- **WHEN** the counts of a list with two pending tasks and one done task are asked
- **THEN** they say 2 pending and 1 done

#### Scenario: Counts of an empty list
- **WHEN** the counts of an empty list are asked
- **THEN** they are 0 pending and 0 done

### Requirement: Task search
The system SHALL return the tasks whose title contains a text, ignoring case.

#### Scenario: Search ignoring case
- **WHEN** a list with the titles `Buy milk` and `Call home` is searched for `MILK`
- **THEN** only `Buy milk` is returned

#### Scenario: Empty search text
- **WHEN** a list is searched for an empty text
- **THEN** every task is returned, in the same order

### Requirement: Task summary
The system SHALL return one line with the title, the priority and whether the task is done.

#### Scenario: Done task
- **WHEN** the summary of a done task titled `Buy milk` with high priority is asked
- **THEN** it is `Buy milk (high, done)`

#### Scenario: Pending task
- **WHEN** the summary of a task that is not done is asked
- **THEN** it says `pending` instead of `done`
