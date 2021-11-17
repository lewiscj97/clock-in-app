require 'rails_helper'

feature 'Entries' do
  before(:each) { sign_in }

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
end
