# Spec Delta

## Purpose

Counts how many tasks of a list are pending and how many are done, for use by the to-do list model.

## ADDED Requirements

### Requirement: Count pending and done tasks
The system SHALL count the pending tasks and the done tasks of a list of tasks.

#### Scenario: Mixed list
- **WHEN** the counts of a list with two pending tasks and one done task are asked
- **THEN** they say 2 pending and 1 done

#### Scenario: Empty list
- **WHEN** the counts of an empty list are asked
- **THEN** they say 0 pending and 0 done
