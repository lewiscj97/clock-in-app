require 'rails_helper'

feature 'Entries' do
  before(:each) { sign_in }

  scenario 'A signed in user can clock in - AM start' do
    visit('/entries')
    click_button('AM Start')
    
    entry = Entry.all.first
    expect(entry.entry_date).to eq(Date.today)
  end 
end
