# app-version Specification

## Purpose
TBD - created by archiving change 4-show-the-app-version. Update Purpose after archive.
## Requirements
### Requirement: Version subtitle
The counter screen SHALL show the text "v1.0.0" as a subtitle in the app bar. On a very small screen the text SHALL be truncated with an ellipsis and SHALL NOT overflow.

#### Scenario: Opening the counter screen
- **WHEN** the user opens the counter screen
- **THEN** the text "v1.0.0" appears in the app bar subtitle

#### Scenario: Very small screen
- **WHEN** the counter screen is shown on a very small screen
- **THEN** the subtitle text is truncated with an ellipsis and does not overflow

### Requirement: Build number in the subtitle
The counter screen SHALL show the build number of the running build in the app bar subtitle, on the same line right after the version label, as "Build N" where N is the number after the `+` in the `version` of `pubspec.yaml`, shown as received. The version label and the build number SHALL be two separate texts, version first, with a small gap and no separator character. Each SHALL use one line and be truncated on its own with an ellipsis when space is short, without overflowing. While the build number has not loaded, or when it cannot be read or is empty, the subtitle SHALL show only the version label, with no placeholder, no spinner and no error, and the app SHALL NOT crash.

#### Scenario: Build number loaded
- **WHEN** the user opens the counter screen of a build whose pubspec version is `1.0.0+1` and the build number has loaded
- **THEN** the app bar subtitle shows "v1.0.0" and, on the same line right after it, "Build 1"

#### Scenario: A different build number
- **WHEN** the pubspec build number is a different one, for example `1.0.0+42`
- **THEN** the subtitle shows "Build 42"

#### Scenario: Build number not loaded yet
- **WHEN** the user opens the counter screen and the build number has not loaded yet
- **THEN** the subtitle shows only "v1.0.0", with nothing in place of the build, and the build appears as soon as it loads

#### Scenario: Very small screen
- **WHEN** the counter screen is shown on a very small screen
- **THEN** the version label and the build number are each truncated on their own with an ellipsis, on one line, and neither overflows

#### Scenario: Build number cannot be read
- **WHEN** the build number cannot be read
- **THEN** only "v1.0.0" is shown, with no placeholder and no error on screen, and the app does not crash

#### Scenario: Build number is empty
- **WHEN** the build number comes back empty
- **THEN** the subtitle behaves as when it cannot be read

#### Scenario: Platform plugin not available
- **WHEN** the platform plugin is not available, as in a test that does not simulate it
- **THEN** the subtitle behaves as when it cannot be read, and the existing tests keep passing without any change

#### Scenario: Zero or long build number
- **WHEN** the build number is "0" or a long value
- **THEN** it is shown as received after "Build ", and a long one is truncated with an ellipsis like any other text

