require 'rails_helper'

feature 'Entries' do
  before(:each) do
    sign_up
    allow(Date).to receive(:today) { Date.new(2021, 12, 25) }
  end

  scenario 'A signed in user can see the current time' do
    allow(Time).to receive(:now) { Time.new(2021, 12, 25, 9, 0, 0) }
    visit('/entries')
    expect(page).to have_content("Current time: 09:00")
  end 


  scenario 'A signed in user can clock in - AM start' do
    visit('/entries')
    click_button('Clock IN')
    
    entry = Entry.where(entry_date: '2021-12-25').first
    expect(entry.entry_type).to eq(0)
    expect(Entry.where(entry_date: '2021-12-25').count).to eq(1)
  end 

  scenario 'A signed in user can clock in - AM finish' do
    visit('/entries')
    click_button('Clock IN')
    click_button('Clock OUT')   

    entry = Entry.where(entry_date: '2021-12-25').last
    expect(entry.entry_type).to eq(1)
    expect(Entry.where(entry_date: '2021-12-25').count).to eq(2)
  end 

  scenario 'A signed in user can clock in - PM start' do
    visit('/entries')
    click_button('Clock IN')
    click_button('Clock OUT')
    click_button('Clock IN')

    entry = Entry.where(entry_date: '2021-12-25').last
    expect(entry.entry_type).to eq(2)
    expect(Entry.where(entry_date: '2021-12-25').count).to eq(3)
  end 

  
  scenario 'A signed in user can clock in - PM finish' do
    visit('/entries')
    click_button('Clock IN')
    click_button('Clock OUT')
    click_button('Clock IN')
    click_button('Clock OUT')
    
    entry = Entry.where(entry_date: '2021-12-25').last
    expect(entry.entry_type).to eq(3)
    expect(Entry.where(entry_date: '2021-12-25').count).to eq(4)
  end 
  
  scenario 'A signed in user is informed if they try to make more than 4 entries' do
    visit('/entries')
    click_button('Clock IN')
    click_button('Clock OUT')
    click_button('Clock IN')
    click_button('Clock OUT')
  
    expect(page).to have_button('COMPLETE', disabled: true)
    expect(Entry.where(entry_date: '2021-12-25').count).to eq(4)
  end 
end