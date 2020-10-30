feature 'View Properties' do
  let(:user) { User.new(name: 'Tim', user_name: 'timcg', id: 1) }
  
  scenario 'A user can view a list of properties, their locations, and prices' do
    insert_test_properties
    visit('/properties')
    expect(page).to have_content 'Test Property'
    expect(page).to have_content 'Example Property'
    expect(page).to have_content 'Fake Property'
    expect(page).to have_content '£150'
    expect(page).to have_content 'London Test'
  end


  scenario 'allows a user to choose an available date' do
    insert_test_properties
    visit('/properties')
    first('.property').click_button 'View Property'
    select(three_days_from_now, from: "available_dates")
    click_button 'Request Date'
    expect(page).to have_content "Your request has been approved!"
  end

  scenario 'it allows you to navigate to a specific property page' do 
    insert_test_properties
    visit('/properties')
    first('.property').click_button 'View Property'
    expect(page).to have_content("Fake Property")
    expect(page).to have_content("This property is a lovely fake property brought to you by fake property ltd situated in fake, fakeland")
  end

end