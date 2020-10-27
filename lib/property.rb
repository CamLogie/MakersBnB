require 'pg'

class Property

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname:'makersbnb_test')
    else
      connection = PG.connect(dbname:'makersbnb')
    end

    result = connection.exec("SELECT * FROM properties;")
    p result.map {|property| [property['listing_title'], property['listing_description']] }

  end

end