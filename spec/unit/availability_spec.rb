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

  it 'checks the availablity of given date' do
    today_date_now = today_date.strftime('%Y-%m-%d')
    unavail_1 = "#{year}-#{month}-#{(day-11)}"
    unavail_2 = "#{year}-#{month}-#{(day+3)}"
    
    unavailable_dates = [unavail_1, unavail_2]
    available_range = Availability.set_available_dates(unavailable_dates)

    expect(available_range.is_available?(today_date_now)).to be false
  end
end
