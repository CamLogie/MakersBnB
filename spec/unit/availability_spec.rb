require_relative '../../lib/availability'

describe Availability do
  let(:today_date) { DateTime.now }
  let(:day) { today_date.day }
  let(:month) { today_date.month }
  let(:year) { today_date.year }
  let(:today_formatted) { today_date.strftime '%Y-%m-%d' }

  let(:tomorrow_string) { today_date.next_day(1).strftime '%Y-%m-%d' }
  let(:unavail_end) { today_date.next_day(5).strftime '%Y-%m-%d'}
  let(:unavailable_dates) { [today_formatted, unavail_end] }

  before :each do 
    @avail_object = Availability.new
  end
 
  it 'takes in one unavailable and creates an available range' do
    @avail_object.create_available_dates(today_formatted)
    
    expect(@avail_object.availability).to be_a Array 
    expect(@avail_object.availability).not_to include(today_date)
  end

  it 'creates available dates from a given array' do
    end_date = today_date.next_day(3)
    end_date_string = end_date.strftime '%Y-%m-%d'
    @avail_object.create_available_dates([today_formatted, end_date_string])
    
    expect(@avail_object.availability).to be_a Array
    (today_date..end_date).each do |unavailable_date|
      expect(@avail_object.availability).not_to include(unavailable_date)
    end
  end

  it 'can update an existing availability array' do
    tomorrow_date = today_date.next_day(1)
    expect(@avail_object.availability).to be_empty

    @avail_object.create_available_dates(today_formatted)

    expect(@avail_object.availability).to include(tomorrow_date)
    expect(@avail_object.availability).not_to include(today_formatted)

    @avail_object.create_available_dates(tomorrow_string)

    expect(@avail_object.availability).not_to include(tomorrow_date)
  end

  describe "#range_is_available" do
    it 'checks the availablity of given date' do
      @avail_object.create_available_dates(unavailable_dates)

      expect(@avail_object.available?(today_formatted)).to be false
    end

    it 'returns false if the desired dates are not available' do
      unavailable_desired_dates = [
        today_formatted, 
        tomorrow_string, 
        (today_date.next_day(2).strftime '%Y-%m-%d')
      ]
      @avail_object.create_available_dates(unavailable_dates)
      expect(@avail_object.range_available?(unavailable_desired_dates)).to be false
    end

    it 'returns true if the range of dates are available' do
      available_desired_dates = [
        (today_date.next_day(6).strftime '%Y-%m-%d'), 
        (today_date.next_day(7).strftime '%Y-%m-%d'), 
        (today_date.next_day(20).strftime '%Y-%m-%d')
      ]
      @avail_object.create_available_dates(unavailable_dates)
      expect(@avail_object.range_available?(available_desired_dates)).to eq true
    end
  end
end
