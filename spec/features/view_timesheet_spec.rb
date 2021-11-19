require 'rails_helper'

feature 'view timesheets' do
  fixtures :entries
  
  before(:each) { login }

  scenario 'a user can view timesheets' do
    visit('/entries')
    click_button('View Timesheets')
    expect(page).to have_content("Monday")
    expect(page).to have_content("09:00")
  end

  scenario 'A user can view a specific timesheet given the year and week number' do
    visit('/timesheet/2021/46')
    expect(page).to have_content('Monday')
    expect(page).to have_content('09:00')
  end

  scenario 'User can view specific timesheet that contains no data' do
    visit('/timesheet/2021/45')
    expect(page).to have_content('Monday')
    expect(page).to have_content('-')
  end

  scenario 'User can select which timesheet they want to view through a form' do
    visit('/timesheet/2021/45')

    fill_in 'week', with: '2021-W46'
    click_button('Submit')
    expect(page).to have_current_path('/timesheet/2021/46')
  end

  scenario 'User can click a button to go to the entries page' do
    visit('/timesheet/2021/46')
    expect(page).to have_button('Back')
    click_button('Back')
    expect(page).to have_current_path('/entries')
  end

  scenario 'The week commencing date is shown on the page' do
    visit('/timesheet/2021/46')
    expect(page).to have_content('Week Commencing: 2021-11-15')
  end
end
