describe Property do
  it 'creates a new session' do
  end

  it 'responds to the .all method by returning each property' do
    insert_test_properties
    fake_property = Property.all[0]
    test_property = Property.all[1]
    example_property = Property.all[-2]

    expect(fake_property.title).to include "Fake Property"
    expect(test_property.title).to include "Test Property"
    expect(example_property.title).to include "Example Property"
  end

  it 'responds to the .add method by adding a property listing title and description to the database' do
    fake_property = Property.add("Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland")
    expect(fake_property).to be_a Property
    expect(fake_property.title).to eq "Fake Property"
    expect(fake_property.description).to eq "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland"
  end
end

