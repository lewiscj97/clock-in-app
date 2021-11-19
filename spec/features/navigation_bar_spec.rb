require 'rails_helper'

feature 'Navigation bar' do
  before(:each) { sign_up }

  scenario 'A signed in user can see the navigation bar' do
    visit('/entries')
    expect(page).to have_link 'Clock In/Out'
    expect(page).to have_link 'Timesheets'
    expect(page).to have_link 'Sign Out'
  end

  scenario 'Timesheets button works' do
    allow(Time).to receive(:now) { Time.new(2021, 11, 19) }
    visit('/entries')
    click_link('Timesheets')
    expect(page).to have_current_path('/timesheet/2021/46')
  end

  scenario 'Clock In/Out button works' do
    visit('/timesheet/2021/46')
    click_link('Clock In/Out')
    expect(page).to have_current_path('/entries')
  end

  scenario 'Sign Out button works' do
    visit('/entries')
    click_link('Sign Out')
    expect(page).to have_current_path('/welcome')
    expect(page).to have_no_link('/Clock In/Out')
    expect(page).to have_no_link('/Timesheets')
    expect(page).to have_no_link('/Sign Out')
  end
end 