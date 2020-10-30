feature 'Sign Out' do
  scenario 'A logged in user can sign out' do
    sign_in_with_existing_username
    expect(page).to have_content 'Available Properties'
    
    click_button 'Log Out'

    expect(page).to_not have_content 'Available Properties'
    expect(page).to have_content 'Welcome to MakersBnB'
  end
end
