require 'rails_helper'

feature 'Show user total daily times' do
  fixtures :entries
  
  before(:each) do
    login
  end

  scenario 'Total daily time shown on timesheet page' do
    visit('/timesheet/2021/46')
    expect(page).to have_content('6:59')
  end
end
