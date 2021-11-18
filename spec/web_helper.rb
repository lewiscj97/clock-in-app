def sign_up
  visit('/welcome')
  click_button('Sign Up')
  fill_in(:user_first_name, with: 'joe')
  fill_in(:user_last_name, with: 'bloggs')
  fill_in(:user_email, with: 'joe.bloggs@123.com')
  fill_in(:user_password, with: 'password')
  click_button('Create User')
end

def login
  visit('/welcome')
  click_button('Login')
  fill_in(:email, with: 'moggymog@meowmail.com')
  fill_in(:password, with: 'fish')
  click_button('Login')
end
