require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  fixtures :all 
  describe "GET /create" do
    it "returns http success" do
      post "/login", params: {user: {email: 'moggymog@meowmail.com', password: 'fish'}}
      expect(response).to have_http_status(:success)
    end
  end

end
