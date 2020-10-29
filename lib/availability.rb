# ------

# Date class that saves/formats and wraps date availability from Property Database

class Availability
  THIS_MONTH = Date.today.month
  THIS_YEAR = Date.today.year

  attr_reader :availability

  def initialize
    @availability = []
  end

  def available?(date)
    @availability.include?(parse_date(date))
  end

  def range_available?(desired_dates)
    desired_dates.each do |date|
      date = parse_date(date)
      return false unless @availability.include?(date)
    end
    true
  end

  # Will need a method to check renter request against availability array

  # This receives the unavailable dates from the host, 
  # either as an individual string, or Array in this format: [start_date,end_date]
  def create_available_dates(date)
    @date = date
    @first_day = Date.new(THIS_YEAR, THIS_MONTH, 1)
    @last_day = Date.new(THIS_YEAR, THIS_MONTH, -1)
    @avail_array = populate_month

    find_dates_in_range if date.is_a? Array
    make_available_dates(date) unless date.is_a? Array

    @availability = @avail_array
  end

  private

  def choose_avail_array
    return populate_month unless @availability

    @availability
  end

  def populate_month
    return @availability unless @availability.empty?

    months = []
    (@first_day..@last_day).each do |day|
      months << day
    end
    months
  end

  def find_dates_in_range
    generate_start_and_end
    (@start_date..@end_date).each do |single_date|
      make_available_dates(single_date)
    end
  end

  def make_available_dates(date)
    @formatted_date = parse_date(date)
    find_and_delete_unavailable_dates
  end

  def find_and_delete_unavailable_dates
    @avail_array.delete(@formatted_date) if @avail_array.include?(@formatted_date)
  end

  def generate_start_and_end
    @start_date = parse_date(@date[0])
    @end_date = parse_date(@date[-1])
  end

  def parse_date(date)
    return date if date.is_a? Date

    Date.parse(date)
  end
end
