describe Property do
  it 'creates a new session' do
  end

  it 'responds to the .all method by returning each property' do
    test_properties
    expect(Property.all).to include ["Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland"]
    expect(Property.all).to include ["Test Property", "This property is a lovely test property brought to you by test property co situated in test, testland"]
    expect(Property.all).to include ["Example Property", "This property is a lovely example property brought to you by example property enterprises situated in example, exampleland"]
  end

  it 'responds to the .add method by adding a property listing title and description to the database' do
    Property.add("Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland")
    expect(Property.all).to include ["Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland"]
  end
end

