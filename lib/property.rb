require 'pg'
require_relative 'availability'

class Property

  attr_reader :id, :title, :description, :availability, :unavailable_dates, :price_per_night, :listing_location

  def self.all

    environment_var

    result = @@connection.exec("SELECT * FROM properties;")
    result.map do |property| 
      Property.new(id: property['id'], 
      title: property['listing_title'], 
      description: property['listing_description'], 
      unavailable_dates: property['unavailable_dates'], 
      price_per_night: property['price_per_night'],
      listing_location: property['listing_location'] 
      )
    end
  end

  def self.add(listing_title, listing_description, start_date, end_date, price_per_night, listing_location)

    environment_var

    listing_title = format_apostrophes(listing_title)
    listing_description = format_apostrophes(listing_description)

    result = @@connection.exec(
      "INSERT INTO properties (listing_title, listing_description, unavailable_dates, price_per_night, listing_location) 
      VALUES('#{listing_title}', '#{listing_description}', '#{start_date},#{end_date}', '#{price_per_night}', '#{listing_location}' ) 
      RETURNING id, listing_title, listing_description, unavailable_dates, price_per_night, listing_location"
      )
    Property.new(id: result[0]['id'], title: result[0]['listing_title'], description: result[0]['listing_description'],
       unavailable_dates: result[0]['unavailable_dates'], price_per_night: result[0]['price_per_night'], listing_location: result[0]['listing_location'])

  end

  def self.environment_var
    if ENV['RACK_ENV'] == 'test'
      @@connection = PG.connect(dbname:'makers_bnb_manager_test')
    else
      @@connection = PG.connect(dbname:'makers_bnb_manager')
    end
  end

  def self.format_apostrophes(string)
    string.split("'").join("''")
  end

  def initialize(id:, title:, description:, unavailable_dates:, price_per_night:, listing_location: )
    @id = id
    @title = title
    @description = description
    @unavailable_dates = unavailable_dates.split(",")
    @availability = create_property_availability
    @price_per_night = price_per_night
    @listing_location = listing_location
  end
  
  def create_property_availability
    Availability.new.create_available_dates(@unavailable_dates)
  end


end