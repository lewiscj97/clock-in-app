require 'rails_helper'

RSpec.describe TimesheetController, type: :controller do
  fixtures :users, :entries

  describe "timesheet#show" do
    it "returns a 200 status code" do
      allow(controller).to receive(:current_user) {users(:mog)}
      post :show, params: {year: '2021', week_number: 42}
      expect(response).to have_http_status(200)
    end
  end

  describe "timesheet#week" do
    it "should allow a user to select a specific week to view timesheet" do
      allow(controller).to receive(:current_user) {users(:mog)}
      post :week, params: {week: "2021-W46"}
      expect(response).to redirect_to('/timesheet/2021/46')
    end
  end
end
