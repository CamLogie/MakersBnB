feature 'Add new property' do
  scenario 'A user can add a new property with a description via a form' do
    sign_in_and_click
    fill_in(:listing_title, with: 'Test Property')
    fill_in(:listing_description, with: 'This property is a lovely test property brought to you by test property co situated in test, testland')
    fill_in(:listing_location, with: 'London')
    fill_in(:price_per_night, with: '90')

    click_button('Submit')
    expect(page).to have_content 'Test Property'
    expect(page).to have_content '£90'
    expect(page).to have_content 'London'
  end

  scenario 'A user can add a new property title and description with as many apostrophes as they\'d like' do 
    sign_in_and_click
    fill_in(:listing_title, with: "Test's '''''' Property")
    fill_in(:listing_description, with: "This property is a lovely test property brought to you by test property co situated in tes't, testland")
    fill_in(:listing_location, with: "London's Super Underground Place")
    fill_in(:price_per_night, with: '£190')

    click_button('Submit')
    expect(page).to have_content "Test's '''''' Property"
    expect(page).to have_content '£190'
    expect(page).to have_content "London's Super Underground Place"  
  end

  scenario 'A user can add a start date and end date to their listing via a calendar form' do 
    sign_in_and_click

    fill_in(:listing_title, with: "Test Date Property")
    fill_in(:listing_description, with: "This property is a lovely DATE property brought to you by test property co situated in test, testland")
    fill_in(:start_date, with: "2020-10-29")
    fill_in(:end_date, with: "2020-10-30")
    fill_in(:listing_location, with: "A great place")
    fill_in(:price_per_night, with: '£191')
    click_button('Submit')

    expect(page).to have_content "Test Date Property"
  end

  scenario 'A user can add a price per night and location to their listing' do
    sign_in_and_click
    fill_in(:listing_title, with: "Test Date Property")
    fill_in(:listing_description, with: "This property is a lovely DATE property brought to you by test property co situated in test, testland")
    fill_in(:start_date, with: "2020-10-29")
    fill_in(:end_date, with: "2020-10-30")
    fill_in(:listing_location, with: 'London Test')
    fill_in(:price_per_night, with: '150')
    click_button('Submit')
    
    expect(page).to have_content "Location: London Test"
    expect(page).to have_content "Price per night: £150"
  end
end
