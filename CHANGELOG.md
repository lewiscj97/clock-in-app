# Changelog

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
