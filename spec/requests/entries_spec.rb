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

    it "sets flash message when more than 4 entries attempted" do
      allow(controller).to receive(:current_user) {users(:mog)}
      allow(Date).to receive(:today) { Date.new(2021, 12, 25) }
      post :create
      post :create
      post :create
      post :create
      post :create
      expect(Entry.where(entry_date: '2021-12-25').count).to eq(4)
      expect(flash[:too_many_entries]).to eq("Too many entries")
    end
  end
end
