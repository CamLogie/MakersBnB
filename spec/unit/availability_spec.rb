require_relative '../../lib/availability'

describe Availability do
  let(:today_date) { Date.today }
  let(:day) { today_date.day}
  let(:month) { today_date.month }
  let(:year) { today_date.year }
  let(:tomorrow_string) { "#{year}-#{month}-#{(day+1)}" }
  let(:unavail_start) { "#{year}-#{month}-#{(day-5)}" }
  let(:unavail_end) { "#{year}-#{month}-#{(day+3)}" }
  let(:unavailable_dates) { [unavail_start, unavail_end] }

  before :each do 
    @avail_object = Availability.new
    @today_formatted = today_date.strftime('%Y-%m-%d')
  end
 
  it 'takes in one unavailable and creates an available range' do
    @avail_object.set_available_dates(@today_formatted)
    
    expect(@avail_object.availability).to be_a Array 
    expect(@avail_object.availability).not_to include(today_date)
  end

  it 'creates available dates from a given array' do
    end_date = parse_date_to_s(month, (day + 3), year)
    @avail_object.set_available_dates([@today_formatted, end_date])
    
    expect(@avail_object.availability).to be_a Array
    (today_date..end_date).each do |unavailable_date|
      expect(@avail_object.availability).not_to include(unavailable_date)
    end
  end

  it 'can update an existing availability array' do
    tomorrow = Date.parse(tomorrow_string)
    expect(@avail_object.availability).to be_empty

    @avail_object.set_available_dates(@today_formatted)

    expect(@avail_object.availability).to include(tomorrow)
    expect(@avail_object.availability).not_to include(@today_formatted)

    @avail_object.set_available_dates(tomorrow_string)

    expect(@avail_object.availability).not_to include(tomorrow)
  end

  describe "#range_is_available" do
    it 'checks the availablity of given date' do
      today_date_now = today_date.strftime('%Y-%m-%d')
      @avail_object.set_available_dates(unavailable_dates)
      expect(@avail_object.is_available?(today_date_now)).to be false
   end

    it 'returns false if the desired dates are not available' do
     unavailable_desired_dates = ["#{year}-#{month}-#{day}", tomorrow_string, "#{year}-#{month}-#{(day+2)}"]
     @avail_object.set_available_dates(unavailable_dates)
     expect(@avail_object.range_is_available?(unavailable_desired_dates)).to be false
    end

    it 'returns true if the range of dates are available' do
      available_desired_dates = available_desired_dates = ["#{year}-#{month}-#{day-13}", "#{year}-#{month}-#{day-14}", "#{year}-#{month}-#{day-15}"]
      @avail_object.set_available_dates(unavailable_dates)
      expect(@avail_object.range_is_available?(available_desired_dates)).to eq true
    end
  end
end
