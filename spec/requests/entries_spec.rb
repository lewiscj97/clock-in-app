require 'rails_helper'

RSpec.describe "Entries", type: :request do
  fixtures :all

  describe "creating an entry" do
    it "should create an enrty" do
      post "/entries", params: {user_id: '1', entry_type: '0'}
      entry = Entry.all.first
      expect(entry.user_id).to eq('1')
    end
  end

  # describe "" do
  #   it "" do
  #     post "/login", params: {email: 'moggymog@meowmail.com', password: 'fish'}
  #     expect(response).to redirect_to('/welcome')
  #   end
  # end

  # describe "" do
  #   it "" do
  #     post "/login", params: {email: 'moggymog@meowmail.com', password: 'fish'}
  #     expect(response).to redirect_to('/welcome')
  #   end
  # end

  # describe "" do
  #   it "" do
  #     post "/login", params: {email: 'moggymog@meowmail.com', password: 'fish'}
  #     expect(response).to redirect_to('/welcome')
  #   end
  # end
end
