require 'rails_helper'

feature 'Entries' do
  before(:each) { sign_in }
  before(:all) {Entry.destroy_all}

  scenario 'A signed in user can clock in - AM start' do
    visit('/entries')
    click_button('AM Start')
    
    entry = Entry.all.first
    expect(entry.entry_date).to eq(Date.today)
    expect(entry.entry_type).to eq(0)
  end 

  scenario 'A signed in user can clock in - AM finish' do
    visit('/entries')
    click_button('AM Finish')
    
    entry = Entry.all.first
    expect(entry.entry_date).to eq(Date.today)
    expect(entry.entry_type).to eq(1)
  end 

  scenario 'A signed in user can clock in - PM start' do
    visit('/entries')
    click_button('PM Start')
    
    entry = Entry.all.first
    expect(entry.entry_date).to eq(Date.today)
    expect(entry.entry_type).to eq(2)
  end 

  scenario 'A signed in user can clock in - PM Finish' do
    visit('/entries')
    click_button('PM Finish')
    
    entry = Entry.all.first
    expect(entry.entry_date).to eq(Date.today)
    expect(entry.entry_type).to eq(3)
  end

  scenario 'A user completes a typical day of work' do
    visit('/entries')
    travel_to DateTime.new(2021, 11, 17, 9, 0, 0)
    click_button('AM Start')
    travel_to DateTime.new(2021, 11, 17, 12, 30, 0)
    click_button('AM Finish')
    travel_to DateTime.new(2021, 11, 17, 13, 0, 0)
    click_button('PM Start')
    travel_to DateTime.new(2021, 11, 17, 17, 0, 0)
    click_button('PM Finish')

    entries = Entry.all
    
    expect(entries[0].entry_time).to eq(Time.new(2000, 1, 1, 9, 0))
    expect(entries[0].entry_type).to eq(0)
    expect(entries[1].entry_time).to eq(Time.new(2000, 1, 1, 12, 30))
    expect(entries[1].entry_type).to eq(1)
    expect(entries[2].entry_time).to eq(Time.new(2000, 1, 1, 13, 0))
    expect(entries[2].entry_type).to eq(2)
    expect(entries[3].entry_time).to eq(Time.new(2000, 1, 1, 17, 0))
    expect(entries[3].entry_type).to eq(3)
  end
end
