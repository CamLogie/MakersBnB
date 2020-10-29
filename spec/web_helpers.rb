def insert_test_properties
  test_connection
  Property.add("Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland")
  Property.add("Test Property", "This property is a lovely test property brought to you by test property co situated in test, testland")
  Property.add("Example Property", "This property is a lovely example property brought to you by example property enterprises situated in example, exampleland")
  Property.add("Unavailable Property", "This property is probably to bougie for you.")
  test_add_unavailable_date
end

def test_connection
  @connection = PG.connect :dbname => 'makers_bnb_manager_test'
end

def test_add_user
  test_connection
  @connection.exec("INSERT INTO users (name, user_name) VALUES ('Bob', 'bob_009');")
end

def test_add_unavailable_date
  test_connection
  today_date = DateTime.now
  result = @connection.exec(
    # Updating properties sends them to the end of the list in SQL Table
    "UPDATE properties
    SET 
      unavailable_dates = '#{today_date.strftime('%Y-%m-%d')}'
    WHERE
      listing_title = 'Unavailable Property';" 
    )
end
