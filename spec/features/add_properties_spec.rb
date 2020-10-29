feature 'Add new property' do
  scenario 'A user can add a new property with a description via a form' do
    sign_in_and_click
    fill_in(:listing_title, with: 'Test Property')
    fill_in(:listing_description, with: 'This property is a lovely test property brought to you by test property co situated in test, testland')
    click_button('Submit')
    expect(page).to have_content 'Test Property'
    expect(page).to have_content 'This property is a lovely test property brought to you by test property co situated in test, testland'
  end

  scenario 'A user can add a new property title and description with as many apostrophes as they\'d like' do 
    sign_in_and_click
    fill_in(:listing_title, with: "Test's Property")
    fill_in(:listing_description, with: "This property is a lovely test property brought to you by test property co situated in tes't, testland")
    click_button('Submit')
    expect(page).to have_content "Test's Property"
    expect(page).to have_content "This property is a lovely test property brought to you by test property co situated in tes't, testland"
  end

  scenario 'A user can add a start date and end date to their listing via a calendar form'do 
    test_connection
    sign_in_and_click
    # visit('properties/add_new')
    fill_in(:listing_title, with: "Test Date Property")
    fill_in(:listing_description, with: "This property is a lovely DATE property brought to you by test property co situated in test, testland")
    fill_in(:start_date, with: "2020-10-29")
    fill_in(:end_date, with: "2020-10-30")
    click_button('Submit')
    expect(page).to have_content "Test Date Property"
    expect(page).to have_content "This property is a lovely DATE property brought to you by test property co situated in test, testland"
  end
end
