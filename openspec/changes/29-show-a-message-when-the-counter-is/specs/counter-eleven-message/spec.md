# Spec Delta

## Purpose
Show a short celebratory message on the counter screen when the counter reaches exactly eleven.

## ADDED Requirements

### Requirement: Eleven message
The counter screen SHALL show the text "Eleven reached", with the key `eleven-text`, under the parity text when the counter is exactly 11, and SHALL show no such text for any other value.

#### Scenario: Counter is eleven
- **WHEN** the counter is exactly eleven
- **THEN** the text "Eleven reached" is shown under the parity text

#### Scenario: Counter is not eleven
- **WHEN** the counter is anything other than eleven
- **THEN** no such text is shown

#### Scenario: Neighbouring values
- **WHEN** the counter is 10 or 12
- **THEN** the text "Eleven reached" is not shown

#### Scenario: Reset after eleven
- **WHEN** the user taps reset after reaching eleven
- **THEN** the text "Eleven reached" disappears
