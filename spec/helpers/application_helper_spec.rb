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
  end
end
