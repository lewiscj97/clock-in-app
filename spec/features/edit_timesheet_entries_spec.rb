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

  scenario 'A user can edit any entry on their timesheet' do
    visit('/timesheet/2021/46')
    click_on('09:01')
    fill_in :time, with: '09:32'
    click_button('Submit')
    expect(page).to have_current_path('/timesheet/2021/46')
    expect(page).to have_content('09:32')
  end

  scenario 'A user can edit an empty entry' do
    visit('/timesheet/2021/47')
    find(:xpath, "/html/body/section/div/table/tbody/tr[1]/td[1]/a").click
    expect(page).to have_current_path('/timesheet/2021/47/2021-11-22/0')
    fill_in :time, with: '09:30'
    click_button('Submit')
    expect(page).to have_current_path('/timesheet/2021/47')
    expect(page).to have_content('09:30')
  end
end
