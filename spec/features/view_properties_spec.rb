feature 'View Properties' do
  scenario 'A user can view a list of listing descriptions alongside their titles' do
    insert_test_properties
    visit('/properties')
    expect(page).to have_content 'Test Property'
    expect(page).to have_content 'Example Property'
    expect(page).to have_content 'Fake Property'
    expect(page).to have_content 'This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland'
    expect(page).to have_content 'This property is a lovely example property brought to you by example property enterprises situated in example, exampleland'
    expect(page).to have_content 'This property is a lovely test property brought to you by test property co situated in test, testland'
  end
end