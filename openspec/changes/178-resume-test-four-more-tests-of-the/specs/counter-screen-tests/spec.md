## ADDED Requirements

### Requirement: Counter screen checks
The test suite SHALL contain checks for the parity label, the caption, the floating button tooltip and the count after three taps of the counter screen, and the suite SHALL NOT depend on the real time or on the network.

#### Scenario: New checks run with the others
- **WHEN** the new checks run with the others
- **THEN** they pass, and every existing check still passes, unchanged

#### Scenario: Suite is deterministic
- **WHEN** the suite runs
- **THEN** it does not depend on the real time or on the network

#### Scenario: Parity label
- **WHEN** the counter shows 0, 1 and 2
- **THEN** a check confirms that the label reads Even, Odd and Even

#### Scenario: Caption
- **WHEN** the screen starts and after one tap
- **THEN** a check confirms that the caption "You have pushed the button this many times:" is shown

#### Scenario: Tooltip
- **WHEN** the screen is shown
- **THEN** a check finds the tooltip "Increment" on the floating button

#### Scenario: Three taps
- **WHEN** the user taps the floating button three times
- **THEN** a check confirms that the counter shows 3
