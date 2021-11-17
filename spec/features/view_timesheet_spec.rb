require 'rails_helper'

feature 'view timesheets' do
  fixtures :entries
  scenario 'a user can view timesheets' do
    p entries(:monday_am_start)
  end 
end