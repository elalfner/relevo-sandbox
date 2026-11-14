# Spec Delta

## ADDED Requirements

### Requirement: Greeting shows the saved display name
The greeting SHALL append the saved display name after a comma, and SHALL read as today when no name is saved; the time-slot rules and their limits do not change.

#### Scenario: Greeting with a name
- **WHEN** a name "Ana" was saved and the person goes back to the home screen at 09:00
- **THEN** the greeting reads "Good morning, Ana"

#### Scenario: Greeting without a name
- **WHEN** no name is saved
- **THEN** the greeting reads "Good morning" at 09:00, as it does today

## MODIFIED Requirements

### Requirement: Greeting is fixed once chosen
The greeting's time slot SHALL NOT change after the home screen is created, until the app is opened again. Only the display name part may change, when a new name is saved in Settings.

#### Scenario: Buttons pressed
- **WHEN** the user taps the increment button or the reset button
- **THEN** the greeting does not change and stays visible

#### Scenario: Part of the day changes while open
- **WHEN** the app stays open past the start of another part of the day
- **THEN** the greeting does not change until the app is opened again

#### Scenario: Background, clock or time zone change
- **WHEN** the app goes to the background and comes back, or the phone's time or time zone changes while it is open
- **THEN** the greeting does not change until the app is opened again

#### Scenario: Name saved in Settings
- **WHEN** the person saves a new display name in Settings and returns to the home screen
- **THEN** the greeting keeps its time slot and shows the new name
