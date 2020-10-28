def test_properties
  test_connection
  @connection.exec("INSERT INTO properties (listing_title, listing_description) VALUES('Fake Property', 'This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland')")
  @connection.exec("INSERT INTO properties (listing_title, listing_description) VALUES('Example Property', 'This property is a lovely example property brought to you by example property enterprises situated in example, exampleland')")
  @connection.exec("INSERT INTO properties (listing_title, listing_description) VALUES('Test Property', 'This property is a lovely test property brought to you by test property co situated in test, testland')")
end

def test_connection
  @connection = PG.connect :dbname => 'makers_bnb_manager_test'
end

def test_add_user
  test_connection
  @connection.exec("INSERT INTO users (name, user_name) VALUES ('Bob', 'bob_009');")
end

def parse_date_to_s(month, day, year)
  Date.parse "#{year}-#{month}-#{day}"
end