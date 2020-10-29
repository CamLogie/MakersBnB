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
end
