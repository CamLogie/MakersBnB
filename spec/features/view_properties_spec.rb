feature 'View Properties' do
  scenario 'A user can view a list of property names' do
    connection = PG.connect(dbname: 'makersbnb_test')

    connection.exec("INSERT INTO properties (listing_title) VALUES('Fake Property')")
    connection.exec("INSERT INTO properties (listing_title) VALUES('Test Property')")
    connection.exec("INSERT INTO properties (listing_title) VALUES('Example Property')")

    visit('/properties_list')
    expect(page).to have_content 'Test Property'
    expect(page).to have_content 'Example Property'
    expect(page).to have_content 'Fake Property'
  end
end