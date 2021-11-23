require 'rails_helper'

RSpec.describe EntriesController, type: :controller do
  fixtures :users

  describe "creating an entry" do
    it "should create an entry" do
      allow(controller).to receive(:current_user) { users(:mog) }
      post :create
      entry = Entry.all.last
      expect(entry.user_id).to eq(1)
      expect(entry.entry_date).to eq(Date.today)
    end

  end
end
