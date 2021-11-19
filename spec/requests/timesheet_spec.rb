require 'rails_helper'

RSpec.describe TimesheetController, type: :controller do
  fixtures :users, :entries

  before(:each) { allow(controller).to receive(:current_user) {users(:mog)} }

  describe "timesheet#show" do
    it "returns a 200 status code" do
      post :show, params: { year: '2021', week_number: 42 }
      expect(response).to have_http_status(200)
    end

    it "returns a spreadsheet" do
      post :show, params: { year: '2021', week_number: '46' }, format: :xlsx
      expect(response.headers['Content-Disposition']).to eq("attachment; filename=#{Date.today}-timesheet-2021-46.xlsx")
    end
  end

  describe "timesheet#week" do
    it "should allow a user to select a specific week to view timesheet" do
      post :week, params: { week: "2021-W46" }
      expect(response).to redirect_to('/timesheet/2021/46')
    end
  end

  describe "timesheet#current" do
    it 'redirects to the current timesheet' do
      allow(Time).to receive(:now) { Time.new(2021, 11, 18) }
      get :current
      expect(response).to redirect_to('/timesheet/2021/46')
    end
  end
end
