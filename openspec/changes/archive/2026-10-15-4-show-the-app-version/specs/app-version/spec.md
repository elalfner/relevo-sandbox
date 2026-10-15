# Spec Delta

## Purpose

Shows the user which version of the app is running.

## ADDED Requirements

### Requirement: Version subtitle
The counter screen SHALL show the text "v1.0.0" as a subtitle in the app bar. On a very small screen the text SHALL be truncated with an ellipsis and SHALL NOT overflow.

#### Scenario: Opening the counter screen
- **WHEN** the user opens the counter screen
- **THEN** the text "v1.0.0" appears in the app bar subtitle

#### Scenario: Very small screen
- **WHEN** the counter screen is shown on a very small screen
- **THEN** the subtitle text is truncated with an ellipsis and does not overflow
