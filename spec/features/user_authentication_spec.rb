require 'rails_helper'

feature 'signing up' do
  scenario 'a user can sign up a new account' do
    visit('/welcome')
    click_button('Sign Up')
    fill_in(:user_first_name, with: 'joe')
    fill_in(:user_last_name, with: 'bloggs')
    fill_in(:user_email, with: 'joe.bloggs@123.com')
    fill_in(:user_password, with: 'password')
  end 
end

feature 'login' do
  scenario 'a user can login to the application' do
    
  end 
end

feature 'logout' do
  scenario 'a user can logout of the application' do
    
  end 
end