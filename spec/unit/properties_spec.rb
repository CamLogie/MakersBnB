describe Property do
  it 'creates a new session' do
  end

  it 'responds to the .all method by returning each property' do
    expect(Property.all).to include "Fake Property"
    expect(Property.all).to include "Test Property"
    expect(Property.all).to include "Example Property"
  end
end

