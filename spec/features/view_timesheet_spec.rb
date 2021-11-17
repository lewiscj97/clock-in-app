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
end
