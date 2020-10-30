describe Property do

  let(:today_date) { DateTime.now }
  let(:today) { today_date.strftime '%Y-%m-%d' }
  let(:tomorrow) { today_date.next_day(1).strftime '%Y-%m-%d' }
  let(:three_days_from_now) { today_date.next_day(3).strftime '%Y-%m-%d' }

  let(:start_date) { "2020-10-29" }
  let(:end_date) { "2020-10-30" }

  it 'responds to the .all method by returning each property' do
    Property.add("Fake Property 1", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland", start_date, end_date)
    Property.add("Test Property 1", "This property is a lovely test property brought to you by test property co situated in test, testland", start_date, end_date)
    Property.add("Example Property 1", "This property is a lovely example property brought to you by example property enterprises situated in example, exampleland", start_date, end_date)
    fake_property = Property.all[0]
    test_property = Property.all[1]
    example_property = Property.all[-1]

    expect(fake_property.title).to include "Fake Property 1"
    expect(test_property.title).to include "Test Property 1"
    expect(example_property.title).to include "Example Property 1"
  end

  it 'responds to the .add method by adding a property listing title and description to the database' do
    fake_property = Property.add("Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland", start_date , end_date)
    expect(fake_property).to be_a Property
    expect(fake_property.title).to eq "Fake Property"
    expect(fake_property.description).to eq "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland"
    expect(fake_property.unavailable_dates).to eq ["2020-10-29", "2020-10-30"]
  end

  it 'confirms if the property is available on a requested date' do
    fake_property = Property.add("Fake Property", "This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland", tomorrow , three_days_from_now)
    
    expect(fake_property.check_availability?(today)).to be true
    expect(fake_property.check_availability?(tomorrow)).to be false
    expect(fake_property.check_availability?(three_days_from_now)).to be false
  end
end

