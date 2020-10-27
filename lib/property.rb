require 'pg'

class Property

  def self.all
    connection = PG.connect(dbname:'makersbnb')
    result = connection.exec("SELECT * FROM properties;")
    result.map {|property| property['listing_title']}

  end

end