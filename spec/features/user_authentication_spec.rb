require 'rails_helper'

feature 'signing up' do
  scenario 'a user can sign up a new account' do
    visit('/welcome')
    click_button('Sign Up')
    fill_in(:user_first_name, with: 'joe')
    fill_in(:user_last_name, with: 'bloggs')
    fill_in(:user_email, with: 'joe.bloggs@123.com')
    fill_in(:user_password, with: 'password')
    click_button('Create User')
    expect(page).to have_current_path('/welcome')
    expect(page).to have_button('Sign out')
  end 
end

feature 'login' do
  scenario 'a user can login to the application' do
    visit('/welcome')
    click_button('Login')
    fill_in(:email, with: 'moggymog@meowmail.com')
    fill_in(:password, with: 'fish')
    click_button('Login')
    expect(page).to have_current_path('/welcome')
  end 

  scenario 'a user cannot login to the application with incorrect details' do
    visit('/welcome')
    click_button('Login')
    fill_in(:email, with: 'moggymog@meowmail.com')
    fill_in(:password, with: 'paws')
    click_button('Login')
    expect(page).to have_current_path('/login')
  end 
end

feature 'logout' do
  scenario 'a user can logout of the application' do
    visit('/welcome')
    click_button('Login')
    fill_in(:email, with: 'moggymog@meowmail.com')
    fill_in(:password, with: 'fish')
    click_button('Login')
    click_button('Sign out')
    expect(page).to have_current_path('/welcome')
    expect(page).to_not have_button('Sign out')
  end 
end