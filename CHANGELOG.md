# Changelog

## 24/11/21

* style/edit-entries-page
  * Edit entries view styled to be consistent with other views
  * User is shown the date and entry type that they are editing
  * Styling applied to the timesheet, adding some padding and extra style when hovering over entries

## 23/11/21

* feature/format_current_entry_time_on_edit_view
  * Fixed breaking bug which was due to the `.first_or_create` method used when editing entries. If the user edited a blank entry and did not complete the process, the site hit a null pointer exception. This was fixed by using `.first_or_initialize`, which does not create a new value until the user enters a new time
  * Store times in HH:MM format When creating new entries, in order to stop showing milliseconds when editing times

## 23/11/21

* feature/incorrect-login-flash-message
  * Added incorrect login flash message
  * Wrote test to check for it

## 23/11/21

* feature/register-button-in-login
  * added a register button on the login page
  * updated css on login button

## 22/11/21

* feature/updated-one-click-button
  * Added individual flash messages for each entry type
  * Disabled button once all entries are made each day

## 22/11/21

* feature/current-time-on-entry-page
  * Current time is displayed on entry page.
  * Removed view timesheet button from entry page.
  * Completed feature test, and sorted timesheet button test.

## 22/11/21

* feature/show-daily-total-times
  * User is shown the total time they have worked for each day
  * User shown the total time worked during the week

Comments:
* Daily time is shown when both values for AM, PM or both AM and PM are filled in

## 22/11/21

* feature/edit-timesheet-entries
  * User is able to edit an entry that they have already made
  * User is able to create a new entry where there is currently a blank entry

## 22/11/21

* fix/failing-tests
  * Some tests were failing as the current Dates/Times were not stubbed
  * Stubbed Time for 2x tests

## 19/11/21

* feature/export-timesheet
  * User can export the weekly timesheet as an Excel file
  * This file is in the correct format for inputting directly into the DWP timesheet

Comments:
* Additionally changed tests where the Entry fixtures were destroyed to retain fixtures throughout the test suite
* feature/show-current-week-on-timesheet
  * Week commencing date shown on timesheet
  * Current week shown in week input field
  * user cannot access timesheets before 2021

## 19/11/21

* styling/create-nav-bar
  * Created navbar for signing out, viewing timesheets and making entries when user is logged in
  * Used flexboxes for centering content and considered mobile accessibility

## 18/11/21

* feature/single-button-for-entries
  * User can make timesheet entries using a single button
  * Logic to determine which entry the user is making (i.e. AM Start, AM Finish, etc.)

## 18/11/21

* feature/view-timesheets
  * User can view their timesheet for the current week
  * User can navigate between different weeks through a form
  * Fixtures and seed data added for dev and test environments
  * Redirects to the `/entries` page rather than `/welcome` when signing in

## 17/11/21

* feature/add-entries
  * User can clock in for AM Start, AM Finish, PM Start and PM Finish
  * Four buttons used on `/entries` view for MVP
  * Full feature tests for simulating a full day of clocking in

## 16/11/21

* feature/user-authentication
  * User can sign up, login and log out
