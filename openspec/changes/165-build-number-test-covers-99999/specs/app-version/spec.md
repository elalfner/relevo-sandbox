## ADDED Requirements

### Requirement: Build number 99999 is shown after the version
The build number SHALL be shown as received when it is 99999, right after the version.

#### Scenario: Build 99999 is shown
- **WHEN** the new check runs with the others
- **THEN** it passes, and every existing check still passes, unchanged

#### Scenario: Test independence
- **WHEN** the suite runs
- **THEN** it does not depend on the real time or on the network
