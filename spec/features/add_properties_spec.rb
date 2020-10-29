feature 'Add new property' do
  scenario 'A user can add a new property with a description via a form' do
    test_connection
    visit('properties/add_new')
    fill_in(:listing_title, with: 'Test Property')
    fill_in(:listing_description, with: 'This property is a lovely test property brought to you by test property co situated in test, testland')
    click_button('Submit')
    expect(page).to have_content 'Test Property'
    expect(page).to have_content 'This property is a lovely test property brought to you by test property co situated in test, testland'
  end

  scenario 'A user can add a new property title and description with as many apostrophes as they\'d like' do 
    test_connection
    visit('properties/add_new')
    fill_in(:listing_title, with: "Test's Property")
    fill_in(:listing_description, with: "This property is a lovely test property brought to you by test property co situated in tes't, testland")
    click_button('Submit')
    expect(page).to have_content "Test's Property"
    expect(page).to have_content "This property is a lovely test property brought to you by test property co situated in tes't, testland"
  end
end
