## ADDED Requirements

### Requirement: Reset button disabled at zero
The Reset button SHALL stay on the screen and be disabled while the counter is 0. It SHALL be enabled while the counter is above 0.

#### Scenario: Disabled at start
- **WHEN** the app starts and the counter is 0
- **THEN** the Reset button is disabled

#### Scenario: Enabled after a tap on add
- **WHEN** the person taps the add button
- **THEN** the counter goes up by one and the Reset button is enabled

#### Scenario: Disabled again after Reset
- **WHEN** the counter is 5 and the person taps Reset
- **THEN** the counter shows 0 and the Reset button is disabled

#### Scenario: Tap on the disabled button
- **WHEN** the counter is 0 and the person taps the disabled Reset button
- **THEN** nothing happens and no error is shown
