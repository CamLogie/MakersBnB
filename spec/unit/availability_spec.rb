require_relative '../../lib/availability'

describe Availability do
  let(:date) { Date.today }
  let(:month) { date.month }
  let(:year) { date.year }

  it 'shows the current month' do 
    expect(Availability.show_month).to eq month
  end

end
