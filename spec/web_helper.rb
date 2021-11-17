def sign_in
  visit('/welcome')
  click_button('Sign Up')
  fill_in(:user_first_name, with: 'joe')
  fill_in(:user_last_name, with: 'bloggs')
  fill_in(:user_email, with: 'joe.bloggs@123.com')
  fill_in(:user_password, with: 'password')
  click_button('Create User')
end
