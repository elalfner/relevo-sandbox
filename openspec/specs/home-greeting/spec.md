# home-greeting Specification

## Purpose
TBD - created by archiving change 3-show-a-greeting. Update Purpose after archive.
## Requirements
### Requirement: Greeting by time of day
The home screen SHALL show a greeting chosen from the phone's local time when the screen is created: "Good morning" from 05:00 to 11:59, "Good afternoon" from 12:00 to 17:59, and "Good evening" from 18:00 to 04:59.

#### Scenario: Morning
- **WHEN** the app opens between 05:00 and 11:59 on the phone's clock
- **THEN** the greeting says "Good morning"

#### Scenario: Afternoon
- **WHEN** the app opens between 12:00 and 17:59 on the phone's clock
- **THEN** the greeting says "Good afternoon"

#### Scenario: Evening
- **WHEN** the app opens between 18:00 and 04:59 on the phone's clock
- **THEN** the greeting says "Good evening"

#### Scenario: Just before morning
- **WHEN** the app opens at 04:59
- **THEN** the greeting says "Good evening"

#### Scenario: Start of morning
- **WHEN** the app opens at 05:00
- **THEN** the greeting says "Good morning"

#### Scenario: End of morning
- **WHEN** the app opens at 11:59
- **THEN** the greeting says "Good morning"

#### Scenario: Start of afternoon
- **WHEN** the app opens at 12:00
- **THEN** the greeting says "Good afternoon"

#### Scenario: End of afternoon
- **WHEN** the app opens at 17:59
- **THEN** the greeting says "Good afternoon"

#### Scenario: Start of evening
- **WHEN** the app opens at 18:00
- **THEN** the greeting says "Good evening"

#### Scenario: Midnight
- **WHEN** the app opens at 00:00
- **THEN** the greeting says "Good evening"

### Requirement: Greeting position and style
The greeting SHALL be visible at the top of the body, centred, above the text "You have pushed the button this many times:", in the theme's headline medium text style with no bold and no colour of its own.

#### Scenario: Greeting above the counter text
- **WHEN** the app opens
- **THEN** the greeting is visible above the text "You have pushed the button this many times:"

### Requirement: Greeting is fixed once chosen
The greeting SHALL NOT change after the home screen is created, until the app is opened again.

#### Scenario: Buttons pressed
- **WHEN** the user taps the increment button or the reset button
- **THEN** the greeting does not change and stays visible

#### Scenario: Part of the day changes while open
- **WHEN** the app stays open past the start of another part of the day
- **THEN** the greeting does not change until the app is opened again

#### Scenario: Background, clock or time zone change
- **WHEN** the app goes to the background and comes back, or the phone's time or time zone changes while it is open
- **THEN** the greeting does not change until the app is opened again

### Requirement: Greeting fits large text and landscape
The body of the home screen SHALL scroll so that the greeting and the rest of the screen can be reached without overflow.

#### Scenario: Large system text size
- **WHEN** the system text size is large
- **THEN** the greeting stays visible and wraps without overflow, and the rest of the screen can be reached by scrolling

#### Scenario: Landscape orientation
- **WHEN** the phone is in landscape orientation
- **THEN** the greeting stays visible without overflow, and the rest of the screen can be reached by scrolling

