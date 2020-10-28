def test_properties
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("INSERT INTO properties (listing_title, listing_description) VALUES('Fake Property', 'This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland')")
  connection.exec("INSERT INTO properties (listing_title, listing_description) VALUES('Example Property', 'This property is a lovely example property brought to you by example property enterprises situated in example, exampleland')")
  connection.exec("INSERT INTO properties (listing_title, listing_description) VALUES('Test Property', 'This property is a lovely test property brought to you by test property co situated in test, testland')")
end