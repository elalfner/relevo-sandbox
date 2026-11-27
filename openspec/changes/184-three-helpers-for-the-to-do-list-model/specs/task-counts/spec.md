## ADDED Requirements

### Requirement: Task counts
The system SHALL provide the number of pending tasks and the number of done tasks of a list of tasks.

#### Scenario: Mixed list
- **WHEN** the counts of a list with two pending tasks and one done task are asked
- **THEN** they say 2 pending and 1 done

#### Scenario: Empty list
- **WHEN** the counts of an empty list are asked
- **THEN** they say 0 pending and 0 done
