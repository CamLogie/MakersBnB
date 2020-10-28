# ------

# Date class that saves/formats and wraps date availability from Property Database

class Availability
  THIS_MONTH = Date.today.month
  THIS_YEAR = Date.today.year

  attr_reader :availability

  def initialize(availability)
    @availability = availability
  end

  #Will need a method to check renter request against availability array

  #This receives the unavailable dates from the host, one day at a time
  def self.set_available_dates(date)
    @date = date
    @first_day = Date.new(THIS_YEAR, THIS_MONTH, 1)
    @last_day = Date.new(THIS_YEAR, THIS_MONTH, -1)
    @avail_array = []

    find_dates_in_range if date.is_a? Array
    make_available_dates(date) unless date.is_a? Array

    Availability.new(@avail_array.uniq)
  end

  def self.date_included?
    (@first_day..@last_day).cover?(@date)
  end

  def self.make_available_dates(date)
    parsed_date = Date.parse(date)
    if date_included?
      (@first_day..@last_day).each do |day| 
        @avail_array << day unless day == parsed_date
      end
    end
  end

  def self.find_dates_in_range
    @date.each do |single_date|
      make_available_dates(single_date)
    end
  end

  def is_available?(date)
    date = Date.parse(date)
    @availability.include?(date)
  end

end
