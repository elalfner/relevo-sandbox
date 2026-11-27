## ADDED Requirements

### Requirement: Task search by title
The system SHALL return, in their original order, the tasks whose title contains a given text, ignoring case.

#### Scenario: Case-insensitive match
- **WHEN** a list with the titles `Buy milk` and `Call home` is searched for `MILK`
- **THEN** only `Buy milk` is returned

#### Scenario: Empty text
- **WHEN** a list is searched for an empty text
- **THEN** every task is returned, in the same order
