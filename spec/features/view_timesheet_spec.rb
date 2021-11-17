require 'rails_helper'

feature 'view timesheets' do
  fixtures :entries
  scenario 'a user can view timesheets' do
    login
    visit('/entries')
    click_button('View Timesheets')
    expect(page).to have_content("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
  end
end