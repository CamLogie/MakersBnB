require 'pg'

class Property

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname:'makersbnb_test')
    else
      connection = PG.connect(dbname:'makersbnb')
    end

    result = connection.exec("SELECT * FROM properties;")
    result.map {|property| [property['listing_title'], property['listing_description']] }

  end

  def self.add(listing_title, listing_description)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname:'makersbnb_test')
    else
      connection = PG.connect(dbname:'makersbnb')
    end

    connection.exec("INSERT INTO properties (listing_title, listing_description) VALUES('#{listing_title}', '#{listing_description}')")

  end

end