require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#format_entries" do
    it "Formats an entry in HH:MM" do
      day = Entry.where(entry_date: '2021-11-17')
      entry_type = 0      # AM Start

      expect(helper.format_entries(day, entry_type)).to eq('09:00')
    end

    it "formats empty entry with -" do
      day = Entry.where(entry_date: '2020-11-17')
      entry_type = 0

      expect(helper.format_entries(day, entry_type)).to eq('-')
    end
  end

  describe "#format_date_yyyy_mm_dd_as_dd_mm_yy" do
    it 'formats the date' do
      expect(format_date_yyyy_mm_dd_as_dd_mm_yy('2021-11-16')).to eq('16/11/21')
    end
  end

  describe "#daily_total_time_worked" do
    it 'returns the total time worked when passed all the entries for a day' do
      day = Entry.where(entry_date: '2021-11-15')
      expect(helper.daily_total_time_worked(day)).to eq ' 6:59'  
    end

    it 'returns the total time when only am values filled in' do
      Entry.create(user_id: 1, entry_date: Date.new(2021,12,15), entry_type: 0, entry_time: Time.new(2000,1,1,9,0,0))
      Entry.create(user_id: 1, entry_date: Date.new(2021,12,15), entry_type: 1, entry_time: Time.new(2000,1,1,12,30,0))
      day = Entry.where(entry_date: '2021-12-15')

      expect(helper.daily_total_time_worked(day)).to eq ' 3:30'
    end

    it 'returns the total time when only am values filled in' do
      Entry.create(user_id: 1, entry_date: Date.new(2021,12,15), entry_type: 2, entry_time: Time.new(2000,1,1,13,0,0))
      Entry.create(user_id: 1, entry_date: Date.new(2021,12,15), entry_type: 3, entry_time: Time.new(2000,1,1,17,30,0))
      day = Entry.where(entry_date: '2021-12-15')

      expect(helper.daily_total_time_worked(day)).to eq ' 4:30'
    end
    
    it 'returns 0:00 when no entries made' do
      day = Entry.where(entry_date: '2021-12-16')
      expect(helper.daily_total_time_worked(day)).to eq ' 0:00'
    end
  end

  describe '#weekly_total_time' do
    it 'returns the weekly total time worked' do
      dates = ['2021-11-15', '2021-11-16', '2021-11-17', '2021-11-18', '2021-11-19', ]
      week = dates.map { |date| Entry.where(entry_date: date) }
      
      expect(weekly_total_time(week)).to eq('34:59')
    end

    it 'returns the weekly total time worked as 00:00' do
      dates = ['2021-11-22', '2021-11-23', '2021-11-24', '2021-11-25', '2021-11-26', ]
      week = dates.map { |date| Entry.where(entry_date: date) }
      
      expect(weekly_total_time(week)).to eq('0:00')
    end
  end
end
