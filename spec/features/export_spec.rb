require 'rails_helper'
require 'rubyXL'

feature 'Exporting Timesheets' do
  before(:each) do
    login
  end

  scenario 'A signed in user can clock in - AM start' do
    allow(Date).to receive(:today) { Date.new(2021, 11, 19) }
    visit('/timesheet/2021/46')
    click_button('Export')
    expect(page).to have_current_path('/timesheet/2021/46.xlsx')
    expect(page.response_headers["Content-Disposition"]).to eq("attachment; filename=2021-11-19-timesheet-2021-46.xlsx")
  end 
end
