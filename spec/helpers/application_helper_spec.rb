RSpec.describe ApplicationHelper, type: :helper do
  describe "#format_date_yyyy_mm_dd_as_dd_mm_yy" do
    it 'formats the date' do
      expect(format_date_yyyy_mm_dd_as_dd_mm_yy('2021-11-16')).to eq('16/11/21')
    end
  end
end