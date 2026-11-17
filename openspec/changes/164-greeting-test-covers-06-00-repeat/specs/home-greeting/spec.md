## ADDED Requirements

### Requirement: Greeting test covers 06:00
The greeting test SHALL include a case "morning at 06:00" that expects the greeting "Good morning", following the name pattern and helpers of the cases around it, without depending on the real time or on the network.

#### Scenario: New check passes with the others
- **WHEN** the new check runs with the others
- **THEN** it passes, and every existing check still passes, unchanged

#### Scenario: Suite is deterministic
- **WHEN** the suite runs
- **THEN** it does not depend on the real time or on the network
