describe Property do
  it 'creates a new session' do
  end

  it 'responds to the .all method by returning each property' do
    connection = PG.connect(dbname: 'makersbnb_test')

    connection.exec("INSERT INTO properties (listing_title) VALUES('Fake Property')")
    connection.exec("INSERT INTO properties (listing_title) VALUES('Test Property')")
    connection.exec("INSERT INTO properties (listing_title) VALUES('Example Property')")

    expect(Property.all).to include "Fake Property"
    expect(Property.all).to include "Test Property"
    expect(Property.all).to include "Example Property"
  end
end

