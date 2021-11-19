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
end
