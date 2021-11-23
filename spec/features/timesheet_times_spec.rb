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

  scenario '0:00 shown when no times registered' do
    visit('/timesheet/2021/48')
    expect(page).to have_content('0:00')
  end

  scenario 'AM totals shown when only AM times filled' do
    Entry.create(user_id: 1, entry_date: Date.new(2021,11,29), entry_type: 0, entry_time: Time.new(2000,1,1,9,0,0))
    Entry.create(user_id: 1, entry_date: Date.new(2021,11,29), entry_type: 1, entry_time: Time.new(2000,1,1,12,30,0))
    visit('/timesheet/2021/48')
    expect(page).to have_content('3:30')
  end

  scenario 'PM totals shown when only PM times filled' do
    Entry.create(user_id: 1, entry_date: Date.new(2021,11,29), entry_type: 2, entry_time: Time.new(2000,1,1,13,0,0))
    Entry.create(user_id: 1, entry_date: Date.new(2021,11,29), entry_type: 3, entry_time: Time.new(2000,1,1,17,30,0))
    visit('/timesheet/2021/48')
    expect(page).to have_content('4:30')
  end
end

feature 'Show user total weekly time' do
  fixtures :entries
  
  before(:each) do
    login
  end

  scenario 'Full timesheet weekly time shown' do
    visit('/timesheet/2021/46')
    expect(page).to have_content('34:59')
  end
end
