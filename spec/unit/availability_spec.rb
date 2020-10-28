require_relative '../../lib/availability'

describe Availability do
  let(:today) { Date.today }
  let(:month) { today.month }
  let(:year) { today.year }

  it 'takes in one unavailable and creates an available range' do
    today_formatted = today.strftime('%Y-%m-%d')
    new_range = Availability.available_dates(today_formatted)
    
    expect(new_range.availability).to be_a Array 
    expect(new_range.availability).not_to include(today)
  end

end
