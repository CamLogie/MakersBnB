def insert_test_properties
  test_connection
  Property.add("Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland")
  Property.add("Test Property", "This property is a lovely test property brought to you by test property co situated in test, testland")
  Property.add("Example Property", "This property is a lovely example property brought to you by example property enterprises situated in example, exampleland")
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
