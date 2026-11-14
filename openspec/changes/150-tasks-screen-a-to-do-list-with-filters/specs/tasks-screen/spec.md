# Spec Delta

## Purpose

Lets the person keep a short in-memory to-do list: add tasks with a priority, complete them, filter, sort and delete with undo.

## ADDED Requirements

### Requirement: Open the Tasks screen
The home screen SHALL have a Tasks button that opens the Tasks screen.

#### Scenario: Open from home
- **WHEN** the person taps the Tasks button on the home screen
- **THEN** the Tasks screen opens with the title "Tasks", the header "0 tasks" and the text "Nothing to do yet" in the middle of the list area

#### Scenario: Reopening keeps the list
- **WHEN** the person rotates the screen or opens the Tasks screen again from the home screen
- **THEN** the list is kept, and it is lost only when the app is closed

### Requirement: Add a task
The person SHALL add a task with a title and a priority through a bottom sheet.

#### Scenario: Add a task
- **WHEN** the person taps Add, types "Buy milk", chooses the priority High and taps Save in the bottom sheet
- **THEN** the sheet closes, the list shows "Buy milk" with a High badge, and the header says "1 task"

#### Scenario: Header singular and plural
- **WHEN** the list has 0, 1 or 5 tasks
- **THEN** the header says "0 tasks", "1 task" or "5 tasks"

### Requirement: Validate the title
The title MUST be non-empty after trimming, at most 60 characters as the person sees them, and unique ignoring case and spaces at the ends.

#### Scenario: Empty title
- **WHEN** the person taps Save with an empty title, or with a title of only spaces
- **THEN** the sheet stays open and shows the error "Write a title" under the field, and no task is added

#### Scenario: Title too long
- **WHEN** the person types a title of 61 characters
- **THEN** the field shows the error "At most 60 characters" and Save does nothing; a title of exactly 60 characters is accepted

#### Scenario: Characters as seen
- **WHEN** the title is "Café ☕"
- **THEN** it counts as 6 characters

#### Scenario: Duplicate title
- **WHEN** the person adds "buy milk" and a task "Buy milk" already exists, compared without caring about upper or lower case and ignoring spaces at the ends
- **THEN** the sheet stays open and shows the error "That task already exists"

#### Scenario: Deleted title can be reused
- **WHEN** the snackbar of a deleted task closes without Undo, and then the person taps Add
- **THEN** a title equal to the deleted task is accepted again

### Requirement: Complete a task
The person SHALL mark a task done with its checkbox.

#### Scenario: Mark done
- **WHEN** the person taps the checkbox of an open task
- **THEN** the title is shown with a line through it, the header says how many are still open ("2 of 3 open"), and under the filter Open the task disappears from the list

### Requirement: Filter the list
The list SHALL be filterable by All, Open and Done, with its own text for an empty result.

#### Scenario: Empty filtered lists
- **WHEN** the person picks the filter Done and no task is done
- **THEN** the list area shows "No done tasks" and the Add button is still available; the other two filters have the texts "No open tasks" and "Nothing to do yet"

#### Scenario: Filter and sort persist
- **WHEN** tasks are added, completed or deleted
- **THEN** the filter and the sort chosen stay chosen

#### Scenario: Deleting the last task of a filter
- **WHEN** the last task shown under a filter is deleted
- **THEN** that filter's empty text is shown

### Requirement: Sort the list
The list SHALL be sortable by added order, Priority or Title.

#### Scenario: Sort by priority
- **WHEN** the person sorts by Priority
- **THEN** the order is High, Medium, Low, and tasks with the same priority keep the order in which they were added

#### Scenario: Sort by title
- **WHEN** the person sorts by Title
- **THEN** the tasks are ordered A to Z without caring about case

### Requirement: Delete with undo
The person SHALL delete a task by swiping it to the left, with an Undo action.

#### Scenario: Delete and undo
- **WHEN** the person swipes a task to the left
- **THEN** it disappears from the list and a snackbar says "Task deleted" with an Undo action; tapping Undo within the time of the snackbar puts the task back in its former position

#### Scenario: Two quick deletes
- **WHEN** the person swipes two different tasks quickly
- **THEN** the snackbar of the first is replaced by the second, and Undo restores only the second

### Requirement: Accessibility
Every button, chip and the checkbox SHALL have a semantics label, and the swipe SHALL have a semantic action for delete.

#### Scenario: Semantics present
- **WHEN** the Tasks screen is shown
- **THEN** its buttons, chips and checkboxes expose semantics labels and each task exposes a delete action
