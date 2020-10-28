# ------

# Date class that saves/formats and wraps date availability from Property Database

class Availability
  THIS_MONTH = Date.today.month
  THIS_YEAR = Date.today.year

  attr_reader :availability

  def initialize(availability)
    @availability = availability
  end

  def self.available_dates(date)
    @date = Date.parse(date)
    @first_day = Date.new(THIS_YEAR, THIS_MONTH, 1)
    @last_day = Date.new(THIS_YEAR, THIS_MONTH, -1)
    availability = []

    if date_included?
      (@first_day..@last_day).each do |day| 
        availability << day unless day == @date
      end
    end

    Availability.new(availability)
  end

  def self.date_included?
    (@first_day..@last_day).cover?(@date)
  end

end
