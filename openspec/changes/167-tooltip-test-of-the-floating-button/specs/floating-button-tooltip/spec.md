## ADDED Requirements

### Requirement: The floating button has the tooltip "Increment"
A check in `test/tooltip_test.dart` SHALL find the tooltip "Increment" on the floating button, and the suite SHALL pass without depending on the real time or on the network.

#### Scenario: The new check runs with the others
- **WHEN** the new check runs with the others
- **THEN** it passes, and every existing check still passes, unchanged

#### Scenario: The suite is deterministic
- **WHEN** the suite runs
- **THEN** it does not depend on the real time or on the network
