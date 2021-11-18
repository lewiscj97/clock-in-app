require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/users/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "redirect to the welcome page" do
      post "/users", params: {user: {first_name: 'Moggy', last_name: 'Mog', email: 'moggymog@meowmail.com', password: 'fish'}}
      expect(response).to redirect_to('/entries')
    end

    it "creates a new user" do
      post "/users", params: {user: {first_name: 'Test', last_name: 'Testing', email: 'testing@example.com', password: 'fish'}}
      user = User.find_by(first_name: 'Test')
      expect(user.last_name).to eq('Testing')
    end
  end
end
