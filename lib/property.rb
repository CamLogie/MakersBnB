require 'pg'

class Property

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname:'makers_bnb_manager_test')
    else
      connection = PG.connect(dbname:'makers_bnb_manager')
    end

    result = connection.exec("SELECT * FROM properties;")
    result.map {|property| [property['listing_title'], property['listing_description']] }

  end

  def self.add(listing_title, listing_description)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname:'makers_bnb_manager_test')
    else
      connection = PG.connect(dbname:'makers_bnb_manager')
    end

    connection.exec("INSERT INTO properties (listing_title, listing_description) VALUES('#{listing_title}', '#{listing_description}')")

  end

end