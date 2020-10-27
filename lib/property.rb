require 'pg'

class Property

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname:'makersbnb_test')
    else
      connection = PG.connect(dbname:'makersbnb')
    end

    result = connection.exec("SELECT * FROM properties;")
    result.map {|property| property['listing_title']}

  end

end