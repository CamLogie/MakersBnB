describe Property do

  let(:today_date) { DateTime.now }
  let(:today) { today_date.strftime '%Y-%m-%d' }
  let(:tomorrow) { today_date.next_day(1).strftime '%Y-%m-%d' }
  let(:three_days_from_now) { today_date.next_day(3).strftime '%Y-%m-%d' }
  let(:start_date) { "2020-10-29" }
  let(:end_date) { "2020-10-30" }
  let(:price_per_night) { '150' }
  let(:location) { 'London Test'}
  let(:user) { double :user, name: "Bob", user_name: "bob_00.7", id: '1' }


  it 'responds to the .all method by returning each property' do
    Property.add("Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland",
    start_date, end_date, price_per_night, location, user.id)
    Property.add("Test Property", "This property is a lovely test property brought to you by test property co situated in test, testland",
    start_date, end_date, price_per_night, location, user.id)
    Property.add("Example Property", "This property is a lovely example property brought to you by example property enterprises situated in example, exampleland",
    start_date, end_date, price_per_night, location, user.id)
    
    fake_property = Property.all[0]
    test_property = Property.all[1]
    example_property = Property.all[-1]

    expect(fake_property.title).to include "Fake Property"
    expect(test_property.title).to include "Test Property"
    expect(example_property.title).to include "Example Property"
  end

  it 'responds to the .add method by adding a property listing title and description to the database' do
    fake_property = Property.add("Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland",
    start_date , end_date, price_per_night, location, user.id)
    expect(fake_property).to be_a Property
    expect(fake_property.title).to eq "Fake Property"
    expect(fake_property.description).to eq "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland"
    expect(fake_property.unavailable_dates).to eq ["2020-10-29", "2020-10-30"]
  end


  it 'responds to the .price_per_night method by returning the price per night' do
    fake_property = Property.add("Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland", 
      start_date , end_date, price_per_night, location, user.id)
    expect(fake_property.price_per_night).to eq "150"
  end

  it 'responds to the .listing_location method by returning the location' do
    fake_property = Property.add("Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland",
      start_date , end_date, price_per_night, location, user.id)
    expect(fake_property.listing_location).to eq 'London Test'


  it 'pulls in the users listing via the user id' do
    Property.add("Tims place", "Great views of Camerons place not to be missed", start_date, end_date, price_per_night, location, user.id)
    tims_place = Property.all[0]
    expect(tims_place.user_id).to eq '1'
  end


  it 'confirms if the property is available on a requested date' do
    fake_property = Property.add("Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland", tomorrow ,
     three_days_from_now, price_per_night, location, user.id)
    expect(fake_property.check_availability?(today)).to be true
    expect(fake_property.check_availability?(tomorrow)).to be false
    expect(fake_property.check_availability?(three_days_from_now)).to be false

  end

end

