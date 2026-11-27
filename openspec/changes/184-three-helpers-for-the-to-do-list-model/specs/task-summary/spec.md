## ADDED Requirements

### Requirement: Task summary line
The system SHALL return one line that describes a task as `<title> (<priority>, <done|pending>)`, where the priority is written in lower case.

#### Scenario: Done task
- **WHEN** the summary of a done task titled `Buy milk` with high priority is asked
- **THEN** it is `Buy milk (high, done)`

#### Scenario: Pending task
- **WHEN** the summary of a task that is not done is asked
- **THEN** its line says `pending` instead of `done`
