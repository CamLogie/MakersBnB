require 'pg'

class Property

  attr_reader :id, :title, :description, :availability
  
  def initialize
    avail_object = Availbility.new
    @availability = avail_object.create_available_dates([])
  end


  def self.all

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname:'makers_bnb_manager_test')
    else
      connection = PG.connect(dbname:'makers_bnb_manager')
    end

    result = connection.exec("SELECT * FROM properties;")
    result.map {|property| Property.new(id: property['id'], title: property['listing_title'], description: property['listing_description']) }

  end

  def self.add(listing_title, listing_description)

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname:'makers_bnb_manager_test')
    else
      connection = PG.connect(dbname:'makers_bnb_manager')
    end

    result = connection.exec("INSERT INTO properties (listing_title, listing_description) VALUES('#{listing_title}', '#{listing_description}') 
    RETURNING id, listing_title, listing_description")

    Property.new(id: result[0]['id'], title: result[0]['listing_title'], description: result[0]['listing_description'])

  end

  def initialize(id:, title:, description:)
    @id = id
    @title = title
    @description = description
  end

end