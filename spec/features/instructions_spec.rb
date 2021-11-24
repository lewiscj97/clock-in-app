require 'rails_helper'

feature 'Instructions' do
  scenario 'Link is present when not signed in' do
    visit('/welcome')
    expect(page).to have_link('Instructions')
  end

  scenario 'Link is present when the user is signed in' do
    login
    visit('/entries')
    expect(page).to have_link('Instructions')
  end

  scenario 'Clicking the Instructions link shows the user the instructions for the site' do
    visit('/welcome')
    click_link('Instructions')
    expect(page).to have_current_path('/about')
    expect(page).to have_content('How to Use')
    expect(page).to have_content('Make an Entry')
    expect(page).to have_content('Edit an Entry')
    expect(page).to have_content('Export a Timesheet')
  end
end