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

  describe "timesheet#patch_edit" do
    it 'updates the entry time and redirects to the timesheet' do
      patch :patch_edit, params: {year: '2021', week: '46', entry_date: '2021-11-15', entry_type: 0, entry: {entry_time: '09:35:00'}}
      entry = Entry.where(entry_date: '2021-11-15', entry_type: '0').first
      
      expect(response).to redirect_to('/timesheet/2021/46')
      expect(entry.entry_time).to eq Time.new(2000, 1, 1, 9, 35)
    end
  end

  describe "timesheet#post_edit" do
    it 'updates the entry time and redirects to the timesheet' do
      post :post_edit, params: {year: '2021', week: '47', entry_date: '2021-11-22', entry_type: 0, entry: {entry_time: '09:35:00'}}
      entry = Entry.where(entry_date: '2021-11-22', entry_type: '0').first
      
      expect(response).to redirect_to('/timesheet/2021/47')
      expect(entry.entry_time).to eq Time.new(2000, 1, 1, 9, 35)
    end
  end
end
