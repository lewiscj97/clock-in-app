def sign_up
  visit('/welcome')
  click_button('Register')
  fill_in(:user_first_name, with: 'joe')
  fill_in(:user_last_name, with: 'bloggs')
  fill_in(:user_email, with: 'joe.bloggs@123.com')
  fill_in(:user_password, with: 'password')
  click_button('Create Account')
end

def login
  visit('/welcome')
  click_button('Log In')
  fill_in(:email, with: 'moggymog@meowmail.com')
  fill_in(:password, with: 'fish')
  click_button('Log In')
end
