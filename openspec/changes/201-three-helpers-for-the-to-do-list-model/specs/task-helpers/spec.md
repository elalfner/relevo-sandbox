# Spec Delta

## Purpose

Small pure helpers over the to-do list model: counting tasks, searching them by title and describing one task in a single line.

## ADDED Requirements

### Requirement: Count pending and done tasks
The system SHALL count the pending tasks and the done tasks of a list.

#### Scenario: Counts of a mixed list
- **WHEN** the counts of a list with two pending tasks and one done task are asked
- **THEN** they say 2 pending and 1 done

#### Scenario: Counts of an empty list
- **WHEN** the counts of an empty list are asked
- **THEN** they say 0 pending and 0 done

### Requirement: Search tasks by title
The system SHALL return the tasks whose title contains a text, ignoring case, in list order.

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

#### Scenario: Task not done
- **WHEN** the summary of a task that is not done is asked
- **THEN** it ends with `pending` instead of `done`, for example `Buy milk (high, pending)`
