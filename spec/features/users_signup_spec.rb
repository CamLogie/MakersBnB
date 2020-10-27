feature 'Homepage' do

  scenario 'displays the name of the website' do
    visit '/'
    expect(page).to have_content 'Welcome to MakersBnB'
  end

  scenario 'enables the user to sign up' do
    visit '/'
    fill_in(:name, with: 'Bob')
    fill_in(:user_name, with: 'Bob_007')
    click_button('Submit')
    expect(page).to have_content 'Hey Bob! Are you renting or hosting?'
  end

  scenario 'does not allow double sign-up' do
    test_add_user

    visit '/'
    fill_in(:name, with: 'Bob')
    fill_in(:user_name, with: 'Bob_009')
    click_button('Submit')
    expect(page).to have_content 'This user name is already registered!'
  end
end

