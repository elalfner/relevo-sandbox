# Spec Delta

## Purpose

Lets the person set a display name, email, age, notifications and theme in a validated form, without keeping them after the app closes.

## ADDED Requirements

### Requirement: Open the Settings screen
The home screen SHALL have a Settings button that opens the Settings screen with empty Name, Email and Age fields, the Notifications switch on, the theme System selected and Save disabled.

#### Scenario: Open Settings
- **WHEN** the person taps the Settings button on the home screen
- **THEN** the Settings screen opens with empty Name and Email fields, an empty Age field, the Notifications switch on, the theme System selected, and Save disabled

### Requirement: Name validation
The Name field SHALL accept 2 to 30 characters after removing spaces at both ends, and otherwise show "Use 2 to 30 characters" once the person leaves the field.

#### Scenario: Name too short
- **WHEN** the person types "A" in Name and leaves the field
- **THEN** the field shows the error "Use 2 to 30 characters"

#### Scenario: Name too long
- **WHEN** the person types a name of 31 characters and leaves the field
- **THEN** the field shows the error "Use 2 to 30 characters"

#### Scenario: Name at the limits
- **WHEN** the person types "Al" or a name of exactly 30 characters
- **THEN** the name is accepted

#### Scenario: Name of only spaces
- **WHEN** the person types only spaces in Name
- **THEN** the name is invalid

### Requirement: Email validation
The Email field SHALL accept a valid email of up to 254 characters and otherwise show "Write a valid email" once the person leaves the field.

#### Scenario: Invalid email
- **WHEN** the person types "ana@example" in Email and leaves the field
- **THEN** the field shows the error "Write a valid email"

#### Scenario: Valid email with a plus sign
- **WHEN** the person types "ana+test@example.com"
- **THEN** the email is accepted

#### Scenario: Very long email
- **WHEN** the person types an email of 254 characters, or of 255 characters
- **THEN** the 254-character email is accepted and the 255-character one is not

### Requirement: Age validation
The Age field SHALL accept a whole number from 13 to 120 and otherwise show "Age must be a whole number from 13 to 120".

#### Scenario: Age out of range or not a whole number
- **WHEN** the person types an Age of 12, or 121, or "abc", or "30.5"
- **THEN** the field shows "Age must be a whole number from 13 to 120"

#### Scenario: Age at the limits
- **WHEN** the person types an Age of 13 or 120
- **THEN** the age is accepted

### Requirement: Save is enabled only for a valid, changed form
Save SHALL be enabled only while Name, Email and Age are all valid and at least one value differs from the last saved values.

#### Scenario: Form becomes valid
- **WHEN** Name, Email and Age are valid and none of them was valid before
- **THEN** Save becomes enabled

#### Scenario: Invalid or unchanged form
- **WHEN** any field is invalid, or nothing differs from the last saved values
- **THEN** Save is disabled

#### Scenario: Change reverted
- **WHEN** the person changes a field back to the last saved value
- **THEN** the form is clean again, Save is disabled and back asks nothing

### Requirement: Saving
Saving SHALL store the trimmed values in memory only, confirm with a snackbar, disable Save and keep the screen open.

#### Scenario: Save valid values
- **WHEN** the person taps Save with valid values
- **THEN** a snackbar says "Settings saved", Save becomes disabled again, and the screen stays open

#### Scenario: Name is trimmed
- **WHEN** the person saves the name "  Ana  "
- **THEN** the saved name is "Ana"

### Requirement: Confirm before discarding changes
Leaving the screen with unsaved changes, by the system back or the back arrow of the app bar, SHALL ask "Discard your changes?" with the buttons Keep editing and Discard.

#### Scenario: Back with changes
- **WHEN** the person changes a field and then presses back, or taps the back arrow of the app bar
- **THEN** a dialog asks "Discard your changes?" with the buttons Keep editing and Discard

#### Scenario: Keep editing
- **WHEN** the person taps Keep editing
- **THEN** the form stays as it was

#### Scenario: Discard
- **WHEN** the person taps Discard
- **THEN** the screen closes without saving

#### Scenario: Back with no unsaved changes
- **WHEN** the person presses back with no changes, or with changes that were saved
- **THEN** the screen closes without the dialog

### Requirement: Live theme
The theme choice (System, Light, Dark) SHALL apply to the whole app at once, before Save, SHALL NOT be part of the form's unsaved changes, and SHALL be kept when other changes are discarded.

#### Scenario: Choose Dark
- **WHEN** the person chooses the theme Dark
- **THEN** the whole app, the Settings screen and the home screen behind it, is dark at once, before Save is tapped

#### Scenario: Choose System
- **WHEN** the person chooses System
- **THEN** the app follows the theme of the phone again

#### Scenario: Discard keeps the theme
- **WHEN** the person chooses a theme, changes other fields and discards
- **THEN** the chosen theme stays

### Requirement: Nothing is kept after the app closes
The settings SHALL be held in memory only.

#### Scenario: App restarted
- **WHEN** the app is closed and opened again
- **THEN** the settings are empty and the theme is System

### Requirement: Accessible controls
Every field, the switch, the theme options and the buttons SHALL have a semantics label, and error texts SHALL be announced.

#### Scenario: Semantics
- **WHEN** the Settings screen is shown
- **THEN** each field, the switch, each theme option and each button exposes a semantics label, and a shown error is announced

### Requirement: Matches the project guidance
The Settings screen SHALL follow the project rules on scope: no new dependency, no persistence and no real notifications.

#### Scenario: Notifications switch only stores a value
- **WHEN** the person toggles Notifications and saves
- **THEN** the value is stored and nothing else happens
