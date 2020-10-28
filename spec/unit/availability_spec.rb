require_relative '../../lib/availability'

describe Availability do
  let(:today_date) { Date.today }
  let(:day) { today_date.day}
  let(:month) { today_date.month }
  let(:year) { today_date.year }
  let(:unavail_start) { "#{year}-#{month}-#{(day-5)}" }
  let(:unavail_end) { "#{year}-#{month}-#{(day+3)}" }
  let(:unavailable_dates) { [unavail_start, unavail_end] }
 
  it 'takes in one unavailable and creates an available range' do
    today_formatted = today_date.strftime('%Y-%m-%d')
    new_range = Availability.set_available_dates(today_formatted)
    
    expect(new_range.availability).to be_a Array 
    expect(new_range.availability).not_to include(today_date)
  end

  it 'creates available dates from a given array' do
    end_date = parse_date_to_s(month, (day + 3), year)
    start_date_string = today_date.strftime('%Y-%m-%d')
    end_date_string = end_date.to_s
    new_range = Availability.set_available_dates([start_date_string, end_date_string])
    
    expect(new_range.availability).to be_a Array
    new_range.availability
    (today_date..end_date).each do |unavailable_date|
      expect(new_range.availability).not_to include(unavailable_date)
    end
  end

  describe "#range_is_available" do
    it 'checks the availablity of given date' do
      today_date_now = today_date.strftime('%Y-%m-%d')
      available_range = Availability.set_available_dates(unavailable_dates)
      expect(available_range.is_available?(today_date_now)).to be false
   end

    it 'returns false if the desired dates are not available' do
     unavailable_desired_dates = ["#{year}-#{month}-#{day}", "#{year}-#{month}-#{(day+1)}", "#{year}-#{month}-#{(day+2)}"]
     available_range = Availability.set_available_dates(unavailable_dates)
     expect(available_range.range_is_available?(unavailable_desired_dates)).to be false
    end

    it 'returns true if the range of dates are available' do
      available_desired_dates = available_desired_dates = ["#{year}-#{month}-#{day-13}", "#{year}-#{month}-#{day-14}", "#{year}-#{month}-#{day-15}"]
      available_range = Availability.set_available_dates(unavailable_dates)
      expect(available_range.range_is_available?(available_desired_dates)).to eq true
    end
  end
end
