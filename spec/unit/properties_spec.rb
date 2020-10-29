describe Property do

  let(:start_date) { "2020-10-29" }
  let(:end_date) { "2020-10-30" }
  let(:price_per_night) { '150' }
  let(:location) { 'London Test'}



  it 'responds to the .all method by returning each property' do
    Property.add("Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland", start_date, end_date, price_per_night, location)
    Property.add("Test Property", "This property is a lovely test property brought to you by test property co situated in test, testland", start_date, end_date, price_per_night, location)
    Property.add("Example Property", "This property is a lovely example property brought to you by example property enterprises situated in example, exampleland", start_date, end_date, price_per_night, location)
    fake_property = Property.all[0]
    test_property = Property.all[1]
    example_property = Property.all[-1]

    expect(fake_property.title).to include "Fake Property"
    expect(test_property.title).to include "Test Property"
    expect(example_property.title).to include "Example Property"
  end

  it 'responds to the .add method by adding a property listing title and description to the database' do
    fake_property = Property.add("Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland", start_date , end_date, price_per_night, location)
    expect(fake_property).to be_a Property
    expect(fake_property.title).to eq "Fake Property"
    expect(fake_property.description).to eq "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland"
    expect(fake_property.unavailable_dates).to eq ["2020-10-29", "2020-10-30"]
  end

  it 'responds to the .price_per_night method by returning the price per night' do
    fake_property = Property.add("Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland", start_date , end_date, price_per_night, location)
    expect(fake_property.price_per_night).to eq "150"
  end

  it 'responds to the .listing_location method by returning the location' do
    fake_property = Property.add("Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland", start_date , end_date, price_per_night, location)
    expect(fake_property.listing_location).to eq 'London Test'
  end

end

