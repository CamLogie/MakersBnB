require_relative '../../lib/availability'

describe Availability do
  let(:today_date) { Date.today }
  let(:day) { today_date.day}
  let(:month) { today_date.month }
  let(:year) { today_date.year }

  it 'takes in one unavailable and creates an available range' do
    today_formatted = today_date.strftime('%Y-%m-%d')
    new_range = Availability.set_available_dates(today_formatted)
    
    expect(new_range.availability).to be_a Array 
    expect(new_range.availability).not_to include(today_date)
  end

  it 'creates available dates from a given array' do
    end_date = parse_date(month, (day + 3), year)
    start_date_string = today_date.strftime('%Y-%m-%d')
    end_date_string = end_date.to_s
    new_range = Availability.set_available_dates([start_date_string, end_date_string])
    
    expect(new_range.availability).to be_a Array
    (today_date..end_date).each do |unavailable_date|
      expect(new_range.availability).not_to include(unavailable_date)
    end
  end

end
