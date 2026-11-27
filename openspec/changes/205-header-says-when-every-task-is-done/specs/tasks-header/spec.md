# Spec Delta

## Purpose

The summary line at the top of the Tasks screen.

## ADDED Requirements

### Requirement: Header says when every task is done
The header of the Tasks screen SHALL read `All done` when the list has at least one task and none of them is open.

#### Scenario: Every task is done
- **WHEN** the list has two tasks and both are done
- **THEN** the header reads `All done`

#### Scenario: Some tasks are still open
- **WHEN** the list has two tasks and one of them is done
- **THEN** the header reads `1 of 2 open`

#### Scenario: Empty list
- **WHEN** the list has no task
- **THEN** the header reads `0 tasks`

#### Scenario: Reopening a done task
- **WHEN** every task is done and the person marks one of them as open again
- **THEN** the header brings back the count, for example `1 of 2 open`

#### Scenario: A widget test guards the All done header
- **WHEN** the widget tests under `test/` run against a Tasks screen with two tasks that are both done
- **THEN** a test asserts that the header reads `All done`, and that marking one of them as open brings back `1 of 2 open`
- **AND** the test fails if the header does not show `All done`
