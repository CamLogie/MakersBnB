describe Property do

  let(:start_date) { "2020-10-29" }
  let(:end_date) { "2020-10-30" }
  # let(:user) { User.new(name: 'Tim', user_name: 'timcg', id: 1) }
  let(:user) { double :user, name: "Bob", user_name: "bob_00.7", id: '1' }

  it 'responds to the .all method by returning each property' do
    Property.add("Fake Property 1", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland", start_date, end_date, user.id)
    Property.add("Test Property 1", "This property is a lovely test property brought to you by test property co situated in test, testland", start_date, end_date, user.id)
    Property.add("Example Property 1", "This property is a lovely example property brought to you by example property enterprises situated in example, exampleland", start_date, end_date, user.id)
    fake_property = Property.all[0]
    test_property = Property.all[1]
    example_property = Property.all[-1]

    expect(fake_property.title).to include "Fake Property 1"
    expect(test_property.title).to include "Test Property 1"
    expect(example_property.title).to include "Example Property 1"
  end

  it 'responds to the .add method by adding a property listing title and description to the database' do
    fake_property = Property.add("Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland", start_date , end_date, user.id)
    expect(fake_property).to be_a Property
    expect(fake_property.title).to eq "Fake Property"
    expect(fake_property.description).to eq "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland"
    expect(fake_property.unavailable_dates).to eq ["2020-10-29", "2020-10-30"]
  end

  it 'pulls in the users listing via the user id' do
    
    # double(:user) { name: "Bob", user_name: "bob_00.7", id: '1'  }
    Property.add("Tims place", "Great views of Camerons place not to be missed", start_date, end_date, user.id)
    tims_place = Property.all[0]
    expect(tims_place.user_id).to eq '1'
  end

end

