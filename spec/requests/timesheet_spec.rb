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
end
