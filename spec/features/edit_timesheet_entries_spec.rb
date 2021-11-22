require 'rails_helper'

feature 'Edit entries' do
  fixtures :entries

  before(:each) do
    login
    allow(Date).to receive(:today) { Date.new(2021, 11, 15) }
    allow(Time).to receive(:now) { Time.new(2021, 11, 15, 9, 0, 0) }
  end

  scenario 'A user can click on a timesheet entry and be taken to a page to edit that entry' do
    visit('/timesheet/2021/46')
    click_on('09:01')
    expect(page).to have_current_path('/timesheet/2021/46/2021-11-15/0')
  end
end
