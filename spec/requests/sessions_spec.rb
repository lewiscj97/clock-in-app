require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  fixtures :all

  describe "POST /login" do
    it "Logs in a user successfully" do
      post "/login", params: {email: 'moggymog@meowmail.com', password: 'fish'}
      expect(response).to redirect_to('/entries')
    end

    it "Redirects to the login page if details incorrect" do
      post "/login", params: {email: 'moggymog@meowmail.com', password: 'incorrectpassword'}
      expect(response).to redirect_to('/login')
    end
  end

  describe "GET /logout" do
    it "Resets the user_id in session storage to nil" do
      post "/login", params: {email: 'moggymog@meowmail.com', password: 'fish'}
      expect(session[:user_id]).to eq(1)
      
      get '/logout'
      expect(session[:user_id]).to eq(nil)
    end
  end
end
